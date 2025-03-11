from django.shortcuts import render

from apps.account.forms.register_forms import RegisterForm


# Create your views here.
def register(request):
    form = RegisterForm()
    return render(request,"account/register.html",{"form":form})
