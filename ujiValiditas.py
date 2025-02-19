import pandas as pd

# Membaca file CSV
data = pd.read_csv("data1.csv", delimiter=';')

# Mengganti koma (`,`) dengan titik (`.`) di semua kolom
data = data.replace(',', '.', regex=True)

# Mengonversi semua kolom ke tipe numerik jika memungkinkan
data = data.apply(pd.to_numeric, errors='ignore')

# Mengambil kolom yang akan diuji (tanpa kolom pertama, jika tidak relevan)
items = data.iloc[:, 1:]  # Misalnya, kolom setelah "Day"

# Fungsi Cronbach's Alpha
def cronbach_alpha(df):
    item_vars = df.var(axis=0, ddof=1)  # Variansi tiap kolom
    total_var = df.sum(axis=1).var(ddof=1)  # Variansi total (penjumlahan tiap baris)
    n_items = df.shape[1]  # Jumlah kolom (item)
    alpha = (n_items / (n_items - 1)) * (1 - item_vars.sum() / total_var)
    return alpha

# Fungsi untuk uji validitas dengan Pearson correlation
def pearson_correlation(df):
    # Menghitung matriks korelasi Pearson antara kolom-kolom
    correlation_matrix = df.corr(method='pearson')
    return correlation_matrix

# Menghitung nilai Cronbach's Alpha
alpha = cronbach_alpha(items)

# Menampilkan hasil Cronbach's Alpha
print(f"Cronbach's Alpha: {alpha:.3f}")

# Menghitung dan menampilkan matriks korelasi Pearson
correlation_matrix = pearson_correlation(items)
print("\nMatriks Korelasi Pearson:")
print(correlation_matrix)
