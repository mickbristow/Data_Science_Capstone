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
#save the ngrams for faster access
ngram1File <- paste(masterPath,"cleanCorpus1ngram", ".RDS", sep = "")
saveRDS(ngram1, file = ngram1File)
rm(ngram1)
gc()



my2Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=2, max=2))
}

ngram2 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my2Tokeniser))
ngram2File <- paste(masterPath,"cleanCorpus2ngram", ".RDS", sep = "")
saveRDS(ngram2, file = ngram2File)
rm(ngram2)
gc()


my3Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=3, max=3))
}

ngram3 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my3Tokeniser))
ngram3File <- paste(masterPath,"cleanCorpus3ngram", ".RDS", sep = "")
saveRDS(ngram3, file = ngram3File)
rm(ngram3)
gc()

my4Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=4, max=4))
}

ngram4 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my4Tokeniser))
ngram4File <- paste(masterPath,"cleanCorpus4ngram", ".RDS", sep = "")
saveRDS(ngram4, file = ngram4File)
rm(ngram4)
gc()

my5Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=5, max=5))
}

ngram5 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my5Tokeniser))
ngram5File <- paste(masterPath,"cleanCorpus5ngram", ".RDS", sep = "")
saveRDS(ngram5, file = ngram5File)
rm(ngram5)
gc()




