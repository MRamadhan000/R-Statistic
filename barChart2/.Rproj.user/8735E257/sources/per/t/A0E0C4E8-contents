library(readr)

dataSenin <- read.csv("senin.csv")
dataKamis <- read.csv("kamis.csv")
dataMinggu <- read.csv("minggu.csv")

filteredDataSenin <- dataSenin[-1, c("Gojek","Grab","Maxim")]
filteredDataKamis <- dataKamis[-1, c("Gojek","Grab","Maxim")]
filteredDataMinggu <- dataMinggu[-1, c("Gojek","Grab","Maxim")]

DFGojek <- data.frame(
  Senin = sum(filteredDataSenin$Gojek)/nrow(filteredDataSenin),
  Kamis = sum(filteredDataKamis$Gojek)/nrow(filteredDataSenin),
  Minggu = sum(filteredDataMinggu$Gojek)/nrow(filteredDataSenin)
)

barplot(
  as.matrix(DFGojek[,c("Senin","Kamis","Minggu")]),
  names.arg = c("Senin","Kamis","Minggu"),
  main = "Rata-Rata",
  xlab = "Jenis Transportasi Online",
  ylab = "Jumlah Tranportasi Online"
)


