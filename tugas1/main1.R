library(readr)
library(ggplot2)

dataAlzheimer <- read_csv("alzheimers_disease_data.csv")

summary(dataAlzheimer)

dfAge <- data.frame(
  age = dataAlzheimer$Age
)

ageFrequency <- table(dfAge$age)

# barplot(ageFrequency,
#         xlab = "Age",
#         ylab = "Frequency",
#         main = "Age Distribution",
#         col = blues9,
#         density = 1000000)



# Konversi ageFrequency ke data frame
ageFreqDF <- as.data.frame(ageFrequency)
colnames(ageFreqDF) <- c("Age", "Frequency")

# Konversi Age menjadi numerik (jika perlu)
ageFreqDF$Age <- as.numeric(as.character(ageFreqDF$Age))

# Buat barplot dengan ggplot2
ggplot(ageFreqDF, aes(x = Age, y = Frequency)) +
  geom_bar(stat = "identity", fill = "steelblue", color = "black") +
  labs(title = "Distribusi Usia Pasien", x = "Usia", y = "Frekuensi") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
        plot.title = element_text(size = 14, face = "bold"))



