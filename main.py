import pandas as pd

# Membaca file CSV
data = pd.read_csv("data1.csv", delimiter=';')

# Menampilkan data 5 baris pertama
print(data.head())
