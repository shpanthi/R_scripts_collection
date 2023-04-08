
library(ggplot2)

set.seed(42)
n <- 1000
x <- runif(n) * 3
y <- x * sin(1/x) + rnorm(n) / 25
df <- data.frame(x = x, y = y)

p1 <- ggplot(df, aes(x, y)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  theme_bw()
p1


p2 <- ggplot(df, aes(x, y)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  scale_x_continuous(limits = c(0, 0.5)) +
  scale_y_continuous(limits = c(-0.3, 0.6)) +
  theme_bw()
p2


p1 + annotation_custom(ggplotGrob(p2), xmin = 1, xmax = 3, 
                       ymin = -0.3, ymax = 0.6)


x <- 1:5
y <- 6:10

df <- data.frame(x,y)

t <- ggplot(df, aes(x, y)) +
  geom_text(aes(x=2.5, y=7.5, 
                label='C1\nC2\nN1\nN2\nN3\nN4\nN5')) +
  scale_x_continuous(breaks = 1:10)+
  scale_y_continuous(breaks = 11:20)+
  theme_bw()
t
tgg <- ggplotGrob(t)

p1 + annotation_custom(ggplotGrob(t), xmin = 1, xmax = 2, ymin=-0.3, ymax=0.6)





