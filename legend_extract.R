

df_w <- iris

colnames(df_w) <- c('SL', 'SW', 'PL', 'PW', 'Species')
library(reshape2)

dl1 <- melt(df_w, id.vars = c("Species", "PW", "PL"), variable.name='Sepal',
            value.name = 'SLW')
dl2 <- melt(dl1, id.vars = c("Species", "Sepal", "SLW"), variable.name='Petal',
            value.name = 'PLW')

#df <- dl2
#df <- dl2[dl2$Sepal=='SL', ]
#df <- dl2[dl2$Petal=='PW', ]

i1 <- ggplot(dl2, aes(x=PLW, y=SLW, color=Species, linetype=Species))+
  #geom_point()+
  geom_smooth(method='lm',se=0, linewidth=0.4)+
  scale_color_manual(name='', labels=c('prediction interval', 'regression line', '1:1 line'), values = c('darkgreen', 'darkblue', 'black'))+
  scale_linetype_manual(name='', labels=c('prediction interval', 'regression line', '1:1 line'), values = c('dashed', 'solid', 'dotted'))+
  theme_bw()+
  theme(legend.position = 'bottom',
        legend.direction = 'horizontal', 
        legend.key.height = unit(3, 'mm'),
        legend.key.width = unit(4, 'mm'),
        legend.background = element_rect(fill = "transparent"),
        legend.key = element_rect(fill = "transparent"),
        legend.text = element_text(color='black', size = 7))
i1

l <- cowplot::get_legend(i1)


ll <- ggplot(iris, aes(Petal.Width, Sepal.Length))+
  geom_point()+
  theme_bw()

library(patchwork)
ll + inset_element(l, 0.1, 0.92, 0.9,0.98)























