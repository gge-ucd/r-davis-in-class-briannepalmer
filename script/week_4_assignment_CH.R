surveys<- read.csv("data/portal_data_joined.csv")

# Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called  surveys_subset.

surveys_subset <- surveys[1:400, c(1, 5:8)]

## Comment from Brianne ##
head(surveys_subset) #checking to make sure you subsetted right and you did! 


# CHALLENGE: Select all rows that have a hindfoot_length greater than 32, save these in a new data.frame named  surveys_long_feet, then plot its hindfoot_length values as a histogram using the hist function.

surveys_long_feet <- surveys_subset[surveys_subset$hindfoot_length > 32, ]

## Comment from Brianne ## 
head(surveys_long_feet) # again, checking that you subsetted right. All the values are NA so something went wrong in the code. Consider using:

surveys_long_feet <- surveys_subset[which(surveys_subset[,5]>32),]


hist(surveys_long_feet$hindfoot_length)
#histogram looks good

# Change the column hindfoot_lengths into a character vector.

x <-as.character(factor(surveys_long_feet$hindfoot_length))

hist(x)


