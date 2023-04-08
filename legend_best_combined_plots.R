

# Create example data
set.seed(35753)
data1 <- data.frame(x = round(runif(2000), 2),
                    y = round(runif(2000), 2),
                    group = c(rep("A", 1000), rep("B", 1000)))
data2 <- data.frame(x = round(rnorm(2000), 2),
                    y = round(rnorm(2000), 2),
                    group = c(rep("A", 1000), rep("B", 1000)))

# Install and load packages

library("ggplot2")
library("gridExtra")

# Create two plots without legends
ggp1 <- ggplot(data1, aes(x = x, y = y, group = group, col = group)) +
  geom_point() +
  theme(legend.position = "none")
ggp1

ggp2 <- ggplot(data2, aes(x = x, y = y, group = group, col = group)) +
  geom_point() +
  theme(legend.position = "none")
ggp2

# Create plot with legend
ggp1_legend <- ggplot(data1, aes(x = x, y = y, group = group, col = group)) +
  geom_point() +
  theme(legend.position = "bottom")
ggp1_legend

# Create user-defined function, which extracts legends from ggplots
extract_legend <- function(my_ggp) {
  step1 <- ggplot_gtable(ggplot_build(my_ggp))
  step2 <- which(sapply(step1$grobs, function(x) x$name) == "guide-box")
  step3 <- step1$grobs[[step2]]
  return(step3)
}

# Apply user-defined function to extract legend
shared_legend <- extract_legend(ggp1_legend)

# Draw plots with shared legend
grid.arrange(arrangeGrob(ggp1, ggp2, ncol = 2),
             shared_legend, nrow = 2, heights = c(10, 1))
