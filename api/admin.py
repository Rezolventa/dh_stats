from django.contrib import admin

from api.models import Map, Player, GameSession, Role, MatchResult


class MatchResultInline(admin.TabularInline):
    model = MatchResult
    extra = 4
    max_num = 8
    ordering = ['id']


@admin.register(GameSession)
class GameSessionAdmin(admin.ModelAdmin):
    model = GameSession
    list_display = ['game_session_repr', 'date']

    inlines = (
        MatchResultInline,
    )

    def game_session_repr(self, obj):
        return self.model.__str__(obj)
    game_session_repr.short_description = 'Game Session'


admin.site.register(Map)
admin.site.register(Player)
admin.site.register(Role)
admin.site.register(MatchResult)
