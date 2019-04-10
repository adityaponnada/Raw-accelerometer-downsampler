#### Import libraries
library(MASS)
library(dplyr)
library(plyr)
library(reshape2)


samplingRate = 0.0008

filePath = "C:/Users/Dharam/Downloads/Signaligner_files/DummyFiles_30Jan/Hour_Raw_2.csv"

rawData <- read.csv(filePath, sep = ",", header = TRUE)

head(rawData)

tail(rawData)

print(paste0("Number of rows: ", nrow(rawData)))


#### Convert column names to more more readable ones
#names(rawData) <- c("TIME_STAMP", "X_ACC", "Y_ACC","Z_ACC")

keep <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", "Z_ACCELERATION_METERS_PER_SECOND_SQUARED", "LABEL")
rawData <- rawData[, keep]

names(rawData) <- c("X_ACC", "Y_ACC","Z_ACC", "LABEL")

names(rawData)

#### Convert to date time stamp
#rawData$TIME_STAMP <- as.POSIXct(rawData$TIME_STAMP, format = "%m/%d/%Y %H:%M:%OS")

class(rawData$TIME_STAMP)

head(rawData$TIME_STAMP)

