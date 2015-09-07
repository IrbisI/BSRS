# Convert to integers
for (q in toInteger) {
  D[[q]] <- as.integer(D[[q]])
}

# Invert data where scales in wrong direction
for (q in invertValues) {
  D[[q]] <- 5 - D[[q]]
}

# Clean 5s
for (q in clean5s) {
  D[[q]][D[[q]]==5] <- NA
}

# Clean True/False
for (q in cleanTrue) {
  D[[q]] <- as.logical(D[[q]])
  D[[q]][is.na(D[[q]])] <- FALSE
}

for (q in toFactor) {
  D[[q]] <- as.factor(D[[q]])
}

# Reason For Moving 4s to NAs
D[['ReasonForMoving']][D[['ReasonForMoving']]==4] <- NA

# Satisfaction 11s to NAs
D[['Satisfaction']][D[['Satisfaction']]==11] <- NA

#### Index from Nat_factors (1-4 scale) ---> 1-10 scale
minMax_Q = c(1, 4)
nQs = length(nat_Factors)
D$NationalityScore <- (rowSums(D[, nat_Factors], na.rm=T) - nQs * minMax_Q[1]) /
  ((minMax_Q[2] - minMax_Q[1]) * nQs) * 10
D$NationalityScore[D$NationalityScore < 0] <- NA

#### Languages ####
# All languages
langLevels <- c("Not at all", "Understand, don't speak", "Understand & speak a little", "Understand, speak & write", "Fluent")
levels(D$LanguageFinnish) <- langLevels
levels(D$LanguageEstonian) <- langLevels
levels(D$LanguageSwedish) <- langLevels
levels(D$LanguageEnglish) <- langLevels
levels(D$LanguageGerman) <- langLevels

# State language skills (already inverted above)
stalangLevels <- c("Not at all", "Little", "Average", "Good")
levels(D$StateLanguageListen) <- stalangLevels
levels(D$StateLanguageRead) <- stalangLevels
levels(D$StateLanguageSpeak) <- stalangLevels
levels(D$StateLanguageWrite) <- stalangLevels

#### Income ####
# Income level, invert, as "1" is high in spreadsheet, but should be "low"
D$IncomeLevel <- as.factor(4 - D$IncomeLevel)
levels(D$IncomeLevel) <- c("Low", "Medium", "High")

# Income assessment, invet values, as "1" is good, "4" is bad
D$IncomeAssessment <- as.factor(5 - D$IncomeAssessment)
levels(D$IncomeAssessment) <- c("Very difficult", "Difficult", "Managing", "Living well")
D$IncomeAssessmentScale <- as.numeric(D$IncomeAssessment)

# Income future (6s to NAs()
D[D$IncomeFuture==6 & !is.na(D$IncomeFuture), 'IncomeFuture'] <- NA
D$IncomeFuture <- as.factor(6 - D$IncomeFuture)
levels(D$IncomeFuture) <- c("Much worse", "Somewhat worse", "About the same", "Somewhat better", "Much better")

# Income personal
# Is not a factor, it should be replaced by actual numbers depending on country
D$IncomeFactor <- D$IncomePersonal
D[D$Country=="Finland", "IncomeFactor"] <- D[D$Country=="Finland", "IncomeFactor"] + 1
D$IncomeFactor <- as.factor(D$IncomeFactor)
levels(D$IncomeFactor) <- c("€200-500", "€500-1000", "€1000-1500", "€1500-2000", "€2000-2500", "€2500-3000", "€3000+")

y <- list(350, 750, 1250, 1750, 2250) # Estonian incomes
D[D$Country=="Estonia" & !is.na(D$IncomePersonal), "IncomePersonal"] <- unlist(y[subset(D, Country=="Estonia")$IncomePersonal])
y <- list(750, 1250, 1750, 2250, 2750, 3250) # Finnish incomes
D[D$Country=="Finland" & !is.na(D$IncomePersonal), "IncomePersonal"] <- unlist(y[subset(D, Country=="Finland")$IncomePersonal])

#### Occupation ####

levels(D$Occupation) <- c("Employee", "Employer", "Entrepreneur", "Pensioner (working)", "Student (working)",
                          "Pensioner (unemployed)", "Student (unemployed)", "Unemployed (no benefits)",
                          "Unemployed (benefits)", "Housewife", "Other")

D$Studying <- FALSE
D[as.numeric(D$Occupation) %in% c(5, 7), 'Studying'] <- TRUE

D$Working <- FALSE
D[as.numeric(D$Occupation) %in% c(1, 2, 3, 4, 5), 'Working'] <- TRUE

D$Benefits <- FALSE
D[as.numeric(D$Occupation) %in% c(9), 'Benefits'] <- TRUE

#### Other ####
levels(D$Gender) <- c("Male", "Female")

levels(D$FamilyStatus) <- c("Single", "Married", "Cohabiting", "Dating", "Divorced", "Widowed")

D[["ReasonForMoving"]][is.na(D[['ReasonForMoving']]) & D[['ReasonForMoving_Other']]!=''] = 4
D$ReasonForMoving <- as.factor(D$ReasonForMoving)
levels(D$ReasonForMoving) <- c("Work", "Study", "Family", "Other")

levels(D$NativeLanguage) <- c("Russian", "State", "Other", "Undefined")
D[is.na(D$NativeLanguage), 'NativeLanguage'] <- 'Undefined'

levels(D$Religion) <- c("Orthodox", "Catholic", "Protestant", "Lutheran", "Islam", "Buddhism/oriental",
                        "Hinduism", "Atheism", "Other")

levels(D$Education) <- c("Basic", "Vocational", "Polytechnic", "School", "Degree", "Other")