
######## flextable ########
library(flextable)

df <- data.frame(A = c(1, 2, 3),
                 B = c(4, 5, 6),
                 C = c(7, 8, 9)) # create example data frame
ft <- flextable(df)
ft <- set_header_labels(ft, values = c("", "length", "width"))
ft

########### autofit and gen_grob ###########
ft1 <- autofit(ft)
gr <- gen_grob(ft1)

#######################iris#########
df1 <- iris

p1 <- ggplot(df1, aes(Petal.Width, Sepal.Length, color=Species))+
  geom_point()+
  theme_bw()+
  theme(legend.position = 'bottom',
        legend.direction = 'horizontal')
p1


#######library(gridExtra)
tg <- tableGrob(df)
tg
p1 + inset_element(tg, 0.1, 0.7, 0.2, 0.8)
p1+tg + plot_layout(design='layout')

layout <- "
AAAB
AAAB
"
###############################

p1 + inset_element(gr, 0.1, 0.7, 0.25, 0.9)+
  theme(plot.background = element_rect(fill = "transparent"),
    panel.background = element_rect(fill = "transparent")
  )
ggsave('flextable.png', height = 4, width = 4, dpi = 500)

########### ht
p1 + inset_element(ht, 0.1, 0.7, 0.2, 0.8)
library(patchwork)
ht <- gen_grob(ht)

p1+ht
