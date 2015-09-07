# > Happiness <
# Satisfaction_* [sat_Factors]
# Agree_* [agr_Factors]
# Importance_* [imp_Factors]
# EqualOpp_* [equ_Factors]

#### Agree ####
D_sub <- D[, agr_Factors]

# Correlation between overall satisfaction and subtypes
corrAll(D_sub, "Correlate Appraisal")

print("Dimensions before/after ignoring NAs")
print(dim(D_sub))
print(dim(na.omit(D_sub)))

# Pricipal Components Analysis
# entering raw data and extracting PCs 
# from the correlation matrix 
PCA(D_sub)


# Appraisal (decision tree) --> distinguish finns & estonians
decisionTree(D, 'Country', agr_Factors,
             'decTree__Country-Appraisal.png',
             "Distinguish country by Appraisal ratings")

#### Importance ####

D_sub <- D[, imp_Factors]

decisionTree(D, 'Country', imp_Factors,
             'decTree__Country-ImportanceState.png',
             "Distinguish country by Importance ratings")

#### Satisfaction ####

# Can we predict overall satisfaction from Satisfaction_*, Agree_*, and EqualOpp_*:

decisionTree(D, 'Satisfaction', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Satisfaction-Factors.png',
             "Satisfaction by Factors",
             rpartMethod="anova",
             cleanNames=FALSE)

decisionTree(D, 'Satisfaction', sat_Factors,
             'decTree__Satisfaction-satFactors.png',
             "Satisfaction by Satisfaction Factors",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Estonia"), 'Satisfaction',sat_Factors,
             'decTree__Satisfaction-satFactors_Est.png',
             "Satisfaction by Satisfaction Factors (Estonia)",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Finland"), 'Satisfaction', sat_Factors,
             'decTree__Satisfaction-satFactors_Fin.png',
             "Satisfaction by Satisfaction Factors (Finland)",
             rpartMethod="anova")

decisionTree(D, 'Satisfaction', agr_Factors,
             'decTree__Satisfaction-agrFactors.png',
             "Satisfaction by Personality",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Estonia"), 'Satisfaction', agr_Factors,
             'decTree__Satisfaction-agrFactors_Est.png',
             "Satisfaction by Personality (Estonia)",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Finland"), 'Satisfaction', agr_Factors,
             'decTree__Satisfaction-agrFactors_Fin.png',
             "Satisfaction by Personality (Finland)",
             rpartMethod="anova")

decisionTree(D, 'Satisfaction', equ_Factors,
             'decTree__Satisfaction-equFactors.png',
             "Satisfaction by Equality",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Estonia"), 'Satisfaction', equ_Factors,
             'decTree__Satisfaction-equFactors_Est.png',
             "Satisfaction by Equality (Estonia)",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Finland"), 'Satisfaction', equ_Factors,
             'decTree__Satisfaction-equFactors_Fin.png',
             "Satisfaction by Equality (Finland)",
             rpartMethod="anova")

decisionTree(subset(D, Country == "Finland"), 'Satisfaction', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Satisfaction-Factors__Fin.png',
             "Satisfaction by Factors (Finland)",
             rpartMethod="anova",
             cleanNames=FALSE)

decisionTree(subset(D, Country == "Estonia"), 'Satisfaction', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Satisfaction-Factors__Est.png',
             "Satisfaction by Factors (Estonia)",
             rpartMethod="anova",
             cleanNames=FALSE)

#### Other ####

decisionTree(D, 'Country', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Country-Factors.png',
             "Country by Factors",
             rpartMethod="class",
             cleanNames=FALSE)

#### Extra analysis ####

D_sub = D[ ,
          c('Age',
          'Gender',
          'TimeInCountry',
          'Satisfaction',
          sat_Factors,
          equ_Factors)]

# Correlation between overall satisfaction and subtypes
corrgram(D_sub,
         order=TRUE, lower.panel=panel.conf,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Correlate Satisfaction")

#####################################
# Factor Analysis

# Satisfaction
PCA(D_sub[, sat_Factors])

# Equality
PCA(D_sub[, equ_Factors])
