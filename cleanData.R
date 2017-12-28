library(tm)
#read in sample file
masterPath <- "./datadir/final/en_US/"
singleSample <- paste(masterPath,"single_US", ".txt", sep = "")
singleFile <- file(singleSample, open="rb")
filedata <- readLines(singleFile,encoding="UTF-8", skipNul = TRUE)
close(singleFile)
rm(singleFile)

#create corpus and clean data
dataCorpus <- VCorpus(VectorSource(filedata))

print("utf")
dataCorpus <- tm_map(dataCorpus, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))


print("plain")
#set as plain text
dataCorpus <- tm_map(dataCorpus, PlainTextDocument)

print("tolower")
#convert to lower
dataCorpus <- tm_map(dataCorpus, tolower)

print("white")
#strip whitespace
dataCorpus <- tm_map(dataCorpus, stripWhitespace)

print("stop")
#remove stop words
dataCorpus <- tm_map(dataCorpus, removeWords, stopwords("english"))

print("num")
#remove numbers
dataCorpus <- tm_map(dataCorpus, removeNumbers)

print("punc")
#remove punctuation
dataCorpus <- tm_map(dataCorpus, removePunctuation)

print("stem")
#stem words
dataCorpus <- tm_map(dataCorpus, stemDocument)

print("save")
#save cleaned corpus
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")
saveRDS(dataCorpus, file = cleanCorpus)
