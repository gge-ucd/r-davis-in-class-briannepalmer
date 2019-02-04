surveys <- read.csv(file = "data/portal_data_joined.csv")

#Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called  surveys_subset

surveys_subset <- surveys[c(1:400), c(1,5:8)]
head(surveys_subset)

#CHALLENGE: Select all rows that have a hindfoot_length greater than 32, save these in a new data.frame named  surveys_long_feet, then plot its hindfoot_length values as a histogram using the hist function.

surveys_long_feet <- surveys_subset[which(surveys_subset[,5]>32),]
head(surveys_long_feet)
hist(x = surveys_long_feet$hindfoot_length)

#Change the column hindfoot_lengths into a character vector.

as.character(surveys_long_feet$hindfoot_length)

#Plot the hindfoot_lengths in a histogram (if this doesn’t work, just leave it, and think about it during Part II of the assignment, wink wink).

hist(surveys_long_feet$hindfoot_length)
