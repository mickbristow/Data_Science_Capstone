library(stringr)
library(qdap)
library(tm)

masterPath <- "./datadir/final/en_US/"
#Load all the tidy ngram files

#2gram
cleanCorpus <- paste(masterPath,"tidy2ngram", ".RDS", sep = "")
#bigram <- readRDS(cleanCorpus)

#3gram
cleanCorpus <- paste(masterPath,"tidy3ngram", ".RDS", sep = "")
#trigram <- readRDS(cleanCorpus)

#4gram
cleanCorpus <- paste(masterPath,"tidy4ngram", ".RDS", sep = "")
#quadgram <- readRDS(cleanCorpus)

#5gram
cleanCorpus <- paste(masterPath,"tidy5ngram", ".RDS", sep = "")
#quingram <- readRDS(cleanCorpus)

#helper functions

#normalise data request
cleanRequest <- function(request){
 # print(request)
 # request <- rm_stopwords(request, tm::stopwords("english"), separate = FALSE)
#  print(request)
  request <- removePunctuation(request)
  request <- tolower(request)
  request <- removeNumbers(request)
 # print(request)
  
}

predictWord <- function(request){
  #split request intop individual words
  request <- cleanRequest(request)
  reqWords <- strsplit(request, " ")
  reqCount <- length(reqWords[[1]])
  
  prectictorWords <- c(NA,NA, NA,NA)
  #predictor words holder
  if (reqCount >= 4){
    prectictorWords <- c(word(request,-4),word(request,-3),word(request,-2),word(request,-1))
  }
  else if (reqCount == 3){
    prectictorWords <- c(NA,word(request,-3),word(request,-2),word(request,-1))
  }
  else if(reqCount == 2){
    prectictorWords <- c(NA,NA,word(request,1), word(request,2))
  }
  else if (reqCount == 1){
    prectictorWords <- c(NA,NA,NA, word(request,1))
  }
  else{
    return(NULL)
  }
  

  predictedwORD <- NA
  #start using quad gram if enough words and then fall back to 3 and 2 if smaller words or not found
  if (reqCount >= 4){
    predictedwORD <- quingram[quingram$One==prectictorWords[1] &
                                quingram$Two==prectictorWords[2] &
                                quingram$Three==prectictorWords[3] &
                                quingram$Four==prectictorWords[4],5] 
    print("4")
    
  }
  
  if (reqCount == 3 | !length(predictedwORD[[1]])){
    predictedwORD <- quadgram[quadgram$One==prectictorWords[2] &
                                quadgram$Two==prectictorWords[3] &
                                  quadgram$Three==prectictorWords[4],4] 
    
    print("3")
    
  }
  
  if (reqCount == 2 | !length(predictedwORD[[1]])){
    predictedwORD <- trigram[trigram$One==prectictorWords[3] &
                                trigram$Two==prectictorWords[4],3]
 
    print("2")
  }
  
  if (reqCount == 1 | !length(predictedwORD[[1]])){
    predictedwORD <- bigram[bigram$One==prectictorWords[4],2]
    
    print("1")
  }
  
  if (length(predictedwORD[[1]] > 0)){ #found
    predictedwORD <- predictedwORD[[1,1]]
  }
  
  print(length(predictedwORD[[1]]))
  predictedwORD
}

#req <- "You're the reason why I smile everyday. Can you follow me please? It would mean the"
req <- "the"
#ptm <- proc.time()
#print(req)
nextWord <- predictWord(req)
#print(proc.time() - ptm)
print(nextWord)

