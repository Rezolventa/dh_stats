from datetime import datetime

from rest_framework.throttling import BaseThrottle


class BecauseWhyNotThrottle(BaseThrottle):

    def allow_request(self, request, view):
        return datetime.now().second % 2 == 0
