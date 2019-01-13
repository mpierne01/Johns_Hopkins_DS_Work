#### R Stats Text mining Strings

# Exercise Strings

our string <-c("Tom found 74 apples", "Is this a question?","How many $ and $ does it cost?")

ourstring

# 1. put the string to a complete lowercase
# 2. remove the punctuation
# 3. remove the spaces
# 4. remove the $ sign
# 5. use str_extract_all from stringer to see which elements "is" 

ourstring = tolower(ourstring); ourstring 

ourstring =gsub('[[:punct:]]", "", ourstring); ourstring 

ourstring = gsub("\\s", "", ourstring); ourstring

ourstring = gsub("$", "", ourstring); ourstring

str_extract_all(ourstring, "is"