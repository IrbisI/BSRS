library(car)
library(ggplot2)
library(reshape2)
source("graphFunctions.R")

manova_plot <- function(data, col_names, prefix, graphTitle=NULL){
  if (is.null(graphTitle)) {
    graphTitle <- paste(gsub("_", "", prefix), "by Country")
  }
  fit <- manova(as.matrix(D[, col_names]) ~ Country, data=D)
  print(summary(fit))
  
  for (col in col_names){
    print(col)
    fit <-t.test(D[D['Country']=='Estonia', col], D[D['Country']=='Finland', col]) 
    #print(fit)
    if (fit$p.value < (0.05 / length(col_names))){
      cat("\t*** Significant! *", "(p-value: ", fit$p.value, "; t-value: ", fit$statistic, "; df: ", fit$parameter, ")", "\n")
    }
    cat("\n")
  }
  
  D_subset <- D[, c(col_names, 'Country')]
  names(D_subset) <- sub(prefix, "", names(D_subset))
  D_subset_m <- melt(D_subset, id.vars = 'Country')
  
  p <- barMulti(D_subset_m, 'variable', 'value', fillCol='Country',
                graphTitle=graphTitle,
                fileName=paste(prefix, "_Country__MANOVA.png", sep=""))
}
 
# Descriptive statistics of Nationality score by country (split by affirmation & ID)
summary(D$NationalityScore_Affir[D$Country == 'Finland'])
summary(D$NationalityScore_Affir[D$Country == 'Estonia'])

summary(D$NationalityScore_ID[D$Country == 'Finland'])
summary(D$NationalityScore_ID[D$Country == 'Estonia'])

model <- lm(NationalityScore ~ Country, data=D)
Anova(model, type='II')

# ANCOVA (Country & TimeInCountry)
model <- lm(NationalityScore ~ TimeInCountry * Country, data=D)
Anova(model, type='II')


model <- lm(NationalityScore_Affir ~ Country, data=D)
Anova(model, type='II')

model <- lm(NationalityScore_ID ~ Country, data=D)
Anova(model, type='II')


#### Correlation_Satisfaction&Age
cor.test(D$Satisfaction, D$Age)

#### Correlation Satisfaction & NationalityScore
cor.test(D$Satisfaction, D$NationalityScore)

# Effect of gender on satisfaction
model <- lm(Satisfaction ~ Gender * Country, data=D)
Anova(model, type='II')

# Effect of family status on satisfaction (IGNORE: classes not balanced)
model <- lm(Satisfaction ~ FamilyStatus * Country, data=D)
Anova(model, type='II')

# Effect of religion on satisfaction (IGNORE: classes not balanced)
model <- lm(Satisfaction ~ Religion * Country, data=D)
Anova(model, type='II')

# Effect of Education on satisfaction (IGNORE: classes not balanced)
model <- lm(Satisfaction ~ Education * Country, data=D)
Anova(model, type='II')

# Effect of Income Level (self-assessed) on satisfaction
model <- lm(Satisfaction ~ IncomeLevel * Country, data=D[D["IncomeLevel"] != 'High', ])
Anova(model, type='II')

# Graph 
scatterPlotMulti(D, 'Satisfaction', 'IncomePersonal', "Country",
                 "Satisfaction vs. Income", fileName="Satisfaction_Income.png")

# ANCOVA [Analysis of covariance] (Country & IncomePersonal)
model <- lm(Satisfaction ~ Country * IncomePersonal, data=D)
Anova(model, type='II')

# ANCOVA (Country & TimeInCountry)
model <- lm(Satisfaction ~ TimeInCountry * Country, data=D)
Anova(model, type='II')

# ANCOVA (Age & NationalityScore) & correlation
model <- lm(NationalityScore ~ Age * Country, data=D)
Anova(model, type='II')
cor.test(D[ , 'NationalityScore'], D[ , 'Age'])

# Effect of Occupation on satisfaction (IGNORE: classes not balanced and different across countries)
model <- lm(Satisfaction ~ Occupation * Country, data=D)
Anova(model, type='II')


# ANCOVA on effect of Satisfaction factors on overall Satisfaction
model <- lm(Satisfaction ~ 
             Satisfaction_Work + Satisfaction_Safety + Satisfaction_Home +
             Satisfaction_Family + Satisfaction_Material + Satisfaction_Friends +
             Country,
           data=D)
Anova(model, type='II')

# ANCOVA on effect of Agree factors on overall Satisfaction
model <- lm(Satisfaction ~
              Agree_FutureHope + Agree_NotRecognised + Agree_SecondClassCitizen +
              Agree_DefendInterests + Agree_LookFromAbove + Agree_NoInfluence +
              Country,
            data=D)
Anova(model, type='II')

# Nationality factors effect on Satisfaction
model <- lm(Satisfaction ~
            Nat_TimeSpent + Nat_SocialGroups + Nat_Feeling + 
            Nat_Influence + Nat_Happiness + Nat_Belonging + 
            Nat_Importance + Nat_Speaking + Nat_Pride +
            Nat_CulturalActivities + Nat_Attachment + Nat_Liking +
            Country,
            data=D)
Anova(model, type='II')

# Nationality score vs Income

model <- lm(NationalityScore ~ IncomePersonal * Country, data=D)
Anova(model, type='II')
cor.test(D$NationalityScore, D$IncomePersonal)

scatterPlotMulti(D, "IncomePersonal", "NationalityScore", "Country",
                 fileName=paste("Income-vs-Nationality.png"),
                 graphTitle=("Income vs Nat. Score"))

# Effect of Occupation on Nationality score (classes not balanced and different across countries)
D_subset = D[D$Occupation %in% 
               c("Housewife", "Unemployed (benefits)", "Student (unemployed)",
                 "Pensioner (unemployed)", "Student (working)", "Pensioner (working)",
                 "Entrepreneur", "Employer", "Employee"), ]
model <- lm(NationalityScore ~ Occupation * Country, data=D_subset)
Anova(model, type='II')

violinPlot(D_subset, 'Occupation', 'NationalityScore',
           fileName = 'Violin_Occ_NatScore.png',
           graphTitle = 'National Score by Occupation')

# Working or not working
model <- lm(NationalityScore ~ Working * Country, data=D)
Anova(model)
barMulti(dataFrame=D, 'Working', 'NationalityScore', 'Country',
         fileName="Hist_Working-vs-NatScore.png",
         graphTitle = "Nat. Score by Employment")

# Statistics for each column (A GRAPH WOULD HELP HERE!):
for (col in c(q_satisfaction, q_agree, q_equal_opp)){
  for (country in c("Finland", "Estonia")){
    cat(col, country, "\n")
    print(summary(D[D$Country == country, col]))
    print(summary(as.factor(D[D$Country == country, col])))
    cat("\n")
  }
}

# Do MANOVAs (Multivariate ANOVA)
manova_plot(D, q_satisfaction, "Satisfaction_", graphTitle="Level of Life Satisfaction by Country")
manova_plot(D, q_agree, "Level of Personal Well-being")
manova_plot(D, q_equal_opp, "EqualOpp_")
manova_plot(D, q_nationality, "Nat_")

