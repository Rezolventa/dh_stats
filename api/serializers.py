from rest_framework import serializers

from api.models import Player


class PlayerStatsSerializer(serializers.Serializer):
    games_played = serializers.IntegerField()
    wins = serializers.IntegerField()
    losses = serializers.IntegerField()
    winrate = serializers.FloatField(allow_null=True)
    games_as_thrall = serializers.IntegerField()
    wins_as_thrall = serializers.IntegerField()
    winrate_as_thrall = serializers.FloatField(allow_null=True)
    games_as_civil = serializers.IntegerField()
    wins_as_civil = serializers.IntegerField()
    winrate_as_civil = serializers.FloatField(allow_null=True)
    favourite_role = serializers.JSONField()
    score_sum = serializers.IntegerField()
    max_score = serializers.IntegerField()
    max_score_as_thrall = serializers.IntegerField()
    max_score_as_civil = serializers.IntegerField()
    score_avg = serializers.IntegerField()


class PlayerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Player
        fields = ('__all__')
