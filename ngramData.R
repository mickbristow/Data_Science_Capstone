library(tm)
library("RWeka")


#creaet plt function
plotNgram <- function(myNgram, topNum){
  mymatrix <- as.matrix(myNgram)
  wordcount <- colSums(mymatrix)
  #create a data frame
  mydf <- as.data.frame(melt(wordcount))
  #set extra column with row name, makes plotting easier
  mydf$item <- rownames(mydf)
  mydf <- mydf[order(-mydf$value),]
  #factor so it does not sort
  mydf$item <- factor(mydf$item, levels = mydf$item)
  
  histo <- ggplot(mydf[1:topNum,], aes(x=item, y= value)) + 
    geom_bar(stat="identity") +
    xlab("Words") +
    ylab("Occurrence") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
 }


#load the clean sampled data
masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")

finalCorpus <- readRDS(cleanCorpus)

my2Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=2, max=2))
}

ngram2 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my2Tokeniser))

my3Tokeniser <- function(useCorpus, ngramLevel){
  NGramTokenizer(useCorpus, Weka_control(min=3, max=3))
}

ngram3 <- DocumentTermMatrix(finalCorpus, control=list(tokenize=my3Tokeniser))


g2 <- plotNgram(ngram2,10)

g3 <- plotNgram(ngram3,10)

#save the ngrams for faster access
ngram2File <- paste(masterPath,"cleanCorpus2ngram", ".RDS", sep = "")
saveRDS(ngram2, file = ngram2File)

ngram3File <- paste(masterPath,"cleanCorpus3ngram", ".RDS", sep = "")
saveRDS(ngram3, file = ngram3File)