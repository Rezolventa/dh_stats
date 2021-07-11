from rest_framework import serializers


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
    top_role_played = serializers.JSONField()
    scores_sum = serializers.IntegerField()
    scores_median = serializers.IntegerField()
