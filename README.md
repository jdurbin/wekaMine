wekaMine
========

wekaMine packages the wide range of algorithms in the Weka machine learning library into 
a form that is easier to use and more suitable for real-world machine learning problems:

* Suite of scripts for command line interface using tab files instead of arff. 
  * wmModelSelection
  * wmTrainModel
  * wmClassify
  * wmFilter
  * wmGenFolds
* Standardized basic model selction, model creation, and model evaluation pipeline. 
* Domain specific language to easily describe complex model selection experiments. 
* Many additional algorithms
  * BalancedRandomForest
  * BimodalityIndexFilter
  * MixtureModelFilter 
  * FisherLDEval
* Feature score outputs from CV folds. 
* Wrappers to simplify using Weka as a Java library
* Groovy syntax additions to Weka classes (e.g. instances[featureName]) 
* Automatic support for instance IDs
* Whole trained pipeline encapsulated in a serialized model
  * Feature selection (including finding appropriate feature intersections with new data) 
  * Trained classifier. 
  * Background model distribution. 


Main page: http://jdurbin.github.io/wekaMine/
Documentaion on wiki here:  https://github.com/jdurbin/wekaMine/wiki
