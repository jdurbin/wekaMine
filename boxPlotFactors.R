#!/usr/bin/env Rscript

library(lattice)
library(ggplot2)

args = commandArgs(TRUE)

titleRoot = args[1]
fileName = args[2]
plotOutFile = args[3]

#titleRoot = "BLCA"
#fileName = "factors.tab"
#plotOutFile = "output.pdf"


classifiers = read.table(fileName,sep="\t",header=TRUE)

#classifiers

# Make median ordered factors...
bymedianFilter = with(classifiers, reorder(filter, -roc, median))
bymedianclassAttr = with(classifiers, reorder(classAttribute, -roc, median))
bymedianAttrSel = with(classifiers, reorder(attributeSelection, -roc, median))
bymedianNumAttributes = with(classifiers, reorder(factor(numAttributes), -roc, median))
bymedianClassifier = with(classifiers, reorder(classifier, -roc, median))

pdf(file=plotOutFile)

q = qplot(bymedianFilter,roc,data=classifiers,geom="boxplot")
q+theme(axis.text.x = element_text(angle=45,hjust=1))+labs(title=paste(titleRoot,"Performance by Filter"))

q = qplot(bymedianclassAttr,roc,data=classifiers,geom="boxplot")
q+theme(axis.text.x = element_text(angle=45,hjust=1))+labs(title=paste(titleRoot,"Performance of different target classes"))

q = qplot(bymedianAttrSel,roc,data=classifiers,geom="boxplot")
q+theme(axis.text.x = element_text(angle=45,hjust=1))+labs(title=paste(titleRoot,"Performance by Attribute Selection"))

q = qplot(bymedianNumAttributes,roc,data=classifiers,geom="boxplot")
q+theme(axis.text.x = element_text(angle=45,hjust=1))+labs(title=paste(titleRoot,"Performance by Number of Attributes"))

q = qplot(bymedianClassifier,roc,data=classifiers,geom="boxplot")
q+theme(axis.text.x = element_text(angle=45,hjust=1))+labs(title=paste(titleRoot,"Performance by Classifier Type"))

garbage = dev.off()
