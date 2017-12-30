library(tm)
library("RWeka")
library(ggplot2)
library(dplyr)
library(tidytext)


masterPath <- "./datadir/final/en_US/"


plotNgram <- function(myNgram, topNum){
  
  ap_td <- tidy(finalCorpus)
  
  myout <- ap_td %>%
    group_by(term) %>%
      summarise(tot_count =sum(count)) %>%
        arrange(desc(tot_count))
  
  myData <- myout[1:topNum,]
  myData$term2 <- factor(myData$term, as.character(myData$term))
  
  
  histo <- ggplot(myData, aes(x=term2, y= tot_count)) + 
    geom_bar(stat="identity") +
    xlab("Words") +
    ylab("Occurrence") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  histo
}


cleanCorpus <- paste(masterPath,"cleanCorpus1ngram", ".RDS", sep = "")
finalCorpus <- readRDS(cleanCorpus)

g1 <- plotNgram(finalCorpus,10)

cleanCorpus <- paste(masterPath,"cleanCorpus2ngram", ".RDS", sep = "")
finalCorpus <- readRDS(cleanCorpus)

g2 <- plotNgram(finalCorpus,10)


cleanCorpus <- paste(masterPath,"cleanCorpus3ngram", ".RDS", sep = "")
finalCorpus <- readRDS(cleanCorpus)

g3 <- plotNgram(finalCorpus,10)