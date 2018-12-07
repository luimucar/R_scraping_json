install.packages(c("httr", "jsonlite", "lubridate"))

library(httr)
library(jsonlite)
library(lubridate)

options(stringsAsFactors = FALSE)


url  <- "https://ec.europa.eu/esco/api"
path <- "resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"

raw.result <- GET(url = url, path = path)
raw.result
#"https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"


call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"
get <- GET(call)

#"https://api.intrinio.com/prices?ticker=AAPL"
base <- "https://api.intrinio.com/"
endpoint <- "prices"
stock <- "AAPL" 

call1 <- paste(base,endpoint,"?","ticker","=", stock, sep="")

get_prices <- GET(call1)

get_prices_text <- content(get_prices, "text")


library(data.table)
ad <- fread("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv")
head(ad)



call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"

download.file(call, "destfile.txt")


call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"

download.file(call, "destfile.txt")
