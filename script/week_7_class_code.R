# Week 7 Live Code 

# Cowplot -- allows you to make multiple plots in a single figure 

# how to install a package from GitHub

devtools::install_github("thomasp85/patchwork")

# importing and exporting data 

read.csv("data/wide_eg.csv") # first two lines are not the headers, we don't want to use them 
library(tidyverse)

wide_data <- read_csv("data/wide_eg.csv", skip = 2)

# rds and rda are used to store R objects as a file, this is usful when running models. 

load("data/mauna_loa_met_2001_minute.rda") 

# .rds has to be a single R object, 
# .rda can have multiple R objects 
# write wide_data to rds files
saveRDS(wide_data, "data/wide_data.rds")

# to remove an object from your environment
rm(wide_data)

# read wide_data back in
wide_data_rds <- readRDS("data/wide_data.rds") # need to assign RDS to an object 

# RDS and RDAs are also very helpful when working with large datasets, this could be VERY useful when analyzing metagenomics 

# use saveRDS() and readRDS() fro .rds files, and we use save() and load() for .rda files 


#readxl:: allows you to look into an excel worksheet to look at different tabs within an exel file
# other helpful packages: googlesheets, googledrive, foreign, and rio

rio:: import("data/wide_data.rds") # this allows us to import a TON of different file types 


### Working with Dates and Times ####

library(lubridate)

sample_dates1 <- c("2016-02-01", "2016-03-17", "2017-01-01") # read as characters, need to tell R to read them as dates 
as.Date(sample_dates1) # looking for data that looks like YYYY MM DD

sample_dates2 <- c("02-01-2011", "04-04-1991")
as.Date(sample_dates2) # didn't work because they are in the wrong format, need to tell R what format to use
as.Date(sample_dates2, format = "%m-%d-%Y") # uppercase Y dictates year with 4 numbers in it and lowercase y dictates the year with 2 numbers

as.Date("2016/01/01", format = "%Y/%m/%d")
as.Date("Jul 04, 2017", format = "%b%d, %Y") # lowercase b is the shortened month and uppercase B is the full month name


# can do calculations on dates 

dt1 <- as.Date("2017-07-11")
dt2 <- as.Date("2016-04-22")

# time difference in days 
print(dt1-dt2) 

# time difference in weeks
print(difftime(dt1,dt2, units = "week"))

# can create sequences 
six.weeks <- seq(dt1, length = 6, by = "week")

challenge <- seq(dt1, length = 10, by = "2 week") 


# easy way to do all of this would be to use the lubridate package 

ymd("2016/01/01")
dmy("04.04.91")
mdy("Feb 19, 2005")

# can do all the same print and seq functions as we did above but everything is so much easier with lubridate 














