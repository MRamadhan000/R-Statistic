library(readr)

dataTitik <- read_csv("Kuisioner - withTitik.csv")

DFQ1 <- data.frame(
  val = as.numeric(dataTitik$Q1)
)


DFQ1$val[is.na(DFQ1$val)] <- mean(DFQ1$val, na.rm = TRUE)

DFQ1$val <- round(DFQ1$val)

View(DFQ1)

