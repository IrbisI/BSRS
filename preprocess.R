# Get important libraries
library(ggplot2)     # Grammar of Graphics
library(gcookbook)

# Load useful functions
source('SurveyQuestions.R')

# Get all the labels for the columns
Q <- SurveyQuestions()

# Read table
D <- read.delim(file='Responses_raw.txt', header=FALSE, col.names=Q, stringsAsFactors=FALSE)

### DATA CLEAN ###

D[['Satisfaction']][D[['Satisfaction']]==11] = NA

clean5s <- c('Satisfaction_Work',
             'Satisfaction_Safety',
             'Satisfaction_Home',
             'Satisfaction_Family',
             'Satisfaction_Material',
             'Satisfaction_Friends',
             'Agree_FutureHope',
             'Agree_NotRecognised',
             'Agree_SecondClassCitizen',
             'Agree_DefendInterests',
             'Agree_LookFromAbove',
             'Agree_NoInfluence',
             'EqualOpp_Work',
             'EqualOpp_StateWork',
             'EqualOpp_HeadWork',
             'EqualOpp_Business',
             'EqualOpp_Politics',
             'EqualOpp_Education',
             'EqualOpp_StartUp',
             'EqualOpp_Pay',
             'EqualOpp_Benefit')

for (c in clean5s) {
  D[[c]][D[[c]]==5] = NA
}

cleanTrue = c('ChildSchool_State',
'ChildSchool_Immersion',
'ChildSchool_Mixed',
'ChildSchool_Bilingual',
'ChildSchool_Russian',
'ChildSchool_Foreign',
'ChildSchool_None',
'ChildSchool_NotSure')

for (c in cleanTrue) {
  D[[c]] = as.logical(D[[c]])
  D[[c]][is.na(D[[c]])] = FALSE
}

###

# Type of data in each column
D_class <- sapply(D, class)

# Get only quantitative columns
D_numeric <- sapply(D, is.numeric)

Dq <- D[, D_numeric]

Dq_sum <- data.frame(names(Dq),
                     sapply(Dq, mean, na.rm = TRUE),
                     sapply(Dq, sd, na.rm = TRUE));
names(Dq_sum) <- c('Question', 'mean', 'std')
row.names(Dq_sum) <- NULL

# Sub-summaries

D_nat <- Dq_sum[grepl('Nat_', Dq_sum$Question), ]
D_lang <- Dq_sum[grepl('Language_', Dq_sum$Question), ] # Except StateLanguage
D_sLang <- Dq_sum[grepl('StateLanguage_', Dq_sum$Question), ]
D_cSchool <- Dq_sum[grepl('ChildSchool_', Dq_sum$Question), ] # Incorrect statistic!
D_inc <- Dq_sum[grepl('Income_', Dq_sum$Question), ]
D_sat <- Dq_sum[grepl('Satisfaction_', Dq_sum$Question), ]
D_agree <- Dq_sum[grepl('Agree_', Dq_sum$Question), ]
D_import <- Dq_sum[grepl('ImportanceState_', Dq_sum$Question), ]
D_eqOpp <- Dq_sum[grepl('EqualOpp_', Dq_sum$Question), ]

### BASIC GRAPHICS

# Nationality
ggplot(D_nat, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Language
ggplot(D_lang, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# State Language
ggplot(D_sLang, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Income
ggplot(D_inc, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Satisfaction
ggplot(D_sat, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Agree
ggplot(D_agree, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Importance of state
ggplot(D_import, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Equal opportunities
ggplot(D_eqOpp, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()
