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

# Menghitung nilai Cronbach's Alpha untuk seluruh data
alpha_all = cronbach_alpha(items)

# Menampilkan hasil Cronbach's Alpha untuk seluruh data
print(f"\n\nCronbach's Alpha untuk seluruh data: {alpha_all:.3f} \n\n")

# Menghitung nilai Cronbach's Alpha jika masing-masing kolom dihapus
for column in items.columns:
    items_without_column = items.drop(columns=[column])  # Menghapus satu kolom
    alpha_without_column = cronbach_alpha(items_without_column)
    print(f"Cronbach's Alpha tanpa kolom '{column}': {alpha_without_column:.3f}")
