
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

