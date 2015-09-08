# correlogram function
corrAll <- function(dataFrame, graphTitle, fileName=NULL) {
  
  if (!is.null(fileName)) {
    png(file.path('graphs', fileName),
        width     = 8,
        height    = 8,
        units     = "in",
        res       = 300)
  }
  
  corrgram(dataFrame,
           order=TRUE, lower.panel=panel.conf,
           upper.panel=panel.pie, text.panel=panel.txt,
           main = graphTitle)
  
  if (!is.null(fileName)) {
    dev.off()
  }
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
    ggsave(file.path('graphs', fileName), p, width=9, height=6)
  } else {
    p
  }
}

histOpaque <- function(dataFrame, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(dataFrame, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth) + 
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(dataFrame[, fillCol])))
  
  saveGraph(p, fileName)
}

histClear <- function(dataFrame, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(dataFrame, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth, alpha=.5, position="identity") + 
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(dataFrame[, fillCol])))
  
  saveGraph(p, fileName)
}

histMulti <- function(dataFrame, xCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(fillCol), 'by', humaniseString(xCol)))
  }
  
  p <- ggplot(dataFrame, aes_string(x = xCol, fill = fillCol)) + 
    geom_histogram(binwidth = binWidth) + 
    facet_grid(Country ~ .) + # We always want to grid by country if at all
    ggtitle(graphTitle) + 
    xlab(humaniseString(xCol)) +
    guides(fill=guide_legend(title=humaniseString(fillCol)))
  
  p <- setGraph(p, length(levels(dataFrame[, fillCol])))
  
  saveGraph(p, fileName)
}

scatterPlot <- function(dataFrame, xCol, yCol, graphTitle, fileName=NULL) {
  p <- ggplot(dataFrame, aes_string(x = xCol, y = yCol)) +
    geom_point() +
    geom_smooth(method = lm) + 
    ggtitle(graphTitle) +
    xlab(humaniseString(xCol)) + 
    ylab(humaniseString(yCol)) +
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_bw()
  
  saveGraph(p, fileName)
}

scatterPlotMulti <- function(dataFrame, xCol, yCol, fillCol, fileName=NULL, graphTitle=NULL) {
  if (is.null(graphTitle)) {
    graphTitle <- ggtitle(paste(humaniseString(xCol), 'vs.',humaniseString(yCol)))
  }
  
  p <- ggplot(dataFrame, aes_string(x = xCol, y = yCol, colour=fillCol)) +
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

decisionTree <- function(dataFrame, intFactor, choiceFactors, fileName=NULL, graphTitle=NULL,
                        rpartMethod="class", cleanNames=TRUE) {
  set.seed(randomSeed)
  
  # Data is subset containing critical factors
  dataFrame_subset <- dataFrame[, c(intFactor, choiceFactors)]
  
  # Improve visualisation of names
  if (cleanNames) {
    names(dataFrame_subset) <- as.vector(sapply(
      cutPrefix(names(dataFrame_subset)),
      humaniseString)
    )
  }
  # Set interest factor back to original name
  names(dataFrame_subset)[which(names(dataFrame_subset) == humaniseString(intFactor))] <- intFactor
  
  frmla <- paste(intFactor, '~ .')
  
  # Decision tree
  tr <- rpart(frmla,
              data=dataFrame_subset, method=rpartMethod
  )
  
  print(summary(tr))
  
  if (!is.null(fileName)) {
    png(file.path('graphs', fileName),
        width     = 8,
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
