
library(gapminder)
library(gganimate)

dim(gapminder)
t <-data.frame(table(gapminder$country))

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  #ease_aes('linear')+
  theme_bw()

anim_save('oe.gif', width=8, height=5 ,dpi=2000)

# New code
ggplot(mtcars) + 
  geom_boxplot(aes(factor(cyl), mpg)) + 
  transition_manual(gear)

country_colors

country_colors['Nepal']



ggplot(airquality, aes(Day, Temp)) + 
  geom_line(linewidth = 2, colour = 'steelblue') + 
  transition_states(Month, 4, 1) + 
  shadow_mark(size = 1, colour = 'grey')

animate(p, renderer = ffmpeg_renderer())
