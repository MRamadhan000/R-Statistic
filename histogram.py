import pandas as pd
import matplotlib.pyplot as plt

# Membaca file CSV
data = pd.read_csv("data1.csv", delimiter=';')
# Mengganti koma (`,`) dengan titik (`.`) di semua kolom
data = data.replace(',', '.', regex=True)

# Mengonversi semua kolom ke tipe numerik jika memungkinkan
data = data.apply(pd.to_numeric, errors='ignore')
# Menghapus kolom "Day" jika ada
data = data.drop(columns=['Day'])

# Membuat histogram untuk masing-masing kolom
for column in data.columns:
    plt.figure(figsize=(8, 5))
    plt.hist(data[column].dropna(), bins=15, color='skyblue', edgecolor='black')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()