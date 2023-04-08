

# Load necessary packages
library(ggplot2)

# Create sample data
df <- data.frame(x = 1:5, y1 = c(2, 4, 6, 8, 10), y2 = c(6, 5, 5, 9, 7), y3 = c(3, 5, 6, 12, 10), group = c("A", "A", "B", "B", "C"))


# Create ggplot
ggplot(df, aes(x)) + 
  geom_line(aes(y=y1, linetype=y1))+
  geom_line(aes(y=y2))+
  labs(col='y10')
p

library(ggplot2)

ggplot(df, aes(x = x)) +
  geom_line(aes(y = y1, color = "Y1")) +
  geom_line(aes(y = y2, color = "Y2")) +
  geom_line(aes(y = y3, color = "Y3")) +
  scale_color_manual(values = c("Y1" = "red", "Y2" = "blue", "Y3" = "green")) +
  labs(x = "X Axis Label", y = "Y Axis Label", color = "Legend Title")
