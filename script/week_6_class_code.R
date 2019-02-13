# Week 6 Class Code

#### finishing up tidyverse ===============================
# Tue Feb 12 14:31:23 2019 ------------------------------

#use ts to get the time stamp


library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

#take all NAs out of the weight, hindfoot_length, and sex column

surveys_complete <- surveys %>% 
  filter(!is.na(weight), !is.na(hindfoot_length), !is.na(sex))

#remove species that have less than 50 observations 

species_counts <- surveys_complete %>% 
  group_by(species_id) %>% 
  tally() %>% #creates a new column called "n"
  filter(n >= 50)

surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_counts$species_id) #filter to only include the species IDs that are included in the species counts; must also call the column 

species_keep <- c("DM", "DO") #example of list we could use instead of the row in a dataframe

# writing your dataframe to .csv

write_csv(surveys_complete, path = "data_output/surveys_complete.csv")

#create a new section called "ggplot time!"

#### ggplot time! ====================================================== 
# Tue Feb 12 14:31:56 2019 ------------------------------

#ggplot2 is part of the tidyverse and the package is already loaded

# ggplot(data = DATA, mapping = aes(MAPPINGS)) + geom_function()

ggplot(data = surveys_complete)

#define mapping 

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

# saving a plot object 

surveys_plot <- ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

surveys_plot + 
  geom_point(mapping = aes(color = species_id))

surveys_plot +
  geom_hex()

# we're going to build our plots from the ground up 

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))


# modifying whole geom appearances 
surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "tomato") #alpha changes the transparency 

# using data in a geom 

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))


#putting color as a global aesthetic

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_point(alpha = 0.1) #same graph but any geoms we add to this will also include color

# using a little jitter, prevents points from being plotted on top of each other

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_jitter(alpha = 0.1)

# moving onto boxplots

surveys_complete %>% 
  ggplot(aes(x = species_id, y = weight)) + 
  geom_boxplot()

#adding points to boxplot

surveys_complete %>% 
  ggplot(aes(x = species_id, y = weight)) + 
  geom_jitter(alpha = 0.01, color = "tomato") +
  geom_boxplot(alpha = 0) 

# plotting time series 

yearly_counts <- surveys_complete %>% 
  count(year, species_id) #same as doing group_by(year, species_id) and tally()

yearly_counts %>% 
  ggplot(aes(x = year, y = n, group = species_id, color = species_id)) +
  geom_line()

# facetting 

yearly_counts %>% 
  ggplot(aes(x = year, y = n)) +
  geom_line() + 
  facet_wrap(~ species_id)

# including sex

yearly_sex_counts <- surveys_complete %>% 
  count(year, species_id, sex)

yearly_sex_counts %>% 
  ggplot(aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) + 
  theme_bw() + 
  theme(panel.grid = element_blank())


ysx_plot <- yearly_sex_counts %>% 
  ggplot(aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id)


ysx_plot + ggthemes::theme_tufte()

# a little more facetting 

yearly_sex_weight <- surveys_complete %>% 
  group_by(year, sex, species_id) %>% 
  summarize(avg_weight = mean(weight))

yearly_sex_weight %>% 
  ggplot(aes(x = year, y = avg_weight, color = species_id)) + 
  geom_line() +
  facet_grid(sex ~ .) #make the rows sex

yearly_sex_weight %>% 
  ggplot(aes(x = year, y = avg_weight, color = species_id)) + 
  geom_line() +
  facet_grid(sex ~ .)

# facet grid yses rows ~ columns for facetting. The "." indicates nothing in this dimension 



# adding labels and stuff

yearly_sex_counts %>% 
  ggplot(aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) + 
  theme_bw() + 
  theme(panel.grid = element_blank()) + 
  labs(title = "Observed Species Through Time", x = "Year of Observation", y = "Number of Species") +
  theme(text = element_text(size = 16)) +
  theme(axis.text.x = element_text(color = "grey20", size = 12, angle = 90, hjust = 0.5, vjust = 0.5))


yearly_sex_counts %>% 
  ggplot(aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) + 
  theme_bw() + 
  theme(panel.grid = element_blank()) + 
  labs(title = "Observed Species Through Time", x = "Year of Observation", y = "Number of Species") +
  theme(text = element_text(size = 16)) +
  theme(axis.text.x = element_text(color = "grey20", size = 12, angle = 45, hjust = 1))


ggsave("figures/my_test_facet_plot.jpeg", height = 8, width = 8) # defaults to last plot made


# partner this week is Dave 



