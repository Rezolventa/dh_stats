from django.conf.urls import url
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint, SwaggerSchemaView, MatchResultsEndpoint

router = SimpleRouter()


router.register(r'players', PlayerEndpoint)
router.register(r'results', MatchResultsEndpoint)
urlpatterns = router.urls

urlpatterns += [
    url(r'swagger', SwaggerSchemaView.as_view())
]
