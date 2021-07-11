from django.db import models
from django.utils.timezone import now


class Map(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        db_table = 'maps'
        ordering=['id']

    def __str__(self):
        return self.name


class Player(models.Model):
    nickname = models.CharField(max_length=50)

    class Meta:
        db_table = 'players'
        ordering = ['id']

    def __str__(self):
        return self.nickname


class GameSession(models.Model):
    map = models.ForeignKey(Map, on_delete=models.DO_NOTHING)
    players = models.ManyToManyField(Player)
    expidition_succeed = models.BooleanField()
    date = models.DateField(default=now())
    created = models.DateField(auto_created=True, default=now())

    class Meta:
        db_table = 'game_sessions'
        ordering = ['-id']

    def __str__(self):
        return '{} ({})'.format(self.map.name, self.id)


class Role(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        db_table = 'roles'
        ordering = ['id']

    def __str__(self):
        return self.name


class MatchResult(models.Model):
    game_session = models.ForeignKey(GameSession, on_delete=models.DO_NOTHING)
    player = models.ForeignKey(Player, on_delete=models.DO_NOTHING)
    role = models.ForeignKey(Role, on_delete=models.DO_NOTHING)
    is_thrall = models.BooleanField()
    score = models.PositiveSmallIntegerField()

    class Meta:
        db_table = 'match_results'
        ordering = ['-id']

    def __str__(self):
        return '{} ({}) - {}'.format(self.game_session.map.name, self.game_session.id, self.player.nickname)
