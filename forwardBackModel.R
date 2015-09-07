lm.factors <- c(sat_Factors, agr_Factors, equ_Factors)
Dsub <- D[, c(c('NationalityScore', lm.factors)]
min.model <- lm(NationalityScore ~ 1, data = na.omit(Dsub))
scope <- paste('~', paste(lm.factors, collapse=' + '))
fwd.model <- step(min.model, direction="forward", scope=scope)

full.model <- lm(paste('NationalityScore ~', paste(lm.factors, collapse=' + ')), data = na.omit(Dsub))
bck.model <- step(full.model, direction="backward")