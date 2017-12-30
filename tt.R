library(tm)
library("RWeka")
library(ggplot2)
library(dplyr)
library(tidytext)


masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"cleanCorpus3ngram", ".RDS", sep = "")

finalCorpus <- readRDS(cleanCorpus)
#ap_td <- tidy(finalCorpus)
#nn <- arrange(ap_td,desc(count))


#histo <- ggplot(nn[1:10,], aes(x=term, y= count)) + 
#  geom_bar(stat="identity") +
#  xlab("Words") +
#  ylab("Occurrence") +
#  theme(axis.text.x = element_text(angle = 90, hjust = 1))#

#print(histo)
#creaet plt function
plotNgram <- function(myNgram, topNum){
  ap_td <- tidy(finalCorpus)
  nn <- arrange(ap_td,desc(count))
  
  
  histo <- ggplot(nn[1:topNum,], aes(x=term, y= count)) + 
    geom_bar(stat="identity") +
    xlab("Words") +
    ylab("Occurrence") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  histo
}

g2 <- plotNgram(finalCorpus,10)