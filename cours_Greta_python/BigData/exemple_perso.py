from pyspark.sql import SparkSession
import pyspark.sql.functions as F
from pyspark.sql.functions import col
# Dans :import pyspark.sql.functions , il y a aussi l'objet : col.
# Dans cet objet, il y a d'autres fonctions pour avoir le max, min ...et sur la col
# import HadoopUtils as hd

from pyspark.sql.types import NumericType
my_spark = SparkSession.builder.getOrCreate()
# print(my_spark)

chemin_base="/home/ratel/BigDataPython/cours_Greta_python/BigData"
print("************* Exercice 1 ***********")

file_airports =chemin_base +"/airports.csv"
airports = my_spark.read.csv(file_airports,header=True) # header=True signifie qu'il y a des entetes
# airports.show(30)

print("************* Exercice 2 ***********")
file_flights = chemin_base +"/flights.csv"
flights = my_spark.read.csv(file_flights,header=True)
# Ajout d'une nouvelle colonne : "Duration hrs"
flights = flights.withColumn("Duration hrs",F.round(flights.air_time/60.0,2))
flights.show()


print("************* Exercice 3 & 4 ***********")
file_plane= chemin_base + "/planes.csv"
# Filtre
long_flights1= flights.filter("distance >1000")
# Autre écriture du filtre
long_flights2 = flights.filter(flights.distance >1000)
print("long_flights1 :\n")
long_flights1.show()
print("long_flights2 :\n")
long_flights2.show()

print("************* Exercice 5 ***********")
selected1 = flights.select("tailnum","origin","dest")
temp = flights.select(flights.origin,flights.dest,flights.carrier)
filterA = flights.origin == "SEA"
filterB = flights.dest =="PDX"
selected2 =temp.filter(filterA).filter(filterB)
selected1.show()

print("************* Exercice 6 ***********")
flights = flights.withColumn("air_time",col("air_time").cast("numeric"))
flights.filter(flights.origin == "SEA").groupBy().max("air_time").show()
flights.filter(flights.origin == "SEA").filter((flights.carrier == "DL")).groupBy().avg("air_time").show()

flights.withColumn("duration_hrs",flights.air_time/60).groupBy().sum("duration_hrs").show()

print("************* Exercice 7 ***********")
by_plane = flights.groupBy("tailnum")
by_plane.count().show()
by_origin= flights.groupBy("origin")
by_origin.avg("air_time").show()


print("************* Exercice 8 ***********")























