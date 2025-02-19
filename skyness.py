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

# Membuat histogram dan menghitung skewness untuk masing-masing kolom
for column in data.columns:
    # Menghitung skewness
    skewness = data[column].skew()
    print(f'Skewness of {column}: {skewness:.3f}')
    
    # Menentukan normal atau tidak berdasarkan skewness
    if -0.5 <= skewness <= 0.5:
        print(f'{column} memiliki distribusi yang mendekati normal.\n')
    else:
        print(f'{column} tidak memiliki distribusi yang normal.\n')
