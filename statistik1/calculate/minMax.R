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

# Fungsi untuk Min-Max Normalization
minMaxNormalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Terapkan normalisasi
normalizedData <- as.data.frame(lapply(numericalColumns, minMaxNormalize))

# Gabungkan dengan Student_ID
dataWithNormalized <- cbind(dataStudent[, "Student_ID", drop = FALSE], normalizedData)

View(dataWithNormalized)

head(data_with_normalized)
