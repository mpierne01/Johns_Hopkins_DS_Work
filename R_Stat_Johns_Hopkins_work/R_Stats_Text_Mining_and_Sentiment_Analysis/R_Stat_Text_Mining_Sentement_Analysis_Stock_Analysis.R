#### Rstats Sentiment analysis 

# Sentiment Analysis

# Perform a comparative Sentiment analysis on 4 pharama companies: Byer, Prizer, Roche, Novartis
# Get as many tweets as possible from those companies
# Use an opinion lexicon and suitable function to score the sentiment
# Visulize your results and compare the results with teh stock proces ( use yahoo finace)
# Do you see any corrlations between the sentiment and the stock price

# import postive and negative words
pos = readlines("positive_words.txt")
neg = readlines("negative_words.txt")

library('stringr')

library('plyr')

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  scores = lapply(sentences,
                  function(sentence, pos.words, neg.words)
                    # remove punctuation - using global substitute
                    sentence = gsub("[[:punct:]]", "", sentence)
                    # remove control characters 
                    sentence = gsub("[[:cntrl:]]", "", sentence)
                    # remove didgets
                    Sentence = gsub('\\d+', ' ', sentence)
                  
                  # define error handeling function when trying tolower
                  tryTolower = function(x)
                  {
                    # create missing value
                    y = NA
                    # tryCatch error
                    try_error = tryCatch(tolower(x), error=function(e) e)
                    # if not an error
                    if (!inherits(try_error, "error"))
                      y = tolower(x)
                    # result
                    return(y)
                  }
                    # trytolower sapply
                  sentence = sapply(sentence, tryTolower)
                  
                  # split sentence into words with str_split (stringr package)
                  word.list = str_split(senence, "\\s+")
                  words = unlist(word.list)
                  
                  # compare words to the dictonaries of postive and negative terms
                  pos.matches = match(words, pos.words)
                  neg.matches = match(words, neg.words)
                  
                  # get the postition of the matched term or NA
                  # we just want a TRUE/FALSE
                  pos.matches = !is.ns(pos.matches)
                  neg.matches = !is.na(neg.matches)
                  
                  # final score
                  score = sum(pos.matches) - sum(neg.match)
                  return(score)
                  }, pos.words, neg.word, .progress=.progress)

# data frame with scores for each sentence
scores.df = data.frame(text=sentences, score=scores)
return(scores.df)
}

# tweets for companies - may not get the full 900
bayertweets = searchTwitter("bayer", n=900, lang="en", carinfo="cacert.pem")
pfizertweets = searchTwitter("pfizer", n=900, lang="en", cainfo="cacert.pem")
rochetweets = searchtTwitter("roche", n=900, lang="en", cainfo="cacert.pem")
novartistweets = searchTwitter("novartis", n=900, lang="en", cainfo="cacert.pem")

#Get text
bayer_txt = sapply(bayertweets, function(x) x$getText())
pfizer_txt = sapply(pfizertweets, function(x) xgetText())
roche_text = sapply(rochetweets, function(x) xgetText())
novartis_txt = sapply(novartistweets, function(x) xgetText)

# how many tweets
nd = c(bayer_txt, pfizer_txt, roche_txt, novartis_txt)

# Join Texts
company = c(bayer_txt, pfizer_txt, roche_txt, novatis_txt)

# apply function score.sentiment
score = score.sentiment(comapny, pos, neg, . progress = "text")

# add variables to data frame
scores$comapny = factor(rep(c("bayer", "pfizer", "roche", "novartis"), nd))
scores$very.pos = as.numeric(scores$score >= 2)
scores$very.neg = as. numberic(scores$score <= -2)

# how many very psoitives and very negatives
numpos = sum(scores$very.pos)
numneg = sum(scores$very.neg)

# global score
global_score = round(100 * numpos / (numpos + numneg))

head(scores)
par(bty="1")
boxplot(score~company, data=scores, col=c("red", "grey"))

library("lattice")

histogram(data=scores, ~score[company, main = "Sentiment Analysis of 4 Companies", col=c("red", xlab="", sub"Sentiment Score")])