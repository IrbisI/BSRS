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

# Convert to factor
D$Country <- as.factor(D$Country)

D$Gender <- as.factor(D$Gender)
levels(D$Gender) <- c("male", "female")

D$FamilyStatus <- as.factor(D$FamilyStatus)
levels(D$FamilyStatus) <- c("single", "married", "cohabiting", "dating", "divorced", "widowed")

D[["ReasonForMoving"]][is.na(D[['ReasonForMoving']]) & D[['ReasonForMoving_Other']]!=''] = 4
D$ReasonForMoving <- as.factor(D$ReasonForMoving)
levels(D$ReasonForMoving) <- c("work", "study", "family", "other")

D$NativeLanguage <- as.factor(D$NativeLanguage)
levels(D$NativeLanguage) <- c("russian", "state", "other")

D$Religion <- as.factor(D$Religion)
levels(D$Religion) <- c("orthodox", "catholic", "protestant", "lutheran", "islam", "buddhism/oriental",
                        "hinduism", "atheism", "other")

D$Education <- as.factor(D$Education)
levels(D$Education) <- c("basic", "vocational", "polytechnic", "school", "degree", "other")

D$Occupation <- as.factor(D$Occupation)
levels(D$Occupation) <- c("employee", "employer", "entrepreneur", "pensioner (working)", "student (working)",
                          "pensioner (unemployed)", "student (unemployed)", "unemployed (no benefits)",
                          "unemployed (benefits)", "housewife", "other")