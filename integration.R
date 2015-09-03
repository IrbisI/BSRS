# > Integration <
# *Language_*
# ImportanceState_*

lan_Factors = c('Language_Finnish',
                 'Language_Estonian',
                 'Language_Swedish',
                 'Language_English',
                 'Language_German',
                 'Language_Other')
sta_Factors = c('StateLanguage_Listen',
                'StateLanguage_Read',
                'StateLanguage_Speak',
                'StateLanguage_Write')

D_sub = D[ ,
          c(lan_Factors,
            sta_Factors)]

# Language
lanStrength = D[, lan_Factors]
lanStrength[is.na(lanStrength)] = 0

fit <- princomp(lanStrength,
                center = TRUE, scale = TRUE,
                cor=TRUE)
summary(fit) # print variance accounted for 
loadings(fit) # pc loadings 
plot(fit,type="lines") # scree plot 
fit$scores # the principal components
biplot(fit)

# State Language
fit <- princomp(na.omit(D[, sta_Factors]),
                center = TRUE, scale = TRUE,
                cor=TRUE)
summary(fit) # print variance accounted for 
loadings(fit) # pc loadings 
plot(fit,type="lines") # scree plot 
fit$scores # the principal components
biplot(fit)
