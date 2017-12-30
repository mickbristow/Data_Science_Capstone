#read in the three files
set.seed(28122017)
selectProb <- .10
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

encodingASCII <- function(inputData, print=FALSE){
  inputData <- lapply(inputData, function(row) iconv(row, "latin1", "ASCII", sub="")) 
  return(unlist(inputData))
}
cleanData <- encodingASCII(allData)

writeLines(cleanData, singleSample)

