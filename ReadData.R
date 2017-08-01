# Read table
D <- read.xls(file.path(WD, "docs", "Responses.full.xlsx"),
              encoding="UTF-8",
              perl = 'C:\\Perl64\\bin\\perl.exe',
              sheet = 1, header = FALSE, stringsAsFactors=FALSE)
colnames(D) <- surveyQuestions

# Remove useless rows
D <- D[-c(1:14),]
# Remove last useless column
D <- D[, -c(ncol(D))]
