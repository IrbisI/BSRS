# > Socio-Economic <
# Education_*
# Occupation_*
# Income_*

# Plot age versus income level
histMulti(D, "Age", "IncomeLevel",
          "IncomeLevel-Age.png")

# Plot age versus Occupation
histMulti(D, "Age", "Occupation",
          "Occ-Age.png")

# Plot age versus Education
histMulti(D, "Age", "Education", 
          "Edu-Age.png")

#### Random forests ####
# 'Agree_FutureHope' removed due to many NAs
#  maybe removed...

treeFactors <- c('IncomeLevel', 'Age', 'Gender', 'Education', 'Occupation')
# 'Agree_NotRecognised', 'Agree_SecondClassCitizen', 'Agree_NoInfluence')

Dloc <- subset(D, Country == 'Finland')
Dloc <- Dloc[, c('Language_Finnish', treeFactors)]
Dloc <- na.omit(Dloc)

# Decision tree
tr <- rpart(IncomeLevel ~ .,
              data=Dloc, method="class")
summary(tr)
fancyRpartPlot(tr)

# Random forest
set.seed(randomSeed)

fit <- randomForest(IncomeLevel ~ .,
                    data=Dloc, importance=TRUE, ntree=2000)
plot(fit)
varImpPlot(fit)


Dloc <- subset(D, Country == 'Estonia')
Dloc <- Dloc[, c('Language_Estonian', treeFactors)]
Dloc <- na.omit(Dloc)

# Decision tree
tr <- rpart(IncomeLevel ~ .,
            data=Dloc, method="class")
summary(tr)
fancyRpartPlot(tr)

# Random forest
set.seed(randomSeed)

fit <- randomForest(IncomeLevel ~ .,
                    data=Dloc, importance=TRUE, ntree=2000)
plot(fit)
fancyRpartPlot(fit)
varImpPlot(fit)
