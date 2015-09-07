# Get important libraries
library(tools)
library(ggplot2)     # Grammar of Graphics
library(colorspace)
library(gcookbook)
library(gdata)
library(corrgram)
library(stargazer)
library(rattle)
library(randomForest)
library(inTrees)
library(rpart.plot)
library(RColorBrewer)

#### Remove graphs and tables before running analysis
WD <- getwd()
unlink(file.path(WD, 'tables', '*'))
unlink(file.path(WD, 'graphs', '*'))

#### Prepare analysis ####
# Run data analysis step by step
source('SurveyQuestions.R')
source('QuestionGroups.R')
source('ReadData.R')
source('BasicClean.R')
source('SimpleStats.R')

# Define analysis parameters
binWidth <- 3 # Binwidth for histograms
randomSeed <- 208
studyLoc <- c('Estonia', 'Finland')

# Nationality text parse
source('nationalityStats.R')

# Load analysis functions
source('analysisFunctions.R')
source('graphFunctions.R')

#### Perform Analysis ####

# Distribution of basic traits (separate Fins/Ests by colour)
source('basicTraits.R')

# Socio-economic
source('socioEconomic.R')

# Future orientedness (School for children)
source('futureOrientedness.R')

# Nationality
source('nationality.R')

# Satisfaction/Happiness
source('satisfaction.R')

# Integration
source('integration.R')

##########################
# TO-DO...!
#########################
# @@@ Random forest for School Types?
# @@@ Do analysis with Estonian/Finn separation
# @@@ Immigrants vs Born (Age == TimeInCountry)
# @@@ Migrate PCA code to single function
# @@@ Move all PCA to covariance matrix [similar scales]

# < Textual >
# 'Equality'
# 'WayOfLife'
# 'Integration'
# 'Democracy'
# 'StateLanguage_Satisfaction'