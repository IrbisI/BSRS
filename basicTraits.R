# Distribution of basic traits (separate Fins/Ests by colour)
# Age
# TimeInCountry
# Gender
# FamilyStatus
# Native_Language
# NativeLanguage_Other
# Nat_tScore

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

scatterPlotMulti(D, 'Age', 'NationalityScore', 'Country',
                 'age-vs-Nationality.png')

scatterPlotMulti(D, 'TimeInCountry', 'NationalityScore', 'Country',
                 'TIC-vs-Nationality.png')

scatterPlotMulti(D, 'Satisfaction', 'NationalityScore', 'Country',
                 'Satisfaction-vs-Nationality.png')

scatterPlotMulti(D, 'Age', 'TimeInCountry', 'Country',
                 'age-vs-TIC.png')

for (l in studyLoc) {
  Dloc <- subset(D, Country == l)
  
  fit <- lm(formula = Age ~ TimeInCountry, data = Dloc)
  print(summary(fit))
  
  latexTable <- latexTable(fit, 'age_TIC')
}

#### Histograms ####
# Plot age histogram versus country
histClear(D, 'Age', 'Country',
           'ageByCountry.png')

# Plot TimeInCountry versus country
histClear(D, 'TimeInCountry', 'Country',
          'TICbyCountry.png',
          'Time In Country')

# Age vs Native Language
histMulti(D, 'Age', 'NativeLanguage',
          'age-nativeLanguage.png')

# Plot age histogram versus gender
histMulti(D, 'Age', 'Gender',
          'age-gender.png')

# Plot age histogram versus FamilyStatus
histMulti(D, 'Age', 'FamilyStatus',
           'age-familyStatus.png')

# Age vs Native Language
histMulti(D, 'TimeInCountry', 'NativeLanguage',
          'TIC-nativeLanguage.png')

# Plot age histogram versus gender
histMulti(D, 'TimeInCountry', 'Gender',
           'TIC-gender.png')

histMulti(D, 'TimeInCountry', 'FamilyStatus',
           'TIC-familyStatus.png')