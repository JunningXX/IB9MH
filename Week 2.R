## Week 2 
library(readr)
rawdata_02 <- read_csv("adjectives_data.csv")


# load pacakges 
library(tidyverse)
library(ggplot2)
library(esquisse)
library(sjPlot)
library(afex)
library(reshape2)

# Draw some plots 
esquisse::esquisser(rawdata_02)

# Correlation matrix and heatmap
cormat <- round(cor(rawdata_02[, c(-1)] ),2)
head(cormat)
# Get lower triangle of the correlation matrix
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}

lower_tri<- get_lower_tri(cormat)

melted_cormat <- melt(lower_tri, na.rm = TRUE)
head(melted_cormat)

reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}

# Reorder the correlation matrix
cormat <- reorder_cormat(cormat)
head(cormat)
lower_tri <- get_lower_tri(cormat)
# Melt the correlation matrix
melted_cormat <- melt(lower_tri, na.rm = TRUE)
head(melted_cormat)
# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 9, hjust = 1))+
  coord_fixed() + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 1.5) + 
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0)) 

## Some factor analysis 
summary(rawdata_02)

colSums(is.na(rawdata_02)) # Check for missing data

KMO(rawdata_02[,-1]) ## Overall MSA =  0.97 

ev <- eigen(cor(rawdata_02[, -1])) # get eigenvalues
ev$values

scree(rawdata_02[,-1], pc=FALSE)  

fa.parallel(rawdata_02[,-1], fa="fa")

## Parallel analysis suggests that the number of factors =  6  and the number of components =  NA

Nfacs <- 6  # This is for four factors. You can change this as needed.

fit <- factanal(rawdata_02[,-1], Nfacs, rotation="promax")

print(fit, digits=2, cutoff=0.3, sort=TRUE)

load <- fit$loadings[,1:2]
plot(load,type="n") # set up plot
text(load,labels=names(rawdata_02[,-1]),cex=.7)

loads <- fit$loadings

fa.diagram(loads)


