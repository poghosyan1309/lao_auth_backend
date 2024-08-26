from django.shortcuts import render

# Create your views here.
from rest_framework import generics
from rest_framework.permissions import AllowAny
from .models import LaoUser
from .serializers import LaoUserSerializer, TokenSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

class RegisterView(generics.CreateAPIView):
    queryset = LaoUser.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = LaoUserSerializer

class TokenView(TokenObtainPairView):
    serializer_class = TokenSerializer