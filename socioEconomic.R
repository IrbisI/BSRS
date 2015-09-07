# > Socio-Economic <
# Education_*
# Occupation_*
# Income*

linearModel(D, 'IncomeAssessmentScale', 'IncomePersonal', 'IncomeA-vs-IncomeP')

# Plot age versus [Level, Factor, Assessment]
histMulti(D, "Age", "IncomeLevel", "age-IncomeLevel.png")

histMulti(D, "Age", "IncomeFactor", "age-IncomeFactor.png")

histMulti(D, "Age", "IncomeAssessment", "age-IncomeAssessment.png")

# Plot time in country
histMulti(D, "TimeInCountry", "IncomeLevel", "TIC-IncomeLevel.png")

histMulti(D, "TimeInCountry", "IncomeFactor", "TIC-IncomeFactor.png")

histMulti(D, "TimeInCountry", "IncomeAssessment", "TIC-IncomeAssessment.png")

# Plot age versus Occupation
histMulti(D, "Age", "Occupation", "Age-Occupation.png")

# Plot age versus Education
histMulti(D, "Age", "Education", "Age-Education.png")

#### Random forests ####
# 'Agree_FutureHope' removed due to many NAs
#  maybe removed...

treeFactors <- c('Age', 'Gender', 'Education', 'Working', 'Studying', 'Benefits')

decisionTree(subset(D, Country == 'Finland'),
             'IncomeAssessmentScale', treeFactors, 'DT_incomeL_Finland.png', 'Income Level (Finland)',
             rpartMethod="anova", cleanNames=FALSE)

# Decision tree
decisionTree(subset(D, Country == 'Estonia'),
             'IncomeAssessmentScale', treeFactors, 'DT_incomeL_Estonia.png', 'Income Level (Estonia)',
              rpartMethod="anova", cleanNames=FALSE)