# > Personal info <
# ReasonForMoving_*
# Religion_*

D_sub = D[ , 
c('Age',
  'Country',
  'TimeInCountry',
  'ReasonForMoving',
  'ReasonForMoving_Other',
  'Religion',
  'Religion_Other')]

# Plot Age histogram versus Religion
ggplot(D, aes(x=Age, fill=ReasonForMoving)) + 
  geom_histogram(binwidth=binWidth)

# Plot TimeInCountry vs Religion
ggplot(D, aes(x=TimeInCountry, fill=ReasonForMoving)) + 
  geom_histogram(binwidth=binWidth)

# Plot Age histogram versus Religion
ggplot(D, aes(x=Age, fill=Religion)) + 
  geom_histogram(binwidth=binWidth)

# Plot TimeInCountry vs Religion
ggplot(D, aes(x=TimeInCountry, fill=Religion)) + 
  geom_histogram(binwidth=binWidth)

# @@@ Do a summary of Other for both Religion and ReasonForMoving
