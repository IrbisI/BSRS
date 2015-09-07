# Read table
D <- read.xls("Responses.xlsx", sheet = 1, header = FALSE, stringsAsFactors=FALSE)
colnames(D) <- surveyQuestions
# D <- read.delim(file='Responses.xlsx', header=FALSE, col.names=surveyQuestions, stringsAsFactors=FALSE)

# Remove useless rows
D <- D[-c(1:14),]
