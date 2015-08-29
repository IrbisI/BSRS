stringGrouping = function(column, grouping) {
  N = D[[column]]
  
  # Lowercase every word
  for (n in 1:length(N)) {
    N[n] = tolower(N[n])
  }
  
  group = matrix(data=NA,nrow=length(N),ncol=length(grouping))
  
  # Lowercase every word
  for (m in 1:length(grouping)) {
    for (n in 1:length(N)) {
      group[n,m] = grepl(grouping[m], N[n])
    }  
  }
  colnames(group) = grouping
  
  groupSum = rowSums(group, na.rm = T)
  
  # Print empty ones
  print("<-- Empty-group -->")
  emptyGroup = which(groupSum == 0)
  for (e in 1:length(emptyGroup)) {
    print(paste(toString(emptyGroup[e]), ": ", N[emptyGroup[e]]))
  }
  print(length(emptyGroup))
  
  # Print multigroup
  print("<-- Multi-group -->")
  multiGroup = which(groupSum > 1)
  for (e in 1:length(multiGroup)) {
    print(paste(toString(multiGroup[e]), ": ", N[multiGroup[e]]))
  }
  print(length(multiGroup))
  
  # Print number of unigroup
  print("<-- Uni-group -->")
  uniGroup = which(groupSum == 1)
  print(length(uniGroup))
  
  # Print groups in columns
  print(colSums(group))
}
