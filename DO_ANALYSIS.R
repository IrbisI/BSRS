rm(list = ls())
# Get important libraries
library(tools)
library(car)
library(ggplot2)     # Grammar of Graphics
library(ggbiplot)
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

installXLSXsupport(perl='C:\\Perl64\\bin\\perl.exe', verbose=TRUE)

#### Remove graphs and tables before running analysis
setwd('C:/Users/Admin/Documents/GitHub/BSRS/')
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

### Analysis prepared, statistics follow
### Sasha recommends: GO LINE BY LINE INSIDE EACH OF THESE FILES!

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

# Step models to determine what affects nationality
intFactor = 'NationalityScore'
source('forwardBackModel.R')

source('Extra_Analysis.R')

##########################
# TO-DO...!
#########################
# Collate .tex files into single Appendix
# Remove as.numeric from .tex files & humanise strings within

# < Textual >
# 'Equality'
# 'WayOfLife'
# 'Integration'
# 'Democracy'
# 'StateLanguage_Satisfaction'
