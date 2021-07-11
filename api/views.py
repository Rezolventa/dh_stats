from django.db.models import IntegerField, Max
from django.db.models.functions import Cast
from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import action
from rest_framework.mixins import ListModelMixin
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet, GenericViewSet

from api.models import Player, MatchResult
from api.serializers import PlayerStatsSerializer, PlayerSerializer


class PlayerEndpoint(ListModelMixin, GenericViewSet):
    queryset = Player.objects.all()

    def get_serializer_class(self):
        if self.action == 'stats':
            return PlayerStatsSerializer
        else:
            return PlayerSerializer

    @action(methods=['GET'], detail=True)
    def stats(self, request, *args, **kwargs):
        player = self.get_object()
        games_played = MatchResult.objects.filter(player=player).count()
        games_as_thrall = MatchResult.objects.filter(player=player, is_thrall=True).count()
        games_as_civil = MatchResult.objects.filter(player=player, is_thrall=False).count()
        wins_as_thrall = MatchResult.objects.filter(
            player=player, is_thrall=True, game_session__expidition_succeed=False
        ).count()
        wins_as_civil = MatchResult.objects.filter(
            player=player, is_thrall=False, game_session__expidition_succeed=True
        ).count()
        wins = wins_as_thrall + wins_as_civil
        losses = games_played - wins
        winrate = wins / games_played if games_played else None
        winrate_as_thrall = wins_as_thrall / games_as_thrall if wins_as_thrall else None
        winrate_as_civil = wins_as_civil / games_as_civil if wins_as_civil else None
        top_role_played = MatchResult.objects.annotate(
            count=Cast(1, output_field=IntegerField())
        ).aggregate(Max('count', output_field=IntegerField())).values()
        scores_sum = MatchResult.objects.aggregate(Max('score', output_field=IntegerField())).get('score_max')
        scores_median = 0
        response_json = {
            'games_played': games_played,
            'wins': wins,
            'losses': losses,
            'winrate': winrate,
            'games_as_thrall': games_as_thrall,
            'wins_as_thrall': wins_as_thrall,
            'winrate_as_thrall': winrate_as_thrall,
            'games_as_civil': games_as_civil,
            'wins_as_civil': wins_as_civil,
            'winrate_as_civil': winrate_as_civil,
            'top_role_played': top_role_played,
            'scores_sum': scores_sum,
            'scores_median': scores_median,
        }
        return Response(status=200, data=self.get_serializer_class()(response_json).data)
