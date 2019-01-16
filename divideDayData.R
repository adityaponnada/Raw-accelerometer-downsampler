

resampledData$HEADER_TIME <- as.POSIXct(resampledData$HEADER_TIME, format = "%m/%d/%Y %H:%M:%OS")



head(resampledData)


resampleSplit <- resampledData


data1 <- subset(resampledData, resampledData$HEADER_TIME >= as.POSIXct("2015-10-06 00:00:00.000") & resampledData$HEADER_TIME <= as.POSIXct("2015-10-06 23:59:59.999"))

write.csv(data1, file = "C:/Users/Dharam/Downloads/MDCAS Files/RawUnlabelledData/day1.csv", row.names = FALSE, sep = ",")


data2 <- subset(resampledData, resampledData$HEADER_TIME >= as.POSIXct("2015-10-07 00:00:00.000") & resampledData$HEADER_TIME <= as.POSIXct("2015-10-07 23:59:59.999"))

write.csv(data2, file = "C:/Users/Dharam/Downloads/MDCAS Files/RawUnlabelledData/day2.csv", row.names = FALSE, sep = ",")

data3 <- subset(resampledData, resampledData$HEADER_TIME >= as.POSIXct("2015-10-08 00:00:00.000") & resampledData$HEADER_TIME <= as.POSIXct("2015-10-08 23:59:59.999"))

write.csv(data3, file = "C:/Users/Dharam/Downloads/MDCAS Files/RawUnlabelledData/day3.csv", row.names = FALSE, sep = ",")
