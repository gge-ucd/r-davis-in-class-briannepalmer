#first step it to pull the repository 

#intro to dataframes

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv" )

surveys <- read.csv(file = "data/portal_data_joined.csv") #once you put the quotes, press tab to see the path! 

head(surveys)
#in a dataframe, every column is a vector 

#lets look at structure

str(surveys)

summary(surveys)
#use this to check if your data makes sense

#subsetting dataframes 
animal_vc <- c("mouse", "rat","cat")
animal_vc[2]
#when subsetting a vector, give them a location index
#dataframes are 2D

surveys[1,1] #first row and first column 
head(surveys)
surveys[2,1]

#whole first column 
surveys[,1] #gives whole first column as a VECTOR 

head(surveys[1]) #using a single number, with no comma, gives us a DATAFRAME with one column 

#pull out the first 3 values in the 6th column 
surveys[1:3, 6]


#pull out a whole single observation 

surveys[5,] #produces a DATAFRAME with 1 row and 13 columns 

#use negative sign to exluce indices 

surveys[1:5, -1] #first five rows, everything but the first column 

surveys[-10:34786, ] #error

surveys[-c(10:34786),]
str(surveys[-c(10:34786),])
surveys[c(10,15,20),]
surveys[c(10,15,20, 10),]

#more ways to subset 
names(surveys)
surveys["plot_id"] # single column as dataframe 
surveys[,"plot_id"] # single column as vector
surveys[["plot_id"]] #single column as vector, useful for lists (we will get to this later)

surveys$year #single column as vector 

#CHALLENGE#

surveys_200 <- surveys[200,]
nrow(surveys)
tail(surveys)
surveys_last <- surveys[nrow(surveys),]
surveys_last
surveys_middle <- surveys[nrow(surveys)/2, ]
surveys_middle
surveys_head <- surveys[-c(7:nrow(surveys)), ]
surveys_head

# Finally, factors 
# factors are stored as integers with labels assigned to them 
surveys$sex
# has 3 levels: [space], F, and M

# creating our own factor 
sex <- factor(c("male", "female", "female", "male"))
sex
class(sex)
typeof(sex)

levels(sex) #character vector
levels(surveys$genus) # levels() gives back a character vectors of levels 
nlevels(sex) #number of levels 

concentration <- factor(c("high","medium", "high", "low"))
concentration
concentration <- factor(concentration, levels = c("low","medium","high")) #put the levels in the order that we want them 
concentration

#let's try adding to a factor 

concentration <- c(concentration, "very high")
concentration
# assigned everything as a character based on the integers they were stored in, basically DON'T do this 

#let's just make em characters

as.character(sex)

#factors with numeric levels
year_factor <- factor(c(1990, 1923, 1965, 2018))
as.numeric(year_factor)
# get underlying integer values 

as.numeric(as.character(year_factor))
# gets back what we expected, a numeric vector 

# recommended way 
as.numeric(levels(year_factor))[year_factor]

# why the heck all the factors?

?read.csv
# in the read.csv function, the stringsAsFactors defaults to TRUE
surveys_no_factors <-read.csv(file = "data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys_no_factors)
# represents the strings as characters, this makes it easy to add to the data since you can't add to factors

#renaming factors
sex<- surveys$sex
levels(sex)
levels(sex)[1] <- "undetermined"
levels(sex)
head(sex)


#working with dates 
library(lubridate)
my_date <- ymd("2015-01-01")
my_date
str(my_date)

my_date <- ymd(paste("2015,05,17", sep = "-"))
my_date            

paste(surveys$year, surveys$month, surveys$day, sep = "-")
surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
surveys$date
is.na(surveys$date)  
surveys$date[is.na(surveys$date)]


#homework partner 
#colbyhause
                    