from django.urls import path

from apps.account.views import register, CustomLoginView, CustomLogoutView

urlpatterns =[
    path("register/",register,name="register"), # ici register est une méthode. Pas de parenthèse
    path("login/",CustomLoginView.as_view(),name="login"), # Alors que CustomLoginView est une class. Dont on souhaite utiliser sa méthode as_view()
    path("logout/",CustomLogoutView.as_view(),name="logout")

]