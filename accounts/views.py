# Create your views here.
from rest_framework import generics
from rest_framework.permissions import AllowAny
from .models import LaoUser
from .serializers import LaoUserSerializer

class RegisterView(generics.CreateAPIView):
    queryset = LaoUser.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = LaoUserSerializer
