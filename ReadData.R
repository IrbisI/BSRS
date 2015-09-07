# Read table
D <- read.xls(file.path(WD, "docs", "Responses.xlsx"), sheet = 1, header = FALSE, stringsAsFactors=FALSE)
colnames(D) <- surveyQuestions

# Remove useless rows
D <- D[-c(1:14),]
