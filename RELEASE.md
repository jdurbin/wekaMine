Release Notes
========
 
wekaMine 5877b95..25a3504
--------
Required: durbinlib 45c7fa7..63b9ca4  

1.  Fixed support for automatically comparing classifications with wmClassify.
	
		The -i option lets you pass in the clinical file and it will compare the classifications with the true classes.

2.  Fixed wekaMine's holdout support.  
		
		Weka Mine allows you to define a holdout which can be used for subsequent validation. 
		
		You use wmGenFolds to generate a folds file and a holdout file. Note that the holdout will be 
		stratified (as all cross validation folds are).  

		You can then pass the holdout file to wekaMine and wmSaveModel with -S option to omit those samples 
		from model selection and model training.  You can further supply this -S option to wmClassify to 
		classify and (with -i option) compare to ONLY the holdout samples.   
         
3.	All input and output files to wekaMine are now tab delimited.  
