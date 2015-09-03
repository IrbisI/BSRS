# Convert to integers
for (q in toInteger) {
  D[[q]] = as.integer(D[[q]])
}

# Reason For Moving 4s to NAs
D[['ReasonForMoving']][D[['ReasonForMoving']]==4] = NA

# Income Future 6s to NAs
D[['Income_Future']][D[['Income_Future']]==6] = NA

# Satisfaction 11s to NAs
D[['Satisfaction']][D[['Satisfaction']]==11] = NA

# Clean 5s
for (q in clean5s) {
  D[[q]][D[[q]]==5] = NA
}

# Clean True/False
for (q in cleanTrue) {
  D[[q]] = as.logical(D[[q]])
  D[[q]][is.na(D[[q]])] = FALSE
}

# Invert data where scales in wrong direction
for (q in invertValues) {
  D[[q]] = 5 - D[[q]]
}

#### Index from Nat_factors (1-4 scale) ---> 1-10 scale
minMax_Q = c(1, 4)
nQs = length(nat_Factors)
D$NationalityScore <- (rowSums(D[, nat_Factors], na.rm=T) - nQs * minMax_Q[1]) /
  ((minMax_Q[2] - minMax_Q[1]) * nQs) * 10
D$NationalityScore[D$NationalityScore < 0] <- NA

# Convert to factor
D$Country <- as.factor(D$Country)

D$Gender <- as.factor(D$Gender)
levels(D$Gender) <- c("Male", "Female")

D$IncomeLevel <- as.factor(D$IncomeLevel)

D$FamilyStatus <- as.factor(D$FamilyStatus)
levels(D$FamilyStatus) <- c("Single", "Married", "Cohabiting", "Dating", "Divorced", "Widowed")

D[["ReasonForMoving"]][is.na(D[['ReasonForMoving']]) & D[['ReasonForMoving_Other']]!=''] = 4
D$ReasonForMoving <- as.factor(D$ReasonForMoving)
levels(D$ReasonForMoving) <- c("Work", "Study", "Family", "Other")

D$NativeLanguage <- as.factor(D$NativeLanguage)
levels(D$NativeLanguage) <- c("Russian", "State", "Other", "Undefined")
D[is.na(D$NativeLanguage), 'NativeLanguage'] = 'Undefined'

D$Religion <- as.factor(D$Religion)
levels(D$Religion) <- c("Orthodox", "Catholic", "Protestant", "Lutheran", "Islam", "Buddhism/oriental",
                        "Hinduism", "Atheism", "Other")

D$Education <- as.factor(D$Education)
levels(D$Education) <- c("Basic", "Vocational", "Polytechnic", "School", "Degree", "Other")

D$Occupation <- as.factor(D$Occupation)
levels(D$Occupation) <- c("Employee", "Employer", "Entrepreneur", "Pensioner (working)", "Student (working)",
                          "Pensioner (unemployed)", "Student (unemployed)", "Unemployed (no benefits)",
                          "Unemployed (benefits)", "Housewife", "Other")