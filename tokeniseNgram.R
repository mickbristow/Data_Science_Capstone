library(dplyr)
library(tidyr)
library(tidytext)


masterPath <- "./datadir/final/en_US/"


tidyCorpus <- function(corpName){
  cleanCorpus <- paste(masterPath,corpName, ".RDS", sep = "")
  finalCorpus <- readRDS(cleanCorpus)
  
  ap_td <- tidy(finalCorpus)
  
  myout <- ap_td %>%
    group_by(term) %>%
    summarise(tot_count =sum(count)) %>%
    arrange(desc(tot_count))
  #rm(myout)
  myout
}


#2 ngram file
cleanD <- tidyCorpus("cleanCorpus2ngram")
outt <- separate(data = cleanD, col = term, into = c("One", "Two"), sep = " ")
ngram2File <- paste(masterPath,"tidy2ngram", ".RDS", sep = "")
saveRDS(outt, file = ngram2File)
rm(outt)
gc()

#3 ngram file
cleanD <- tidyCorpus("cleanCorpus3ngram")
outt <- separate(data = cleanD, col = term, into = c("One", "Two", "Three"), sep = " ")
ngram2File <- paste(masterPath,"tidy3ngram", ".RDS", sep = "")
saveRDS(outt, file = ngram2File)
rm(outt)
gc()

##4 ngram file
cleanD <- tidyCorpus("cleanCorpus4ngram")
outt <- separate(data = cleanD, col = term, into = c("One", "Two", "Three", "Four"), sep = " ")
ngram2File <- paste(masterPath,"tidy4ngram", ".RDS", sep = "")
saveRDS(outt, file = ngram2File)
rm(outt)
gc()

#5 ngram file
cleanD <- tidyCorpus("cleanCorpus5ngram")
outt <- separate(data = cleanD, col = term, into = c("One", "Two", "Three", "Four", "Five"), sep = " ")
ngram2File <- paste(masterPath,"tidy5ngram", ".RDS", sep = "")
saveRDS(outt, file = ngram2File)
rm(outt)
gc()