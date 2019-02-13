#week 5 code

install.packages("tidyverse")
library(tidyverse)
#tidyverse allows you to manuipulate the data and then return it to the original very easily 

surveys <- read_csv("data/portal_data_joined.csv")
#if this doesn't work, use readr::read_csv
str(surveys)

#select is used for columns in data frame 

select(surveys, plot_id, species_id, weight)

#filter is used for selecting rows

filter(surveys, year == 1995)

surveys2 <- filter(surveys, weight <5)
surveys_sml <- select(surveys2, species_id, sex, weight)

#Pipes %>% on a PC, use control-shift-M

#to filter to weights less than 5 and only select three columns

surveys %>% 
  filter(weight<5) %>% 
  select(species_id, sex, weight)

#AMAZING! Think of the PIPE as the word THEM

#Challenge! Subset surveys to include individuals collected before 1995 and retain only the columns year, sex, and weight

surveys %>% 
  filter(year < 1995) %>% 
  select(year, sex, weight)

#mutate is used to make new columns 

surveys<- surveys %>% 
  mutate(weight_kg = weight/1000) %>% 
  mutate(weight_kg2 = weight_kg*2)

surveys %>% 
  filter(!is.na(weight)) %>% #removes NAs from column weight
  mutate(weight_kg = weight/1000) %>% 
  head()

#use "complete cases" to filter out all of the NAs

#CHALLENGE! Create a new data frame from the surveys data that meets the following criteria: contains only the  species_id column and a new column called hindfoot_half containing values that are half the  hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30.


surveys_hindfoot_half <- surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  mutate(hindfoot_half = hindfoot_length / 2) %>%
  filter(hindfoot_half < 30) %>%
  select(species_id, hindfoot_half)

#group_by is good for split-apply-combine 

#compute the mean weight for males and females 

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE)) #NAs weren't computed in the mean 

surveys %>% 
  group_by(sex) %>% 
  mutate(mean_weight = mean(weight, na.rm = TRUE)) %>% View

#mutate adds new columns to an existing data frame, summarize spits out a totally new data frame

surveys %>% 
  filter(is.na(sex))

surveys %>% 
  group_by(species) %>% 
  filter(is.na(sex)) %>% 
  tally()

#you can group_by for multiple columns 

surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>%  View

surveys %>% 
  filter(!is.na(weight)) %>% #removes NAs
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE), min_weight = min(weight)) %>% View


#tally function

surveys %>% 
  group_by(sex) %>% 
  tally()
#shows the number of females, males, and NAs in the dataset 
surveys %>% 
  group_by(sex, species_id) %>% 
  tally()
#shows the number od females, males, and NAs for wach species 

#tally() same as group_by(something) %>% summarize(new_column) = n())



#Gathering and spreading 

#how do you find the mean weight of each species for each plot 

#Spread: data you want to spread, key column variable, value column variable 

surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))
#provides each genus in each plot with the weight 

surveys_spread <- surveys_gw %>% 
  spread(key = genus, value = mean_weight) #make a new column with all the genus and populate with mean_weight

#this would be VERY useful for the SCI plant data and BSC cover that I spent hours manipulating in Excel 

surveys_gw %>% 
  spread(genus, mean_weight, fill = 0) %>% View #changes NAs to 0s



#Gathering 

#recreate surveys_gw from surveys_spread

surveys_gather <- surveys_spread %>% 
  gather(key = genus, value = mean_weight, -plot_id) %>%  #use all the columns except plot_id to fill genus 
  View









































