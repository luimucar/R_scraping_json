
install.packages("rjson")
library("rjson")

fileNumber <- 1

fileCSV1 <- paste("skills_",fileNumber,".csv", sep="")
fileLOG <- "logURL.csv"
dataSkills <- data.frame("title", "description", "skillType", "uri", stringsAsFactors = FALSE)
dataUrls <- data.frame("URLs", stringsAsFactors = FALSE)


callURL <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/skills&relation=hasTopConcept&language=en&full=true"

repeat{
    dataUrls <- rbind(dataUrls,list(callURL))

    jsonFile = paste("skills_",fileNumber,".json",sep="")
    download.file(callURL, jsonFile)
    result <- fromJSON(file = jsonFile)

    N <- eval(parse(text=paste("length(result$\"_embedded\"$hasTopConcept)")))

    #indexes from [1...20]
    for (i in 1:N) {
        f1 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[",i,"][[1]]$title")))
        f2 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[",i,"][[1]]$description$en$literal")))
        f3 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[",i,"][[1]]$\"_links\"$hasSkillType[1][[1]]$title")))
        f4 <- eval(parse(text=paste("result$\"_embedded\"$hasTopConcept[",i,"][[1]]$uri")))

        if(is.null(f1)) f1 = "NOT FOUND IN API"
        if(is.null(f2)) f2 = "NOT FOUND IN API"
        if(is.null(f3)) f3 = "NOT FOUND IN API"
        if(is.null(f4)) f4 = "NOT FOUND IN API"

        dataSkills <- rbind(dataSkills,list(f1,f2,f3,f4))

    }

    callURL <- eval(parse(text=paste("result$\"_links\"$\"next\"$href")))
    fileNumber <- fileNumber + 1
    #if(is.null(call)){
    if(fileNumber>1000){
        break
    }
}
write.table(dataUrls, file = fileLOG,row.names=FALSE, na="",col.names=FALSE, sep=";")
write.table(dataSkills, file = fileCSV1,row.names=FALSE, na="",col.names=FALSE, sep=";")

