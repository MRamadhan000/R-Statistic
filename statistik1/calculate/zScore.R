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

# Hitung z-score untuk kolom numerik
zScores <- scale(numericalColumns)

# Gabungkan hasil z-score dengan kolom lainnya (opsional)
dataWithZScores <- cbind(dataStudent[, c("Student_ID")], as.data.frame(zScores))

# Tampilkan hasil
View(dataWithZScores)

head(dataWithZScores)