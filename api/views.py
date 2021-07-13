from django.db.models import IntegerField, Max, Sum, Count, Avg
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
        # TODO: move from view to model or service/report
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
        top_played_roles = MatchResult.objects.filter(player=player).values('role__name').annotate(count=Count('role__name')).order_by('-count')
        favourite_role = top_played_roles.first() if top_played_roles.first() else None
        list(MatchResult.objects.filter(player=player).annotate(
            count=Cast(1, output_field=IntegerField())).values('role_id').annotate(count=Sum('count')))
        score_sum = MatchResult.objects.filter(player=player).exclude(score=0).aggregate(
            Sum('score', output_field=IntegerField())
        ).get('score__sum')
        max_score = MatchResult.objects.filter(player=player).exclude(score=0).aggregate(
            Max('score', output_field=IntegerField())
        ).get('score__max')
        max_score_as_thrall = MatchResult.objects.filter(player=player, is_thrall=True).exclude(score=0).aggregate(
            Max('score', output_field=IntegerField())
        ).get('score__max')
        max_score_as_civil = MatchResult.objects.filter(player=player, is_thrall=False).exclude(score=0).aggregate(
            Max('score', output_field=IntegerField())
        ).get('score__max')
        score_avg = MatchResult.objects.filter(player=player).exclude(score=0).aggregate(
            Avg('score', output_field=IntegerField())
        ).get('score__avg')
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
            'favourite_role': favourite_role,
            'score_sum': score_sum,
            'max_score': max_score,
            'max_score_as_thrall': max_score_as_thrall,
            'max_score_as_civil': max_score_as_civil,
            'score_avg': score_avg,
        }
        return Response(status=200, data=self.get_serializer_class()(response_json).data)
