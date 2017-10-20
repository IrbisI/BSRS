# > Happiness <
# Satisfaction_* [sat_Factors]
# Agree_* [agr_Factors]
# Importance_* [imp_Factors]
# EqualOpp_* [equ_Factors]

#### Agree ####
# Appraisal (decision tree) --> distinguish finns & estonians
decisionTree(D, 'Country', agr_Factors,
             'decTree__Country-Appraisal.png',
             "Distinguish country by Appraisal ratings")

#### Importance ####
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
             'decTree__Satisfaction-_Fin.png',
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
             'decTree__Satisfaction-satFactors__Est.png',
             "Satisfaction by Factors (Estonia)",
             rpartMethod="anova",
             cleanNames=FALSE)

####Nationality by Satisfaction####

#Can we predict Nationality from Satisfaction_*, (Agree_*, and EqualOpp_*#

decisionTree(dataFrame     = D,
             intFactor     = 'NationalityScore',
             choiceFactors = c(sat_Factors),
             fileName      = 'decTree__NationalityScore-Factors.png',
             graphTitle    = "Ethnic Identity Score by Satisfaction",
             rpartMethod   = "anova",
             cleanNames    = FALSE)


decisionTree(dataFrame     = D,
             intFactor     = 'NationalityScore',
             choiceFactors = c(agr_Factors),
             fileName      = 'decTree__NationalityScore-Agree.png',
             graphTitle    = "Nationality by Satisfaction 2",
             rpartMethod   = "anova",
             cleanNames    = FALSE)



decisionTree(dataFrame     = D,
             intFactor     = 'NationalityScore',
             choiceFactors = c(equ_Factors),
             fileName      = 'decTree__NationalityScore-Equality.png',
             graphTitle    = "Nationality by Satisfaction 3",
             rpartMethod   = "anova",
             cleanNames    = FALSE)





####Overall Satisfaction by detailed questions ####

decisionTree(dataFrame     = D,
             intFactor     = 'NationalityScore',
             choiceFactors = c(equ_Factors),
             fileName      = 'decTree__NationalityScore-Equality.png',
             graphTitle    = "Nationality by Satisfaction 3",
             rpartMethod   = "anova",
             cleanNames    = FALSE)



#### Other ####

decisionTree(D, 'Country', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Country-Factors.png',
             "Country by Factors",
             rpartMethod="class",
             cleanNames=FALSE)

#### Extra analysis ####

corrAll(D[ ,
          c('Age',
          'Gender',
          'TimeInCountry',
          'Satisfaction',
          sat_Factors,
          equ_Factors)], "Correlate various",
        'corrVarious.png')

#####################################
# Factor Analysis

# Correlation between overall satisfaction and subtypes
corrAll(D[, sat_Factors], "Correlate Satisfaction",
        "corr_Satisfaction.png")

corrAll(D[, agr_Factors], "Correlate Appraisal",
        "corr_Appraisal.png")

corrAll(D[, imp_Factors], 'Correlate Importance',
        "corr_Importance.png")

corrAll(D[, equ_Factors], 'Correlate Equality',
        "corr_Equality.png")

# Satisfaction
PCA(D[, sat_Factors], 'PCA_satFactors.png')

# Satisfaction
PCA(D[, agr_Factors], 'PCA_agrFactors.png')

# Importance
PCA(D[, imp_Factors], 'PCA_impFactors.png')

# Equality
PCA(D[, equ_Factors], 'PCA_equFactors.png')
