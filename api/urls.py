from django.urls import path
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint

router = SimpleRouter()

# urlpatterns = [
#     path('players', PlayerEndpoint, 'players')
# ]

router.register(r'players', PlayerEndpoint)
urlpatterns = router.urls
