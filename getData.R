library(ngram)

#create a data directory if not exits
if(!file.exists("./datadir")){
  dir.create("./datadir")
}

fileName <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

#check if file exits
if(!file.exists("./datadir/Coursera-SwiftKey.zip")){
  download.file(fileName,destfile="./datadir/Coursera-SwiftKey.zip",mode = "wb")
#unzip
  unzip(zipfile="./datadir/Coursera-SwiftKey.zip",exdir="./datadir")
}

#get some information on files
fileInfo <- function(filepath, fileName){
  fileOpen <- paste(filepath,"en_US.", fileName, ".txt", sep = "")
  print(paste("Filename:", fileOpen))
  
  openFile <- file(fileOpen, open="rb")
  
  fSize <- file.info(fileOpen)$size /1024 ^ 2
  
  filedata <- readLines(openFile,encoding="UTF-8", skipNul = TRUE)
  
  flen <- length(filedata)
  
  fmax <- max(nchar(filedata))
  
  love_count <- sum(grepl("love", filedata))
  hate_count <- sum(grepl("hate", filedata))
  fratio <- love_count / hate_count
  
  biostats <- grep("biostats", filedata)
  fbio <- filedata[biostats]
  
  fsent <- sum(grepl("A computer once beat me at chess, but it was no match for me at kickboxing", filedata))
  
  fwords <- wordcount(filedata, sep = " ", count.function = sum)
  
  print(paste("Size (Mb):", fSize))
  print(paste("Lines :", flen))
  print(paste("Max line len :", fmax))
  print(paste("Ratio :", fratio))
  print(paste("bistats line :", fbio))
  print(paste("Num sents :", fsent))
  print(paste("Num words :", fwords))
  
  
  
  close(openFile)
  rm(openFile)
  
}

fileInfo("./datadir/final/en_US/","blogs")
fileInfo("./datadir/final/en_US/","news")
fileInfo("./datadir/final/en_US/","twitter")