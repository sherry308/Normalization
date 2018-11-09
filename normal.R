options(scipen=999)
library(MASS);
args <- commandArgs(TRUE)
library("caret")
train=read.csv(args[1],check.names=FALSE)
test=read.csv(args[2],check.names=FALSE)
nzv <- nearZeroVar(train)
filteredDescr <- train[, -nzv]
filteredDescr1 <- test[, -nzv]
#print dim(filteredDescr);
procValues <- preProcess(filteredDescr, method = c("center", "scale"))
scaledTraindata <-  predict(procValues, filteredDescr)
scaledTestdata <-  predict(procValues, filteredDescr1)
write.csv(scaledTraindata,file= "train_normal")
write.csv(scaledTestdata,file="test_normal")