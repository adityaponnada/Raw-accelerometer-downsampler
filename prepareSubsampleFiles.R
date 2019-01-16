#### Import libraries
library(MASS)
library(dplyr)
library(plyr)
library(reshape2)


samplingRate = 0.2

filePath = "C:/Users/Dharam/Downloads/MDCAS Files/RawUnlabelledData/SPADES_2/Spades_2(2015-10-06)RAW.csv"

rawData <- read.csv(filePath, sep = ",", header = TRUE, skip = 10)

head(rawData)

tail(rawData)

print(paste0("Number of rows: ", nrow(rawData)))


#### Convert column names to more more readable ones
names(rawData) <- c("TIME_STAMP", "X_ACC", "Y_ACC","Z_ACC")

names(rawData)

#### Convert to date time stamp
#rawData$TIME_STAMP <- as.POSIXct(rawData$TIME_STAMP, format = "%m/%d/%Y %H:%M:%OS")

class(rawData$TIME_STAMP)

head(rawData$TIME_STAMP)

