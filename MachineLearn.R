library(Amelia)
library(Hmisc)
library(randomForest)

set.seed(810)

get_mode <- function(x){
  names(sort(-table(x)))[1]
}

D_forest <- D
drops <- c(
  "count",
  "Time",
  "ImportanceState_Other",
  q_language,
  "Language_Other",
  "Language_Other_Name",
  "StateLanguage_Other",
  "StateLanguage_Satisfaction",
  "NativeLanguage",
  "NativeLanguage_Other",
  "Religion_Other",
  "Education_Other",
  "Occupation_Other",
  "Equality",
  "WayOfLife",
  "Integration",
  "Democracy",
  "Emigration",
  "Emigration_2",
  "ReasonForMoving",
  "ReasonForMoving_Other",
  "Nationality_Self",
  "Nationality_Mother",
  "Nationality_Father",
  "PlaceBirth",
  "TimeInCountry", # Banal
  "Age", # Banal
  "IncomePersonal" # Banal
  )

D_forest <- D_forest[ , !(names(D_forest) %in% drops)]

missmap(D_forest)

# Set median for numeric, mode for factors in missing values
for(col in names(D_forest)){
  if (class(D_forest[[col]]) %in% c('numeric', 'integer') ) {
    D_forest[col] <- impute(D_forest[col], fun=median)  
  } else if (class(D_forest[[col]]) == 'factor') {
    D_forest[col] <- impute(D_forest[col], fun=get_mode)
  } else if (class(D_forest[[col]]) == 'character'){
    D_forest <- D_forest[ , !(names(D_forest) == col)]
  }
}

# Cleaned data
missmap(D_forest)

fit <- randomForest(Country ~ . ,
                    data=D_forest, 
                    importance=TRUE, 
                    ntree=2000)
varImpPlot(fit)

