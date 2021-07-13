from django.conf.urls import url
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint, SwaggerSchemaView

router = SimpleRouter()


router.register(r'players', PlayerEndpoint)
urlpatterns = router.urls

urlpatterns += [
    url(r'swagger', SwaggerSchemaView.as_view())
]
