# Princial Component Analysis function
PCA = function(df) {
  
  fit <- princomp(na.omit(df),
                  center = TRUE, scale = TRUE,
                  cor = FALSE) # Use Covariance matrix, not Correlation
  
  summary(fit) # print variance accounted for 
  loadings(fit) # pc loadings 
  
  plot(fit, type="lines") # scree plot
  
  fit$scores # the principal components
  
  biplot(fit)
  
}

