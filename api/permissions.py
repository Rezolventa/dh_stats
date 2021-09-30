from rest_framework.permissions import BasePermission, SAFE_METHODS

from api.models import Player


class ReadOnly(BasePermission):
    def has_permission(self, request, view):
        return request.method in SAFE_METHODS

    def has_object_permission(self, request, view, obj):
        if isinstance(obj, Player):
            return obj.nickname == request.user.username
        if hasattr(obj, 'player'):
            return obj.player.nickname == request.user.username
        return True


class SuperUserOnly(BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_superuser

    def has_object_permission(self, request, view, obj):
        return request.user and request.user.is_superuser
