library(readr)
library(ggplot2)

# Reading the dataset
dataStudent <- read_csv("student_lifestyle_dataset.csv")

# Calculating the number of students per stress level
stress_count <- table(dataStudent$Stress_Level)

# Converting the result to a data frame for visualization
df_stress <- as.data.frame(stress_count)
colnames(df_stress) <- c("Stress_Level", "Student_Count")

# Print the counts for each category
print(df_stress)

# Creating a Bar Chart with custom colors and grid lines
ggplot(df_stress, aes(x = Stress_Level, y = Student_Count, fill = Stress_Level)) +
  geom_bar(stat = "identity", position = "dodge") +  # stat = "identity" is used to plot pre-calculated data
  labs(title = "Number of Students per Stress Level", 
       x = "Stress Level", 
       y = "Number of Students") +
  scale_fill_manual(values = c("Low" = "#2ca02c", "Moderate" = "#ffcc00", "High" = "#d62728")) +  # Custom colors for the bars
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5),  # Centering the title
    legend.position = "none",  # Removing the legend if not needed
    panel.grid.major = element_line(color = "gray", size = 0.5),  # Adding major grid lines
    panel.grid.minor = element_line(color = "gray", size = 0.25, linetype = "dotted"),  # Adding minor grid lines
    axis.line = element_line(color = "black"),  # Adding black lines for the axes
    axis.ticks.x = element_line(color = "black"),  # Adding ticks above x-axis
    axis.ticks.y = element_line(color = "black"),  # Adding ticks along y-axis
    scale_x_discrete(expand = c(0, 0))  # Removing space between bars and x-axis
  ) +
  scale_y_continuous(expand = c(0, 0))  # Removing space between bars and y-axis at the bottom
