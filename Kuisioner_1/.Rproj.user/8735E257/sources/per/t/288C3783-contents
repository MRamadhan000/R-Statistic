library(readr)
data <- read_csv("data.csv")

DFQ1 <- data.frame(
  likert = data$Q1
)

category <- c("STS","TS","N","S","SS")
Q1Values <- cut(DFQ1$likert,
                breaks = c(0,1,2,3,4,5),
                labels = category)

Q1CategoryCount <- table(Q1Values)

barplot(Q1CategoryCount,
        names.arg = category)
