# Latex table out of common analyses
latexTable <- function(fit, tableName) {
  latexfile <- file.path(WD, 'tables', paste(tableName, '.tex', sep=''))
  fitTbl <- stargazer(fit)
  fitTbl <- c('\\documentclass{article}', '\\begin{document}', fitTbl, '\\end{document}')
  write(fitTbl, file=latexfile)
  
  setwd(file.path(WD, 'tables'))
  texi2dvi(file = latexfile, pdf = TRUE, clean = TRUE)
  setwd(WD)
}

# linear model function, prints report
linearModel <- function(df, dependent, independent, fileName=NULL) {
  frmla <- paste(dependent, "~", paste('as.numeric(', independent, ')', collapse=" + "))
  fit <- lm(formula = frmla, data = df)
  print(summary(fit))
  
  if (!is.null(fileName)){
    lt <- latexTable(fit, fileName)
  }
}

# Princial Component Analysis function
PCA = function(df) {
  
  for(i in c(1:ncol(df))) {
    df[,i] <- as.numeric(df[,i])
  }
  
  fit <- princomp(na.omit(df),
                  center = TRUE, scale = TRUE,
                  cor = FALSE) # Use Covariance matrix, not Correlation
  
  summary(fit) # print variance accounted for 
  loadings(fit) # pc loadings 
  
  plot(fit, type="lines") # scree plot
  
  fit$scores # the principal components
  
  biplot(fit)
}


