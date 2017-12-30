library(tm)
library(wordcloud)
library(ggplot2)
library(reshape2)

#load the clean sampled data
masterPath <- "./datadir/final/en_US/"
cleanCorpus <- paste(masterPath,"cleanCorpus", ".RDS", sep = "")

print("read")
finalCorpus <- readRDS(cleanCorpus)

#nake a document term matrix toi allow for data exploration

#finalCorpus <- tm_map(finalCorpus, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))



#word cloud
#png("wordcloud.png", width=480, height=480)
#wordcloud(finalCorpus, max.words = 100, random.order = FALSE,  colors=brewer.pal(8, "Dark2"))
##close the PNG file
#dev.off()

mat <- DocumentTermMatrix(finalCorpus)
# get the words appeared at least 1,000 times
mat <- removeSparseTerms(mat, 0.99)
highh <- mat[,findFreqTerms(x = mat, lowfreq=1000, highfreq=Inf)]

# frequency summary
freqency <- colSums(as.matrix(highh))
# select the top 100 words that appear most frequently
topWords <- as.data.frame(freqency[head(order(freqency, decreasing = T), 100)])
topWords$item <- rownames(topWords)

#factor so it does not sort
topWords$item <- factor(topWords$item, levels = topWords$item)

colnames(topWords) <- c("value","item")

png("popularwords.png", width=600, height=480)
histo <- ggplot(topWords[1:10,], aes(x=item, y= value)) + 
  geom_bar(stat="identity") +
  xlab("Words") +
  ylab("Occurrence")
print(histo)
dev.off()


