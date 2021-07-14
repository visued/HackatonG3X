from django.conf.urls import include, url

from .views import HomePageView
app_name = 'home'
urlpatterns = [
    url(r'^$', HomePageView.as_view(), name='home'),
]