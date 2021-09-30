from django.conf.urls import url
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint, SwaggerSchemaView, MatchResultsViewSet

router = SimpleRouter()


router.register(r'players', PlayerEndpoint, 'players')
router.register(r'results', MatchResultsViewSet, 'results')
urlpatterns = router.urls

urlpatterns += [
    url(r'swagger', SwaggerSchemaView.as_view())
]
