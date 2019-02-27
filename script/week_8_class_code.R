# Week 8 class code

library(lubridate)
library(tidyverse)

load("data/mauna_loa_met_2001_minute.rda")

as.Date("02-01-1998", format = "%m-%d-%Y")
mdy("02-01-1998")

# this function want y-m-d-h-m-s-
tm1 <- as.POSIXct("2016-07-24 23:55:26 PDT")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2

tm3 <- as.POSIXct("2010-12-01 11:42:03", tx = "GMT")
tm3

#specifying timezone and date format in the same call
tm4<- as.POSIXct(strptime("2016/04/04 14:47", format = "%Y/%m/%d %H:%M"), tz = "America/Los_Angeles")

tz(tm4)

Sys.timezone() #default timezone on your computer

#Do the same thing with lubridate 


ymd_hm("2016/04/04 14:47", tz = "America/Los_Angeles")

ymd_hms("2016-05-04 22:14:11", tz = "GMT")

#Using lubridate on a dataframe 

nfy1 <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip = 12)

nfy2<- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip =12, col_types = "ccidd")

glimpse(nfy2)

#TANGENT

nfy2<- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip =12, col_types = cols(Date = col_date())) #read everything as normal, but just read the column Date as a different thing 

nfy2$datetime <- paste(nfy2$Date, " ", nfy2$Time, sep = "")

glimpse(nfy2)

nfy2$datetime <- ymd_hms(nfy2$datetime, tz = "America/Los_Angeles")

glimpse(nfy2)

tz(nfy2$datetime_test)

summary(mloa_2001)

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)

glimpse(mloa_2001)

mloa_2001$datetime<- ymd_hm(mloa_2001$datetime)

mloa2 <- mloa_2001 %>% 
  filter(rel_humid != -99, rel_humid != -999) %>% 
  filter(temp_C_2m!= -99, temp_C_2m != -999) %>% 
  filter(windSpeed_m_s!= -99, windSpeed_m_s != -999)

mloa3 <- mloa2 %>%
  mutate(which_month = month(datetime, label = TRUE)) %>% 
  group_by(which_month) %>% 
  summarise(avg_temp = mean(temp_C_2m))

mloa3 %>%
  ggplot()+
  geom_point(aes(x= which_month, y = avg_temp), size =3, color = "blue") +
  geom_line(aes(x=which_month, y =avg_temp))
#Michael is checking this out 



####FUN-CTIONS####

log(5)

my_sum <- function(a=1, b=2){
  the_sum <- a + b
  return(the_sum)
}

my_sum(a=5, b=8)

#Create a function that converts the temp in K to the temp in C (subtract 273.15) 

convert <- function(K) {
  C <-K - 273.15
  return(C)
}

convert(100)

list <- c(8,9,130)
convert(list)


#### Iteration ####

x <- 1:10
log(x)

# for loops

for(i in 1:15){
  print(i)
}
print(1)
print(2)
print(3)

for(i in 1:10){
  print(i)
  print(i^2)
}


# we can use the "i" value as an index

for(i in 1:10){
  print(letters[i])
  print(mtcars$wt[i])
}

for(cat in 12:15){
  print(letters[cat])
  print(mtcars$wt[cat])
}

# make a results vector ahead of time

results <- rep(NA, 10)

for(i in 1:10){
  results[i] <- letters[i]
}
results
