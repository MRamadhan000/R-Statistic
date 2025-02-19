library(readr)

dataSenin <- read.csv("senin.csv")
dataKamis <- read.csv("kamis.csv")
dataMinggu <- read.csv("minggu.csv")

filteredDataSenin <- head(dataSenin[-1, c("Time","Gojek","Grab","Maxim")], n = 10)
filteredDataKamis <- head(dataKamis[-1, c("Time","Gojek","Grab","Maxim")], n = 10)
filteredDataMinggu <- head(dataMinggu[-1, c("Time","Gojek","Grab","Maxim")], n = 10)

DataFrameSenin <- data.frame(
  Time = filteredDataSenin$Time,
  Gojek = filteredDataSenin$Gojek,
  Grab = filteredDataSenin$Grab,
  Maxim = filteredDataSenin$Maxim
)

DataFrameKamis <- data.frame(
  Time = filteredDataKamis$Time,
  Gojek = filteredDataKamis$Gojek,
  Grab = filteredDataKamis$Grab,
  Maxim = filteredDataKamis$Maxim
)

DataFrameMinggu <- data.frame(
  Time = filteredDataMinggu$Time,
  Gojek = filteredDataMinggu$Gojek,
  Grab = filteredDataMinggu$Grab,
  Maxim = filteredDataMinggu$Maxim
)

barplot(DataFrameMinggu$Gojek,
        names.arg = DataFrameMinggu$Time,
        col = "blue",
        main = "Jumlah Gojek per Jam pada Minggu",
        xlab = "Waktu",
        ylab = "Jumlah Gojek")


DFGojek <- data.frame(
  Time = filteredDataSenin$Time,
  Senin = filteredDataSenin$Gojek,
  Kamis = filteredDataKamis$Gojek,
  Minggu = filteredDataMinggu$Gojek
)


barplot(
  as.matrix(DFGojek[, c("Senin", "Kamis", "Minggu")]),  # This provides the values for the bars
  beside = TRUE,  # This makes the bars side-by-side
  names.arg = rep(DFGojek$Time, each = 3),  # Repeat Time labels for each day (3 bars per time)
  col = c("blue", "green", "red"),  # Assign colors to each day
  main = "Jumlah Gojek per Jam pada Senin, Kamis, dan Minggu",  # Title
  xlab = "Waktu",  # Label for x-axis
  ylab = "Jumlah Gojek",  # Label for y-axis
  legend.text = c("Senin", "Kamis", "Minggu"),  # Add legend
  args.legend = list(title = "Hari", x = "topright")  # Position and title of the legend
)


