
# where the API DOC is"https://ec.europa.eu/esco/api/doc/esco_api_doc.html#payload-skill"

call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/occupations&relation=hasTopConcept&language=en&full=true"
download.file(call, "destfile.json")
result <- fromJSON(file = "destfile.json")

json_data_frame <- as.data.frame(result)
print(json_data_frame)


call <- "https://ec.europa.eu/esco/api/resource/related/?uri=http://data.europa.eu/esco/concept-scheme/skills&relation=hasTopConcept&language=en&full=true"
download.file(call, "skills.json")



call <- "https://ec.europa.eu/esco/api/resource/taxonomy?uri=http://data.europa.eu/esco/concept-scheme/isco&language=en"

download.file(call, "isco.json")



call <- "https://ec.europa.eu/esco/api/resource/concept?uri=http://data.europa.eu/esco/skill-type/knowledge&language=en"

download.file(call, "skillset.json")


call <- "https://ec.europa.eu/esco/api/resource/related?uri=http://data.europa.eu/esco/concept-scheme/skills&relation=hasTopConcept&limit=20&offset=1&language=en&full=true"



result$total
result$offset
result$"_embedded"$hasTopConcept[0]$className

result$"_embedded"$hasTopConcept[1][[1]]$className

result$"_embedded"$hasTopConcept[1][[1]]$title
result$"_embedded"$hasTopConcept[2][[1]]$title
result$"_embedded"$hasTopConcept[2][[1]]$title
result$"_embedded"$hasTopConcept[2][[1]]$title
