from django.db import models
from django.utils.text import slugify


class Category(models.Model):
    name = models.CharField(max_length=100,unique=True)
    slug =models.SlugField(max_length=100,unique=True,blank=True)
    # C'est pour générer un url adapté par rapport aux noms qui ont des espaces ou accents
    # Exemple : le sac élégant va engendrer un url : le-sac-elegant
    class Meta: # Pour configurer le comportement d'une classe . Permet de gérer l'affichage (ordering) , de mettre en place le slug
        verbose_name = "Catégorie" # Définition du nom du modele dans l'admin django
        verbose_name_plural ="Catégories"
        ordering = ["name"]

    def save(self,*args,**kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args,**kwargs)

    def __str__(self):
        return self.name
