# Tambahkan library yang diperlukan
library(readr)     # Untuk membaca file CSV
library(dplyr)     # Untuk memanipulasi data
library(ggplot2)   # Untuk membuat plot

# Langkah 1: Baca data dari file CSV
dataAlzheimer <- read_csv("alzheimers_disease_data.csv")



# Langkah 2: Hitung BMI median untuk setiap umur
data_filtered <- dataAlzheimer %>%
  group_by(Age) %>%                        # Kelompokkan data berdasarkan umur
  summarise(median_bmi = median(BMI, na.rm = TRUE)) %>% # Hitung nilai tengah BMI
  ungroup()                                # Hapus grup setelah operasi selesai


# Langkah 3: Buat scatter plot
ggplot(data_filtered, aes(x = Age, y = median_bmi)) + # Hubungkan Age dan median BMI
  geom_point(color = "blue", size = 3) +             # Tambahkan titik pada plot
  labs(
    title = "Hubungan Umur dan Median BMI",          # Judul grafik
    x = "Umur (Age)",                                # Label sumbu X
    y = "Median BMI"                                 # Label sumbu Y
  ) +
  theme_minimal()                                    # Gunakan tema sederhana
