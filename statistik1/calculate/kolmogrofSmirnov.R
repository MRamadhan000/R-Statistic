# Menggunakan library
library(readr)
library(ggplot2)

# Membaca dataset
dataStudent <- read_csv("student_lifestyle_dataset.csv")

# Mengubah Stress_Level menjadi angka
dataStudent$Stress_Level <- as.numeric(factor(dataStudent$Stress_Level, 
                                              levels = c("Low", "Moderate", "High")))

# Pilih kolom numerik untuk dihitung z-score
numericalColumns <- dataStudent[, c("Study_Hours_Per_Day", "Extracurricular_Hours_Per_Day", 
                                    "Sleep_Hours_Per_Day", "Social_Hours_Per_Day", 
                                    "Physical_Activity_Hours_Per_Day", "GPA", "Stress_Level")]

# Membuat tabel hasil KS test
ks_results_table <- data.frame(
  Variable = names(ks_results),
  D_Statistic = sapply(ks_results, function(test) test$statistic),
  P_Value = sapply(ks_results, function(test) test$p.value)
)

# Menampilkan tabel
print(ks_results_table)

# View tabel dalam mode spreadsheet
View(ks_results_table)
