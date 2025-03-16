
from django.db import models
from apps.product.models.category import Category
from django.utils.text import slugify

class Product(models.Models):
    name = models.CharField(max_length=255,unique=True)
    slug = models.SlugField(max_length=255,unique=True,blank=True)
    description = models.TextField()
    illustration = models.ImageField(upload_to="products/",blank=True,null=True) # Il y aura un dossier :products qui sera créé dans un répertoire média
    price = models.FloatField()
    tva = models.FloatField()
    category = models.ForeignKey(Category,on_delete=models.CASCADE,related_name="products") # related_name="products" Signifie:

    # def save(self, *args, **kwargs):
    #     if not self.slug:
    #         self.slug = slugify(self.name)
    #     super().save(*args, **kwargs)
    #
    # def __str__(self):
    #     return self.name

    # faire la méthode save et __str__
    # faire le import dans le __init__ de product pour l'import de Category"
    # Créer les routes et les view
    # et faire makemigration, ensuite migrate