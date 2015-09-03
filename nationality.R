# > Nationality (Russian-ness) <
# Nationality_*
# Nat_*
# PlaceBirth

nat_Factors = c('Nat_TimeSpent',
                'Nat_SocialGroups',
                'Nat_Feeling',
                'Nat_Influence',
                'Nat_Happiness',
                'Nat_Belonging',
                'Nat_Importance',
                'Nat_Speaking',
                'Nat_Pride',
                'Nat_CulturalActivities',
                'Nat_Attachment',
                'Nat_Liking')

nly_Factors = c('Nationality_Self',
                'Nationality_Father',
                'Nationality_Mother')

#### Correlation & PCA ####
D_sub = D[ ,
          c('PlaceBirth',
          nly_Factors,
          nat_Factors)]

# Correlogram of Nationality appraisal
corrAll(D[ , nat_Factors], "Correlate Nationality appraisal")

# Principal Component Analysis of Nat_* factors
PCA(D[ , nat_Factors])

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
