from django.urls import path

# from clickandcart.apps import product
from ....clickandcart.apps import product

urlpatterns =[
    path("product/",product,name="product"),

]