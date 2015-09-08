#### ####
depFactors <- equ_Factors

dataFrame_subset <- na.omit(D[, c('NationalityScore', depFactors)])

min.model <- lm('NationalityScore ~ 1', data = dataFrame_subset)
scope <- paste('~', paste(depFactors, collapse = ' + '))
fwd.model <- step(min.model, direction="forward", scope = scope)

full.model <- lm(paste(intFactor, '~', paste(depFactors, collapse=' + ')), data = na.omit(Dsub))
bck.model <- step(full.model, direction="backward")

print(summary(bck.model))
print(summary(fwd.model))

#### ####

depFactors <- agr_Factors

dataFrame_subset <- na.omit(D[, c('NationalityScore', depFactors)])

min.model <- lm('NationalityScore ~ 1', data = dataFrame_subset)
scope <- paste('~', paste(depFactors, collapse = ' + '))
fwd.model <- step(min.model, direction="forward", scope = scope)

full.model <- lm(paste(intFactor, '~', paste(depFactors, collapse=' + ')), data = na.omit(Dsub))
bck.model <- step(full.model, direction="backward")

print(summary(bck.model))
print(summary(fwd.model))

#### ####

depFactors <- sat_Factors

dataFrame_subset <- na.omit(D[, c('NationalityScore', depFactors)])

min.model <- lm('NationalityScore ~ 1', data = dataFrame_subset)
scope <- paste('~', paste(depFactors, collapse = ' + '))
fwd.model <- step(min.model, direction="forward", scope = scope)

full.model <- lm(paste(intFactor, '~', paste(depFactors, collapse=' + ')), data = na.omit(Dsub))
bck.model <- step(full.model, direction="backward")

print(summary(bck.model))
print(summary(fwd.model))

#### ####

depFactors <- c('Satisfaction_Safety', 'Satisfaction_Friends', 'Satisfaction_Family',
                'Agree_DefendInterests', 'EqualOpp_HeadWork')

dataFrame_subset <- na.omit(D[, c('NationalityScore', depFactors)])

min.model <- lm('NationalityScore ~ 1', data = dataFrame_subset)
scope <- paste('~', paste(depFactors, collapse = ' + '))
fwd.model <- step(min.model, direction="forward", scope = scope)

full.model <- lm(paste(intFactor, '~', paste(depFactors, collapse=' + ')), data = na.omit(Dsub))
bck.model <- step(full.model, direction="backward")

print(summary(bck.model))
print(summary(fwd.model))

# stepFunction not working
if (F) {
  stepModel(D, 'NationalityScore', equ_Factors)
  
  stepModel(D, 'NationalityScore', agr_Factors)
  
  stepModel(D, 'NationalityScore', sat_Factors)
}
