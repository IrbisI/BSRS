# correlogram function
corrAll <- function(df, name) {
  
  corrgram(df,
           order=TRUE, lower.panel=panel.conf,
           upper.panel=panel.pie, text.panel=panel.txt,
           main=name)
  
}

humaniseString <- function(s) {
  s <- strsplit(s, "(?:\\s|(?<=[a-z]))(?=[A-Z])", perl = TRUE)
  s <- unlist(s)
  s <- paste(s, collapse=' ')
}

cutPrefix <- function(s) {
  s <- sub("(^[^_]*_)", "", s, perl = TRUE)
}

setGraph <- function(p, colNum) {
  if (colNum < 9) {
    p <- p + scale_fill_brewer(palette="Accent")
  }  else {
    p <- p + scale_fill_brewer(palette="Set3")
  }
  
  p <- p + theme_bw() +
    theme(plot.title = element_text(lineheight=.8, face="bold"))
}

saveGraph <- function(p, fileName=NULL) {
  print(fileName)
  if (!is.null(fileName)) {
    ggsave(file.path('graphs', fileName), p)
  } else {
    p
  }
}

latexTable <- function(fit, tableName) {
  latexfile <- file.path(WD, 'tables', paste(tableName, '.tex', sep=''))
  fitTbl <- stargazer(fit)
  fitTbl <- c('\\documentclass{article}', '\\begin{document}', fitTbl, '\\end{document}')
  write(fitTbl, file=latexfile)
  
  setwd(file.path(WD, 'tables'))
  texi2dvi(file = latexfile, pdf = TRUE, clean = TRUE)
  setwd(WD)
}

histOpaque <- function(df, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(df, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth) + 
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(df[, fillCol])))
  
  saveGraph(p, fileName)
}

histClear <- function(df, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(df, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth, alpha=.5, position="identity") + 
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(df[, fillCol])))
  
  saveGraph(p, fileName)
}

histMulti <- function(df, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(df, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth) + 
    facet_grid(Country ~ .) + # We always want to grid by country if at all
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(df[, fillCol])))
  
  saveGraph(p, fileName)
}

scatterPlot <- function(df, xCol, yCol, graphTitle, fileName=NULL) {
  p <- ggplot(df, aes_string(x = xCol, y = yCol)) +
    geom_point() +
    geom_smooth(method = lm) + 
    ggtitle(graphTitle) +
    xlab(humaniseString(xCol)) + 
    ylab(humaniseString(yCol)) +
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_bw()
  
  saveGraph(p, fileName)
}

scatterPlotMulti <- function(df, xCol, yCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(xCol), 'vs.',humaniseString(yCol)))
  }
  
  p <- ggplot(df, aes_string(x = xCol, y = yCol, colour=fillCol)) +
    geom_point() +
    geom_smooth(method = lm) + 
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) + 
    ylab(humaniseString(yCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol))) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_bw()
  
  saveGraph(p, fileName)
}

decisionTree <- function(df, intFactor, choiceFactors, fileName=NULL, graphTitle=NULL,
                        rpartMethod="class", cleanNames=TRUE) {
  set.seed(randomSeed)
  
  # Data is subset containing critical factors
  df_subset <- df[, c(intFactor, choiceFactors)]
  
  # Improve visualisation of names
  if (cleanNames) {
    names(df_subset) <- as.vector(sapply(
      cutPrefix(names(df_subset)),
      humaniseString)
    )
  }
  
  frmla <- paste(intFactor, '~ .')
  
  # Decision tree
  tr <- rpart(frmla,
              data=df_subset, method=rpartMethod
  )
  
  print(summary(tr))
  
  if (!is.null(fileName)) {
    png(file.path('graphs', fileName),
        width     = 6,
        height    = 6,
        units     = "in",
        res       = 300)
  }
  
  fancyRpartPlot(tr, sub="")
  if (!is.null(graphTitle)){
    title(main=graphTitle, line=3)
  }
  
  if (!is.null(fileName)) {
    dev.off()
  }
}