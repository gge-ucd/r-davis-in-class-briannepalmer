library(tidyverse)

#code provided to download the data needed for this exercise
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

#Look at the following code. 
#What do you think the scale_x_log10() line is doing? 
# places the x axis on log scale making the plot more vis. appealing

#What do you think the geom_smooth() line is doing?
# plots a regression line through a central portion of the data

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

# Modify the above code to size the points in proportion to the population of the county. Hint: Are you translating data to a visual feature of the plot?

# I changed the size of geom points to match the pop size in aes
# Also added some transparency to geom points for better visualization
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent,size=pop,alpha=1)) +
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
