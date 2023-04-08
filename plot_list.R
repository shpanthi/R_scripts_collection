


library(ggplot2)

# Create an empty list to store plots
plot_list <- list()

# Create some data for the plot
df <- data.frame(x = rnorm(100),
                 y = rnorm(100),
                 z = rnorm(100),
                 m = rnorm(100),
                 n = rnorm(100),
                 group=c(rep('A',50), rep('B',50)))

# Loop through the data and create plots
for (i in 2:(ncol(df)-1)) {
  plot_list[[i-1]] <- ggplot(df, aes(x, y = df[ ,i], color=group)) +
    geom_point() +
    labs(y = colnames(df)[i])+
    theme_bw()+
    theme(plot.title = element_text(color = 'black', face = 'bold', hjust = 0.5))
}


######### gridExtra #########

# Display the plots
gridExtra::grid.arrange(grobs = plot_list, ncol = 2)



########## patchwork ##########
plot_list[[1]]|plot_list[[2]]/(plot_list[[3]]|plot_list[[4]])

# Combine the plots using patchwork
combined_plots <- patchwork::wrap_plots(plot_list, guides = 'collect') 

# Display the combined plots
combined_plots + patchwork::plot_annotation(tag_levels = c('a'), tag_prefix = '1.')



########### ggpubr #######
library(ggpubr)
gg <- ggarrange(plotlist=plot_list, ncol=2, nrow=2, labels=c('a','b','c','d'), label.x=0.5, label.y=1.1, common.legend = TRUE, legend="top")
#labels='auto'
gg

annotate_figure(gg,
  top = 'Random data',
  bottom = NULL,
  left = 'y values',
  right = NULL,
  fig.lab = 'Source: Shp',
  fig.lab.pos = "top.right",
  fig.lab.size = 10,
  fig.lab.face ='bold'
)





