
resampledData <- data.frame(X_ACC = NA, Y_ACC = NA, Z_ACC = NA, 
                            X_MAX = NA, X_MIN = NA, Y_MAX = NA, Y_MIN = NA, Z_MAX = NA, Z_MIN = NA, LABEL = NA)



getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


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
  LABEL <- getmode(tempSubset$LABEL)
  
  
  tempSampled <- data.frame(X_ACC = meanX,
                            Y_ACC = meanY, Z_ACC = meanZ, X_MAX = X_max, Y_MAX = Y_max, Z_MAX = Z_max, X_MIN = X_min, Y_MIN = Y_min, Z_MIN = Z_min, LABEL = LABEL)
  
  
  
  resampledData <- rbind(resampledData, tempSampled)
  #j = i + 5
  
  
  
}


resampledData <- resampledData[-1,]


head(resampledData)
tail(resampledData)

print(paste0("The number of samples: ", nrow(resampledData)))

midPoint <- nrow(resampledData)/2

subset1 <- resampledData[1:midPoint,]
subset2 <- resampledData[midPoint:nrow(resampledData),]


write.csv(file = "C:/Users/Dharam/Downloads/Signaligner_files/DummyFiles_30Jan/30_min_zoomedin_5.csv", x = subset1, quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ",")
