# Latex table out of common analyses
latexTable <- function(fit, fileName, myTitle) {
  latexfile <- file.path(WD, 'tables', paste(fileName, '.tex', sep=''))
  fitTbl <- stargazer(fit, title = myTitle)
  fitTbl <- c('\\documentclass{article}', '\\begin{document}', fitTbl, '\\end{document}')
  write(fitTbl, file=latexfile)
  
  setwd(file.path(WD, 'tables'))
  texi2dvi(file = latexfile, clean = TRUE)
  setwd(WD)
}

# linear model function, prints report
linearModel <- function(dataFrame, dependent, independent, fileName=NULL) {
  frmla <- paste(dependent, "~", paste('as.numeric(', independent, ')', collapse=" + "))
  fit <- lm(formula = frmla, data = dataFrame)
  print(summary(fit))
  
  if (!is.null(fileName)){
    lt <- latexTable(fit, fileName)
  }
}

# Princial Component Analysis function
PCA = function(dataFrame, fileName=NULL) {
  
  for(i in c(1:ncol(dataFrame))) {
    dataFrame[,i] <- as.numeric(dataFrame[,i])
  }
  
  fit <- princomp(na.omit(dataFrame),
                  center = TRUE, scale = TRUE,
                  cor = FALSE) # Use Covariance matrix, not Correlation
  
  summary(fit) # print variance accounted for 
  loadings(fit) # pc loadings 
  
  plot(fit, type="lines") # scree plot
  
  fit$scores # the principal components
  
  p <- ggbiplot(fit) + theme_bw()
  saveGraph(p, fileName)
}

# Not working for some reason... @@@
stepModel <- function(dataFrame, intFactor, depFactors) {
  
  dataFrame_subset <- na.omit(dataFrame[, c(intFactor, depFactors)])
  
  frmla <- paste(intFactor, "~ 1")
  
  min.model <- lm(formula=I(frmla), data = dataFrame_subset)
  scope <- paste('~', paste(depFactors, collapse = ' + '))
  fwd.model <- step(min.model, direction="forward", scope = I(scope))
  
  #full.model <- lm(paste(intFactor, '~', paste(depFactors, collapse=' + ')), data = na.omit(Dsub))
  #bck.model <- step(full.model, direction="backward")
  
  print(summary(fwd.model))
  fwd.model
  
}
