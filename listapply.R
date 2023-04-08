library(ggplot2)

# define a function that performs the analysis
my_analysis <- function(df) {
  ggplot(df, aes(x,y))+
    geom_point()+
    theme_bw()
}

# create example data frames
df1 <- data.frame(x = rnorm(100), y = rnorm(100))
df2 <- data.frame(x = rnorm(100), y = rnorm(100))
df3 <- data.frame(x = rnorm(100), y = rnorm(100))

# apply the function to each data frame using lapply()
results <- lapply(list(df1, df2, df3), my_analysis)

plot_list <- results

# Loop through the list and save each plot with a unique filename
for (i in seq_along(plot_list)) {
  filename <- paste0("plot_", i, ".png")
  ggsave(filename, plot_list[[i]])
}
