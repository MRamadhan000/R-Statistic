library(readr)

dataSenin <- read.csv("senin.csv")
dataKamis <- read.csv("kamis.csv")
dataMinggu <- read.csv("minggu.csv")

filteredDataSenin <- head(dataSenin[-1, c("Time","Gojek","Grab","Maxim")], n = 3)
filteredDataKamis <- head(dataKamis[-1, c("Time","Gojek","Grab","Maxim")], n = 3)
filteredDataMinggu <- head(dataMinggu[-1, c("Time","Gojek","Grab","Maxim")], n = 3)

DFGojek <- data.frame(
  Times = filteredDataSenin$Time,
  Senin = filteredDataSenin$Gojek,
  Kamis = filteredDataSenin$Gojek,
  Minggu = filteredDataMinggu$Gojek
)

barplot(
  as.matrix(DFGojek[,c("Senin","Kamis","Minggu")]),
  beside = TRUE,
  names.arg = rep(DFGojek$Times,each = 3),
  col = c("blue","red","green")
)

?sum
