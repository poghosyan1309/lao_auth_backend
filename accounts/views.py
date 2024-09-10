from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
from rest_framework import generics
from rest_framework.permissions import AllowAny
from .models import LaoUser
from .serializers import LaoUserSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from django.core.mail import send_mail
from django.conf import settings
class RegisterView(generics.CreateAPIView):
    queryset = LaoUser.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = LaoUserSerializer

@csrf_exempt
def email_send(request):
    send_mail(subject='testing subject', message='testing message', from_email=settings.EMAIL_HOST_USER, recipient_list=['poghosyanofcourse@gmail.com'])
    return JsonResponse({'status': 'ok'})