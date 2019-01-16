
resampledData <- data.frame(HEADER_TIME = NA, START_TIME = NA, END_TIME = NA, X_ACC = NA, Y_ACC = NA, Z_ACC = NA, 
                            X_MAX = NA, X_MIN = NA, Y_MAX = NA, Y_MIN = NA, Z_MAX = NA, Z_MIN = NA)


rawData$TIME_STAMP <- as.character(rawData$TIME_STAMP)

rawSampling = 80

clubbedSamples = rawSampling/samplingRate


#raw1 <- head(rawData, 100)

raw1 <- rawData

for (i in seq(1,nrow(raw1), clubbedSamples)){
  
  if (i > nrow(raw1)){
    
    break
  }
  
  print(paste0("At row: ", i))
  
  end_i = i + clubbedSamples-1
  
  tempSubset <- raw1[i:end_i,]
  
  
  
  
  meanX <- mean(tempSubset$X_ACC)
  meanY <- mean(tempSubset$Y_ACC)
  meanZ <- mean(tempSubset$Z_ACC)
  
  X_min <- min(tempSubset$X_ACC)
  Y_min <- min(tempSubset$Y_ACC)
  Z_min <- min(tempSubset$Z_ACC)
  
  X_max <- max(tempSubset$X_ACC)
  Y_max <- max(tempSubset$Y_ACC)
  Z_max <- max(tempSubset$Z_ACC)
  
  
  tempSampled <- data.frame(HEADER_TIME = tempSubset$TIME_STAMP[1], START_TIME = tempSubset$TIME_STAMP[1], END_TIME = tempSubset$TIME_STAMP[5], X_ACC = meanX,
                            Y_ACC = meanY, Z_ACC = meanZ, X_MAX = X_max, Y_MAX = Y_max, Z_MAX = Z_max, X_MIN = X_min, Y_MIN = Y_min, Z_MIN = Z_min)
  
  
 
  resampledData <- rbind(resampledData, tempSampled)
  #j = i + 5
  
  
  
}


resampledData <- resampledData[-1,]


head(resampledData)
tail(resampledData)

print(paste0("The number of samples: ", nrow(resampledData)))



