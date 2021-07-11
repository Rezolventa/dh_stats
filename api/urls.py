from django.conf.urls import url
from django.urls import path
from rest_framework.routers import SimpleRouter

from api.views import PlayerEndpoint

from rest_framework_swagger.views import get_swagger_view

schema_view = get_swagger_view(title='API')

router = SimpleRouter()


router.register(r'players', PlayerEndpoint)
urlpatterns = router.urls

urlpatterns += [
    url(r'swagger', schema_view)
]
