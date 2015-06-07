### BASIC GRAPHICS

# Nationality
ggplot(D_nat, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Language
ggplot(D_lang, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# State Language
ggplot(D_sLang, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Income
ggplot(D_inc, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Satisfaction
ggplot(D_sat, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Agree
ggplot(D_agree, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Importance of state
ggplot(D_import, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()

# Equal opportunities
ggplot(D_eqOpp, aes(x=Question, y=mean)) +
  geom_bar(stat="identity", colour='black', fill='lightblue') +
  geom_errorbar(aes(ymin=mean-std, ymax=mean+std), width=.2) +
  coord_flip()