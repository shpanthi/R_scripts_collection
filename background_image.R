


library(png)
library(ggpubr)


img <- png::readPNG('D:/Dextop/shp/hi.png')


# Plot with background image
p <- ggplot(iris, aes(Species, Petal.Length))+
  #background_image(img)+
  geom_boxplot(aes(fill = Species), color = "black")+
  #fill_palette("jco")+
  theme_bw()
p

#### ggimage ####
library(ggimage)
img1 <- image_read2(path = "D:/Dextop/shp/Weekly_Co2.png", cut_empty_space = TRUE)
img1
i <- magick::image_read('Weekly_CO2.png')

i <- magick::image_read('nep.jpeg')
i+i
library(patchwork)
patchwork::i+i

ggimage::ggbackground(p, i)
