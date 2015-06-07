# Type of data in each column
D_class <- sapply(D, class)

# Get only quantitative columns
D_numeric <- sapply(D, is.numeric)

Dq <- D[, D_numeric]

Dq_sum <- data.frame(names(Dq),
                     sapply(Dq, mean, na.rm = TRUE),
                     sapply(Dq, sd, na.rm = TRUE));
names(Dq_sum) <- c('Question', 'mean', 'std')
row.names(Dq_sum) <- NULL

# Sub-summaries

D_nat <- Dq_sum[grepl('Nat_', Dq_sum$Question), ]
D_lang <- Dq_sum[grepl('Language_', Dq_sum$Question), ] # Except StateLanguage
D_sLang <- Dq_sum[grepl('StateLanguage_', Dq_sum$Question), ]
D_cSchool <- Dq_sum[grepl('ChildSchool_', Dq_sum$Question), ] # Incorrect statistic!
D_inc <- Dq_sum[grepl('Income_', Dq_sum$Question), ]
D_sat <- Dq_sum[grepl('Satisfaction_', Dq_sum$Question), ]
D_agree <- Dq_sum[grepl('Agree_', Dq_sum$Question), ]
D_import <- Dq_sum[grepl('ImportanceState_', Dq_sum$Question), ]
D_eqOpp <- Dq_sum[grepl('EqualOpp_', Dq_sum$Question), ]

# Get only qualitative columns
D_qual <- sapply(D, is.character)

Dc <- D[, D_qual]