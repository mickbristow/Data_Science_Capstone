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
dataCorpus <- tm_map(dataCorpus, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))

toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
dataCorpus <- tm_map(dataCorpus, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")
dataCorpus <- tm_map(dataCorpus, toSpace, "@[^\\s]+")

#convert to lower
dataCorpus <- tm_map(dataCorpus, tolower)

#remove stop words
dataCorpus <- tm_map(dataCorpus, removeWords, stopwords("english"))

#remove numbers
dataCorpus <- tm_map(dataCorpus, removeNumbers)

#remove punctuation
dataCorpus <- tm_map(dataCorpus, removePunctuation)

#stem words
#dataCorpus <- tm_map(dataCorpus, stemDocument, language = "english")

#strip whitespace
dataCorpus <- tm_map(dataCorpus, stripWhitespace)

#set as plain text
dataCorpus <- tm_map(dataCorpus, PlainTextDocument)

#save cleaned corpus
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")
saveRDS(dataCorpus, file = cleanCorpus)