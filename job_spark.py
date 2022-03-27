#Comments
import pyspark
from pyspark.sql.functions import mean,max,min,col,count
from pyspark.sql import SparkSession

spark = (
    SparkSession
    .builder.appName('ExerciseSpark') 
    .gtOrCreate()
)

# Ler os dados do ENEM 2019
enem = (
    spark
    .read
    .format("csv")
    .option("header",True)
    .option("inferSchema",True)
    .option("delimiter",";")
    .load("s3://elweshonorato-151128108040/raw-data/")
)


(
    enem
    .write
    .mode('overwrite')
    .format('parquet')
    .partitionBy('year')
    .save('s3://elweshonorato-151128108040/consumer-zone/')
)