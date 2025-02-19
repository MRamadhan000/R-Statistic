import pandas as pd
from sklearn.preprocessing import StandardScaler

# Membaca file CSV
data = pd.read_csv("data1.csv", delimiter=';')

# Mengganti koma (`,`) dengan titik (`.`) di semua kolom
data = data.replace(',', '.', regex=True)

# Mengonversi semua kolom ke tipe numerik jika memungkinkan
data = data.apply(pd.to_numeric, errors='ignore')

# Menghapus kolom "Day" jika ada
data = data.drop(columns=['Day'], errors='ignore')

# Standardisasi data menggunakan z-score
scaler = StandardScaler()
data_standardized = pd.DataFrame(scaler.fit_transform(data), columns=data.columns)

# Menampilkan data yang sudah distandardisasi
print(data_standardized.head())