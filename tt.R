library(tm)
library("RWeka")
library(ggplot2)
library(dplyr)
library(tidytext)
library(stringr)
library(tidyr)

masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"final4Data.RData", sep = "")

herCorpus <- readRDS(cleanCorpus)

cleanCorpus <- paste(masterPath,"fourgrams.rds", sep = "")

hisCorpus <- readRDS(cleanCorpus)

cleanCorpus <- paste(masterPath,"cleanCorpus4ngram.RDS", sep = "")

#myfinalCorpus <- readRDS(cleanCorpus)

#ap_td <- tidy(myfinalCorpus)

#myout <- ap_td %>%
#  group_by(term) %>%
#  summarise(tot_count =sum(count)) %>%
#  arrange(desc(tot_count))

#outt <- separate(data = myout, col = term, into = c("One", "Two", "Three", "Four"), sep = " ")


#ngram2File <- paste(masterPath,"tidy2ngram", ".RDS", sep = "")
#saveRDS(myout, file = ngram2File)


#df[grep("trna", df$common_name
#sword <- "feel"
#masterPath <- "./datadir/final/en_US/"
#cleanCorpus <- paste(masterPath,"tidy2ngram", ".RDS", sep = "")
#finalCorpus <- readRDS(cleanCorpus)
#ptm <- proc.time()

#sphrase <- paste("^", sword, " ", sep = "")
#x <- finalCorpus[grep(sphrase,finalCorpus$term),]

#x <- grep(sphrase,finalCorpus$term)
#found <- finalCorpus[x[1],1]
#print(proc.time() - ptm)
#print(word(found,-1))
#print(found)


#cleanCorpus <- paste(masterPath,"tidy2ngram", ".RDS", sep = "")
#finalCorpus <- readRDS(cleanCorpus)

#outt <- separate(data = finalCorpus, col = term, into = c("One", "Two"), sep = " ")

#xx <- outt[outt$One == sword]
#xx <- outt[outt$One == sword,2]
#yy <- outt[xx,]
#splitdf <- separate(finalCorpus$term,c("1","2"), " ")
