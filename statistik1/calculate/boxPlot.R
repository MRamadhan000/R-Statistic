# Load required library
library(ggplot2)
library(readr)

# Read the dataset
data <- read_csv("student_lifestyle_dataset.csv")

# Create the boxplot with boundaries for x and y axes
ggplot(data, aes(x = Stress_Level, y = Social_Hours_Per_Day, fill = Stress_Level)) +
  geom_boxplot() +
  labs(title = "Distribution of Social Hours Based on Stress Level", 
       x = "Stress Level", 
       y = "Social Hours per Day (hrs)") +
  scale_fill_manual(values = c("Low" = "#2ca02c", "Moderate" = "#ffcc00", "High" = "#d62728")) +  # Colors for categories
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold"),
    axis.line = element_line(color = "black", size = 1),  # Add black border line for x and y axes
    legend.position = "none"  # Remove legend
  )

# Calculate Q1, Median, Q3, Max, and Min for Social Hours per Day by Stress Level
summary_stats <- data %>%
  group_by(Stress_Level) %>%
  summarise(
    Q1 = quantile(Social_Hours_Per_Day, 0.25),
    Median = median(Social_Hours_Per_Day),
    Q3 = quantile(Social_Hours_Per_Day, 0.75),
    Max = max(Social_Hours_Per_Day),
    Min = min(Social_Hours_Per_Day)
  )

# Print the summary statistics
print(summary_stats)
