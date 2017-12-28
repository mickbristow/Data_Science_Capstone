createSampleFile <- function(filepath, fileName,selectprob, outFile){
  ofileName <- paste(filepath,"en_US.", fileName, ".txt", sep = "")
  
  openFile <- file(ofileName, open="rb")
  
  filedata <- readLines(openFile,encoding="UTF-8", skipNul = TRUE)
  
  set.seed(28122017)
  
  sitems <- rbinom(n = length(filedata), size = 1, prob = selectprob)
  
  #write out to sample file
  
  samplefileName <- paste(filepath,"sample_en_US.", fileName, ".txt", sep = "")
  #samplefileName <- paste(filepath,"sample_en_US.", fileName, ".RDS", sep = "")
  
  print(samplefileName)
  
  sampFile <- file(samplefileName, open="w")
  
  sampData <- filedata[sitems == 1]
  
  #saveRDS(sampData, file  = samplefileName)
  writeLines(sampData, con = sampFile)
  #write out to single file
  writeLines(sampData, con = outFile)
  
  close(openFile)
  rm(openFile)
  close(sampFile)
  rm(sampFile)
}

masterPath <- "./datadir/final/en_US/"
singleSample <- paste(masterPath,"single_US", ".txt", sep = "")
singleFile <- file(singleSample, open="w")


createSampleFile(masterPath,"blogs", .1, singleFile)
createSampleFile(masterPath,"news", .1, singleFile)
createSampleFile(masterPath,"twitter", .1, singleFile)

close(singleFile)
rm(singleFile)
##create single sample file

