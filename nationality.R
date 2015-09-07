# > Nationality (Russian-ness) <
# Nationality_* [nly_Factors]
# Nat_*         [nat_Factors]
# PlaceBirth

#### Correlation & PCA ####

# Correlogram of Nationality appraisal
corrAll(D[ , nat_Factors], "Correlate Nationality appraisal")

# Principal Component Analysis of Nat_* factors
PCA(D[ , nat_Factors])

#### Decision Trees (nat factors as independent) ####
# Is Satisfaction affected by Russian-ness?
decisionTree(D, 'Satisfaction', nat_Factors,
             'decTree__Satisfaction-Nat_Factors.png',
             "Satisfaction by Nationality factors",
             rpartMethod="anova")

decisionTree(subset(D, Country == 'Estonia'), 'Satisfaction', nat_Factors,
             'decTree__Satisfaction-Nat_Factors__Est.png',
             "Satisfaction by Nationality factors (Estonia)",
             rpartMethod="anova")

decisionTree(subset(D, Country == 'Finland'), 'Satisfaction', nat_Factors,
             'decTree__Satisfaction-Nat_Factors__Fin.png',
             "Satisfaction by Nationality factors (Finland)",
             rpartMethod="anova")

# Is expected Future Income affected by Russian-ness?
decisionTree(D, 'IncomeFuture', nat_Factors,
             'decTree__IncomeFuture-Nat_Factors.png',
             "Future Income by Nationality factors",
             rpartMethod="anova")

decisionTree(subset(D, Country == 'Estonia'), 'IncomeFuture', nat_Factors,
             'decTree__IncomeFuture-Nat_Factors__Est.png',
             "Future Income by Nationality factors (Estonia)",
             rpartMethod="anova")

decisionTree(subset(D, Country == 'Finland'), 'IncomeFuture', nat_Factors,
             'decTree__IncomeFuture-Nat_Factors__Fin.png',
             "Future Income by Nationality factors (Finland)",
             rpartMethod="anova")

#### Decision Trees (nat score as dependent) ####

decisionTree(D, 'NationalityScore', c(sat_Factors, agr_Factors, equ_Factors),
             'decTree__Nationality-Factors.png',
             "Nationality by Factors",
             rpartMethod="anova",
            cleanNames=FALSE)

#### Linear models ####

# How is Nationality Score affected by...?
linearModel(D, 'NationalityScore',
              c('Satisfaction', 'Age', 'TimeInCountry'),
              'natScore-vs-MainFactors')

linearModel(subset(D, Country=="Estonia"), 'NationalityScore',
            c('Satisfaction', 'Age', 'TimeInCountry'),
            'natScore-vs-MainFactors__Estonia')

linearModel(subset(D, Country=="Finland"), 'NationalityScore',
            c('Satisfaction', 'Age', 'TimeInCountry'),
            'natScore-vs-MainFactors__Finland')

linearModel(D, 'NationalityScore',
            sta_Factors,
            'natScore-vs-StateLangFactors')

linearModel(D, 'NationalityScore',
            sat_Factors,
            'natScore-vs-SatisfactionFactors')

linearModel(D, 'NationalityScore',
            agr_Factors,
            'natScore-vs-Appraisal')

linearModel(D, 'NationalityScore',
            equ_Factors,
            'natScore-vs-EqualOpp')

linearModel(D, 'NationalityScore',
            c('IncomeLevel', 'IncomeFuture', 'IncomePersonal', 'IncomeAssessment'),
            'natScore-vs-Income')
