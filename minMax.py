import pandas as pd

# Membaca file CSV
data = pd.read_csv("data1.csv", delimiter=';')
# Mengganti koma (`,`) dengan titik (`.`) di semua kolom
data = data.replace(',', '.', regex=True)

# Mengonversi semua kolom ke tipe numerik jika memungkinkan
data = data.apply(pd.to_numeric, errors='ignore')
# Menghapus kolom "Day" jika ada
data = data.drop(columns=['Day'])

# Menggunakan describe() untuk mendapatkan statistik deskriptif
statistics = data.describe()

# Menampilkan statistik deskriptif
print(statistics)

# Menampilkan daya tertinggi (Power), kelembapan tertinggi (Humidity), dan rata-rata curah hujan (Rainfall)
highest_power = data['Power'].max()
highest_humidity = data['Humidity (%)'].max()
average_rainfall = data['Rainfall'].mean()

print(f"\nDaya Tertinggi (Power): {highest_power}")
print(f"Kelembapan Tertinggi (Humidity): {highest_humidity}")
print(f"Rata-rata Curah Hujan (Rainfall): {average_rainfall:.2f}")


