//# Distribution of basic traits (separate Fins/Ests by colour)
# Age
# TimeInCountry
# Gender
# FamilyStatus
# Religion
# ReasonForMoving
# Native_Language
# NativeLanguage_Other
# NationalityScore
# IncomeAssessment
# IncomePersonal

#### Native Language statistics ####
# Native language <most speak Russian>
for (l in studyLoc) {
  print(paste('<<<', l, '>>>'))
  
  # Take subset of D where country is either 'Estonia' or 'Finland'
  Dloc <- subset(D, Country == l)
  
  print(table(Dloc$NativeLanguage))
  print(table(Dloc$NativeLanguage_Other))
  
  # Where 'NativeLanguage' is 'other', show 'NativeLanguage_Other'
  print(Dloc[Dloc$NativeLanguage == 'other', c('count', 'NativeLanguage_Other')])
  
  # Find main languages where 'NativeLanguage_Other' is not empty
  otherLanguages <- unique(Dloc$NativeLanguage_Other)
  otherLanguages <- otherLanguages[nchar(otherLanguages) > 0]
  for (o in otherLanguages) {
    print(Dloc[Dloc$NativeLanguage_Other == o, c('count', 'NativeLanguage', 'NativeLanguage_Other')])
  }
}

#### Scatterplots ####

# >>> Dependent variables <<<
# NationalityScore
# Satisfaction

# >>> Independent variables <<<
# TimeInCountry
# Age
# StateLanguage_Satisfaction
# IncomeLevel
# IncomeAssessment


scatterPlotMulti(dataFrame = D,
                 xCol      = 'TimeInCountry',
                 yCol      = 'Satisfaction',
                 fillCol   = 'Country',
                 fileName  = 'TIC-vs-Satisfaction.png',
                 graphTitle = 'Interrelation between Time of Stay in Country and Well-being')

### Какой здесь p-value?



scatterPlotMulti(D, 
                 xCol = 'TimeInCountry', 
                 yCol = 'NationalityScore', 
                 fillCol = 'Country',
                 fileName = 'TIC-vs-Nationality.png',
                 graphTitle = 'Interrelation between Time of Stay in Country and Nationality Score')

scatterPlotMulti(D,
                 xCol = 'Age',
                 yCol = 'NationalityScore',
                 fillCol = 'Country',
                 fileName = 'age-vs-Nationality.png',
                 graphTitle = 'Interrelation between Age and Nationality Score')

scatterPlotMulti(D, 'Age', 'TimeInCountry', 'Country',
                 'age-vs-TIC.png')

scatterPlotMulti(D, 'Satisfaction', 'NationalityScore', 'Country',
                 'Satisfaction-vs-Nationality.png')

for (l in studyLoc) {
  Dloc <- subset(D, Country == l)
  
  # Age vs. TimeInCountry
  fit <- lm(formula = 'Age ~ TimeInCountry', data = Dloc)
  print(summary(fit))
  fileName <- paste('age_TIC', l, sep='_')
  lt <- latexTable(fit,
                   fileName,
                   myTitle = "Interrelation between Age and Time in Country")
  
  # Age vs. NationalityScore
  fit <- lm(formula = 'Age ~ NationalityScore', data = Dloc)
  print(summary(fit))
  fileName <- paste('age_NationalityScore', l, sep='_')
  lt <- latexTable(fit,
                   fileName,
                   myTitle = "Interrelation between Age and Nationality Score")

}

#### Histograms ####
# Plot age histogram versus country
histClear(D, 'Age', 'Country', 'ageByCountry.png')

# Plot TimeInCountry versus country
histClear(D, 'TimeInCountry', 'Country', 'TICbyCountry.png',
          'Time In Country')

# Age vs [Native Language, Gender, FamilyStatus, Religion]
histMulti(D, 'Age', 'NativeLanguage', 'age-nativeLanguage.png')

histMulti(D, 'Age', 'Gender', 'age-gender.png')

histMulti(D, 'Age', 'FamilyStatus', 'age-familyStatus.png')

histMulti(D, 'Age', 'Religion', 'age-religion.png')

histMulti(D, 'Age', 'ReasonForMoving', 'age-moving.png')

# Time-In-Country vs [Native Language, Gender, FamilyStatus, Religion]
histMulti(D, 'TimeInCountry', 'NativeLanguage', 'TIC-nativeLanguage.png')

histMulti(D, 'TimeInCountry', 'Gender', 'TIC-gender.png')

histMulti(D, 'TimeInCountry', 'FamilyStatus', 'TIC-familyStatus.png')

histMulti(D, 'TimeInCountry', 'Religion', 'TIC-religion.png')

histMulti(D, 'TimeInCountry', 'ReasonForMoving', 'TIC-moving.png')
