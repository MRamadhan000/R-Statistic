library(readr)
library(ggplot2)

# Membaca dataset
dataStudent <- read_csv("student_lifestyle_dataset.csv")

# Membuat Scatter Plot dengan transparansi yang lebih cocok dan garis di sumbu X dan Y
ggplot(dataStudent, aes(x = Study_Hours_Per_Day, y = GPA)) +
  geom_point(color = "blue", size = 3, alpha = 0.5) + # Transparansi yang lebih cocok
  labs(
    title = "Relationship between Study Hours and GPA", 
    x = "Study Hours per Day", 
    y = "GPA"
  ) +
  theme_minimal(base_size = 15) + # Font lebih besar
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"), # Judul di tengah dan tebal
    axis.title = element_text(face = "bold"),              # Label sumbu tebal
    panel.grid.major = element_line(color = "gray", size = 0.5), # Garis grid utama
    panel.grid.minor = element_line(color = "gray", size = 0.25, linetype = "dotted"), # Garis grid minor
    axis.line = element_line(color = "black") # Garis sumbu X dan Y
  )
