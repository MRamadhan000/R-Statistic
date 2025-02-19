# Load necessary library
library(ggplot2)

# Load the dataset
data <- read.csv("student_lifestyle_dataset.csv")

# List of variable pairs
variable_pairs <- list(
  "Study_Hours_Per_Day" = "Study Hours vs GPA",
  "Extracurricular_Hours_Per_Day" = "Extracurricular Hours vs GPA",
  "Sleep_Hours_Per_Day" = "Sleep Hours vs GPA",
  "Social_Hours_Per_Day" = "Social Hours vs GPA",
  "Physical_Activity_Hours_Per_Day" = "Physical Activity Hours vs GPA"
)

# Generate scatter plots
for (var in names(variable_pairs)) {
  p <- ggplot(data, aes_string(x = var, y = "GPA")) +
    geom_point(size = 3, color = "blue", alpha = 0.7) +
    labs(
      title = paste(variable_pairs[[var]]),
      x = var,
      y = "GPA"
    ) +
    theme_minimal()
  
  # Print the plot
  print(p)
}
