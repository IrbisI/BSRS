# >Future orientedness <
# ChildSchool_*

D_sub = D[ , 
          chi_Factors]

# Overall distribution of School Types
colSums(D_sub)

filterSchools = function (aRow) {
  schools = apply(aRow, 1, 
    function(u) {
      paste( names(which(u)), collapse=", " )
    }
  )
}

multiSchool = which(rowSums(D_sub) > 1)

for (m in multiSchool) {
  print(paste(as.character(m), ":    [", filterSchools(D_sub[m,]) , ']'))
}

# Number of people who have kids in any school
sum(rowSums(D_sub) > 0)

# Stack dataframe
stackeD = stack(D_sub)
stackeD$values = as.numeric(stackeD$values)

ggplot(stackeD, aes(x = ind, y = values, fill = ind)) + 
  geom_bar(stat = "identity")


