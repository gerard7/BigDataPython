from django.urls import path

from apps.product.views import product

urlpatterns =[
    path("product/",product,name="product"),

]