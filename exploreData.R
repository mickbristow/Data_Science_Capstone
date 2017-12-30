library(tm)
library(wordcloud)
library(ggplot2)
library(reshape2)

#load the clean sampled data
masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")

finalCorpus <- readRDS(cleanCorpus)

#nake a document term matrix toi allow for data exploration

#finalCorpus <- tm_map(finalCorpus, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))



#word cloud
png("wordcloud.png", width=480, height=480)
wordcloud(finalCorpus, max.words = 100, random.order = FALSE,  colors=brewer.pal(8, "Dark2"))
##close the PNG file
dev.off()


mat <- DocumentTermMatrix(finalCorpus)
mymatrix <- as.matrix(mat)
wordcount <- colSums(mymatrix)
#create a data frame
mydf <- as.data.frame(melt(wordcount))
#set extra column with row name, makes plotting easier
mydf$item <- rownames(mydf)
mydf <- mydf[order(-mydf$value),]
#factor so it does not sort
mydf$item <- factor(mydf$item, levels = mydf$item)

#png("popularwords.png", width=600, height=480)
histo <- ggplot(mydf[1:10,], aes(x=item, y= value)) + 
  geom_bar(stat="identity") +
  xlab("Words") +
  ylab("Occurrence")
print(histo)
#dev.off()


