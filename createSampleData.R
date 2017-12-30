#createSampleFile <- function(filepath, fileName,selectprob, outFile){
#  ofileName <- paste(filepath,"en_US.", fileName, ".txt", sep = "")
#  
#  openFile <- file(ofileName, open="rb")
#  
#  filedata <- readLines(openFile,encoding="UTF-8", skipNul = TRUE)
#  
#  set.seed(28122017)
#  
#  sitems <- rbinom(n = length(filedata), size = 1, prob = selectprob)
#  
#  #write out to sample file
#  
#  samplefileName <- paste(filepath,"sample_en_US.", fileName, ".txt", sep = "")
#  
#  
#  print(samplefileName)
#  
#  sampFile <- file(samplefileName, open="w")
#  
#  sampData <- filedata[sitems == 1]
#  
#  
#  writeLines(sampData, con = sampFile)
#  #write out to single file
#  writeLines(sampData, con = outFile)
#  
#  close(openFile)
#  rm(openFile)
#  close(sampFile)
#  rm(sampFile)
#}

#masterPath <- "./datadir/final/en_US/"
#singleSample <- paste(masterPath,"single_US", ".txt", sep = "")
#singleFile <- file(singleSample, open="w")


#createSampleFile(masterPath,"blogs", .001, singleFile)
#createSampleFile(masterPath,"news", .001, singleFile)
#createSampleFile(masterPath,"twitter", .001, singleFile)

#close(singleFile)
#rm(singleFile)
##create single sample file

#read in the three files
set.seed(28122017)
selectProb <- .001
masterPath <- "./datadir/final/en_US/"

#read data and sample
blogName <- paste(masterPath,"en_US.", "blogs", ".txt", sep = "")
blogData <- readLines(blogName, encoding = "UTF-8", skipNul=TRUE)
binomSample <- rbinom(n = length(blogData), size = 1, prob = selectProb)
blogSample <- blogData[binomSample == 1]

newsName <- paste(masterPath,"en_US.", "news", ".txt", sep = "")
newsData <- readLines(newsName, encoding = "UTF-8", skipNul=TRUE)
binomSample <- rbinom(n = length(newsData), size = 1, prob = selectProb)
newsSample <- newsData[binomSample == 1]

twitterName <- paste(masterPath,"en_US.", "twitter", ".txt", sep = "")
twitterData <- readLines(twitterName, encoding = "UTF-8", skipNul=TRUE)
binomSample <- rbinom(n = length(twitterData), size = 1, prob = selectProb)
twitterSample <- twitterData[binomSample == 1]

#create a sample file with all the 3 sample datas
singleSample <- paste(masterPath,"single_US", ".txt", sep = "")
allData <- c(blogSample, newsSample, twitterSample)
writeLines(allData, singleSample)

