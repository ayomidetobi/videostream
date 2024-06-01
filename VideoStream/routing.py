from django.urls import path
from .consumers import WebRTCConsumer

websocket_urlpatterns = [
    path('ws/stream/<str:room_name>/', WebRTCConsumer.as_asgi()),
]
