

library(ggplot2)
library(ggpubr)

# Define a function that takes a data frame and a column name
# and creates a histogram with ggplot
plot_histogram <- function(data, column_name) {
  ggplot(data, aes(x = !!sym(column_name))) +
    geom_histogram(color = "black", fill = "white") +
    labs(title = paste("Histogram of", column_name))+
    theme_bw()
}

# Load some example data
data(mtcars)

# Use purrr::map to apply the plot_histogram function to each
# column in the mtcars data frame
library(purrr)
plots <- map(colnames(mtcars[1:6]), ~ plot_histogram(mtcars[1:6], .x))

# Use gridExtra::grid.arrange to arrange the resulting plots
library(gridExtra)
grid.arrange(grobs = plots, ncol = 3)

#mtcars
