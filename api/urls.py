from django.conf.urls import url
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint, SwaggerSchemaView, MatchResultsViewSet, NastyViewSet

router = SimpleRouter()


router.register(r'players', PlayerEndpoint, 'players')
router.register(r'results', MatchResultsViewSet, 'results')
router.register(r'results_nasty', NastyViewSet, 'results-nasty')
urlpatterns = router.urls

urlpatterns += [
    url(r'swagger', SwaggerSchemaView.as_view())
]
