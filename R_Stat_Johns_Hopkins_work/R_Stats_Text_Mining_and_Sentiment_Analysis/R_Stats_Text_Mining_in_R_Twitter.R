### Exercise Text Mining

# Part 1

# Get 1000 Tweets to a Search term of your choice ( Term used bigpharma)
# Clean the Tweets - lowercase, remove numbers, punctuation, stopwords
# Rotate a wordcloud of 45 most frequent terms, min frequency is 3
# Rotate 50% of the words
# Color your cloud ( hint: color Brewer)

# Part 2

# use the same dataset - change it to term document matrix
# Get a list of the most frequent terms
# Get a dendrogram, groupit to best fitting group

# Activate Twitter Library
# Part1

tweets = searchTwitter("#bigpharma", n=1000, cainfo="cacert.pen")

head(tweets)

library("tm")

mylist <- sapply(tweets, function(x) x$getText())

mycorpus <- Corpus(VectorSource(mylist))

mycorpus <- tm_mp(mycorpus, tolower)

mycorpus <- tm_map(mycorps, removeNumbers)

mycorpus <- tm_map(mycorpus,
                   function(x)removewords(x,stopwords()))

library("wordcloud")

library("RColorBrewer")
?RcolorBrewer

col <-brewer.pal(5,"Dark2") # 6 is the number of colors, rest pal name

wordcloud(mycorpus, min.freq=3, rot.per=0.5, scale=c(5,2),
          random.color=T, max.word=45, random.order=F, colors=col)

# scale to adjust the size
# rot.per to adjust the number of rotated words
# random.color to connect frequency to color
# get colors from the ColorBrewer

# Part 2

# use the same dataset - change it to term document matrix
# Get a list of the most frequent terms
# Get a dendrogram, groupit to best fitting group

mytdm <- TermDocumentMatric (mycorpus)

findFreqTerms (mytdm, sparse= 0.93) # experiment with sparse

tdm <-removeSparseTerms(mytdm, sparse=0.93) # experiment with sparse

tdmscale <- scale(tdm)

dist <- dist(tdmscale, method="cranberra")

fit <- hclust(dist)

plot(fit)

# nned to change margins and delete some titles

par(mai=c1,1.2,1,0.5))
plot(fit, xlab="", sub="", col.main="Salmon")

cutree(fit,k=7)

rec.hclust(fit, k=7, border="salmon")

