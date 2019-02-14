library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

# plot how life expectancy changed over time 
ggplot(gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

# scale_x_log10 makes the X axis a log scale 
# geom_smooth adds a line on the plot which helps visualize the relationship. The method (lm) means that the line was made by creating a linear model. The shading on either side of the line denotes the condfidence interval. 

#Modify the above code to size the points in proportion to the population of the county. 

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size = pop)) +
  geom_point(aes(color = continent)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
