library(readr)
baseData <- read_csv("all.csv")

data <- data.frame(
  Gojek = baseData$Gojek,
  Grab = baseData$Grab,
  Maxim = baseData$Maxim
)

indeks <- 1
arraySum <- c(0,0,0)

for(coloumn in names(data)){
  arraySum[indeks] <- sum(data[coloumn])
  indeks <- indeks + 1
}


# Plot rata-rata kendaraan per layanan
barplot(arraySum, names.arg = names(data), col = "blue",xlab = "Layanan", ylab = "Rata-rata Kendaraan", main = "Rata-rata Kendaraan per Layanan")