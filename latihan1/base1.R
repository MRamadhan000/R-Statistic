library(readr)
osn <- read_csv("osn.csv")

DFOSN <- data.frame(
  class = osn$Kelas,
  medal = osn$Medali
)
summary(DFOSN)

countMedal <- table(DFOSN$medal)
print(countMedal)
pie(countMedal)
# DFOSN$class[is.na(DFOSN$class)] <- median(DFOSN$class, na.rm = TRUE)
# 
# classCount <- table(DFOSN$class)
# 
# # Membuat bar plot
# barplot(classCount,
#         main = "Jumlah Orang di Setiap Kelas",
#         xlab = "Kelas",
#         ylab = "Jumlah Orang",
#         col = "skyblue",
#         border = "white")