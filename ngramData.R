library(tm)
library("RWeka")
library(ggplot2)


#load the clean sampled data
masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")

finalCorpus <- readRDS(cleanCorpus)

my1Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=1, max=1))
}

ngram1 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my1Tokeniser))


my2Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=2, max=2))
}

ngram2 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my2Tokeniser))

my3Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=3, max=3))
}

ngram3 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my3Tokeniser))

#save the ngrams for faster access
ngram1File <- paste(masterPath,"cleanCorpus1ngram", ".RDS", sep = "")
saveRDS(ngram1, file = ngram1File)

ngram2File <- paste(masterPath,"cleanCorpus2ngram", ".RDS", sep = "")
saveRDS(ngram2, file = ngram2File)

ngram3File <- paste(masterPath,"cleanCorpus3ngram", ".RDS", sep = "")
saveRDS(ngram3, file = ngram3File)

