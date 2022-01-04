data <- read.csv("/Users/esbishop/Desktop/snake_photos.csv")

head(data)

library(ggplot2)
library(lubridate)

#string split to create a list of all names
split_col = strsplit(as.character(data$FILENAME), "_")

#create the lists for each new variable
BOAT = c()
DATE = c()

#create a counter for the for loop
i = 1

#go through all the name strings
for (s in split_col){
  
  #add to the lists
  BOAT[[i]] = s[1]
  DATE[[i]] = s[2]
  
  #add to the counter
  i = i + 1
}

#add these lists to the dataset
data$DATE = DATE
data$BOAT = BOAT
head(data)

#convert date column from numeric to year-month-date format
data$DATE <- ymd(data$DATE)
head(data)

# Create separate columns for year and month 
data$YEAR <- as.numeric(format(data$DATE, "%Y"))
data$MONTH <- as.numeric(format(data$DATE, "%m"))
head(data)

# Create a dataframe which contains only intances of snakes 
dfsnakes <- data[which(data$CLASS == "snake"),]

# Exploring the data
ggplot(data = dfsnakes, aes(x = YEAR, fill = SPECIES)) +
  geom_bar(position = "dodge")

ggplot(data = dfsnakes, aes(x = MONTH, fill = SPECIES)) +
  geom_bar(position = "dodge")

