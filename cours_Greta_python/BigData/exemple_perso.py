from pyspark.sql import SparkSession

# import HadoopUtils as hd

my_spark = SparkSession.builder.getOrCreate()
print(my_spark)