

install.packages("ggtext")
library(ggtext)

data <- data.frame(x = c(1, 2, 3, 4),
                   y = c(10, 8, 6, 4))

data(iris)

ggplot(iris, aes(Petal.Width, Sepal.Length, color=Species)) +
  geom_point() +
  theme_bw()+
  annotation_custom(tableGrob(data, rows = NULL), xmin = 0.1, xmax = 0.5, ymin = 6, ymax = 8)


tableGrob(data, rows = NULL)

