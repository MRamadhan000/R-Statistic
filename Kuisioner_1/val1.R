library(readr)
data <- read_csv("data2.csv")

DFQ1 <- data.frame(
  likert = data$Q1
)

DFQ1$likert[is.na(DFQ1$likert)] <- median(DFQ1$likert , na.rm = TRUE)