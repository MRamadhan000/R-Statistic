import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

# Memuat data
data = pd.read_csv('data1.csv', sep=';')

data = data.replace(',', '.', regex=True)

# Mengonversi semua kolom ke tipe numerik jika memungkinkan
data = data.apply(pd.to_numeric, errors='ignore')

# Menghapus baris yang memiliki nilai NaN
data = data.dropna()

# Memisahkan fitur dan target
X = data[['Interaction', 'Residences', 'Knowledge', 'Rainfall', 'Humidity (%)', 'Temperature']]
y = data['Power']

# Membagi data menjadi training dan testing set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Melatih model regresi linier
model = LinearRegression()
model.fit(X_train, y_train)

# Memprediksi dengan data uji
y_pred = model.predict(X_test)

# Menghitung MSE dan R^2
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

print("Mean Squared Error:", mse)
print("R^2:", r2)


