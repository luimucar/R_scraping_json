
install.packages("rjson")
library("rjson")


call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/skills&relation=hasTopConcept&language=en&full=true"

download.file(call, "skills2.json")
result <- fromJSON(file = "skills2.json")

N <- eval(parse(text=paste("length(result$\"_embedded\"$hasTopConcept)")))

#indexes from [1...20]
for (i in 1: N) {
    f1 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[2][[",i,"]]$title")))
    f2 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[2][[",i,"]]$description$en$literal")))
    f3 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[2][[",i,"]]$\"_links\"$hasSkillType[1][[1]]$title")))
    f4 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[2][[",i,"]]$uri")))

    if(is.null(f1)) f1 = "NOT FOUND IN API"
    if(is.null(f2)) f2 = "NOT FOUND IN API"
    if(is.null(f3)) f3 = "NOT FOUND IN API"
    if(is.null(f4)) f4 = "NOT FOUND IN API"

}



x <- data.frame("title", "description", "skillType", "uri", stringsAsFactors = FALSE)
x <- rbind(x,list(f1,f2,f3,f4))
write.table(x, file = "MyData.csv",row.names=FALSE, na="",col.names=FALSE, sep=";")



smokerData <- read.csv(file='smoker.csv',sep=',',header=T)
summary(smokerData)
