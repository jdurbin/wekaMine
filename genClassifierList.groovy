#!/usr/bin/env groovy 

// This is an example of a brute force way to make an experiment list.  I am working on 
// a compact syntax configuration file that will do this much more cleanly. 
// The output of this script is a list of specs to be used for each job. The spec has one 
// experiment per line and each line has the format:
// 
// classifier, attributeEval,attributeSearch,numAttributes,classAttribute
//
// This example produces 576 separate experiments. 
// 

kernel ='weka.classifiers.functions.supportVector.PolyKernel -C 250007 -E exponent'
classifier = 'weka.classifiers.functions.SMO -C cval -L 0.0001 -P 1.0E-12 -N 0 -V -1 -W 1 -K kernel'
asSearch='weka.attributeSelection.Ranker'
eval='durbin.weka.FisherLDEval'
attrStart = 50
attrEnd = 500
attrStep = 50
classAttribute = 'PLATINUM_FREE_INTERVAL_MONTHS'

// Now build the individual experiment strings...

// Build kernel srtrings...
kernels = []
(1..4).each{
  k = kernel.replaceAll('exponent',it as String)
  kernels << k
}

// Build classifier strings with kernel strings and various C values...
classifiers = []
kernels.each{k->
  c2 = classifier.replaceAll('kernel',"\"$k\"")
  (1..16).each{c->
    cfinal = c2.replaceAll('cval',c as String)
    classifiers << cfinal
  }    
}

// Add the attribute evaluator and search method...
classWithAS = []
classifiers.each{cl->
  c = "$cl,$eval,$asSearch"
  classWithAS << c
}

// Add the actual attribute selection cutoffs and class attribute...
classFinal = []
classWithAS.each{cl->
  attrStart.step(attrEnd,attrStep){numAttributes->
    c = "$cl,$numAttributes,$classAttribute"
    classFinal << c
  }  
}

// Print the experiment strings out...
classFinal.each{
  println it
}




