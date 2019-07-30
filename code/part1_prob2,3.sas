*import Liver Steatosis data from url;
filename liverdat url 'http://www.stat.purdue.edu/~wsharaba/stat512/LiverSteatosis.csv';

*read in data;
data liver;
	*specify comma as delimiter, set infile to begin reading at second row;
	infile liverdat delimiter=',' dsd firstobs=2;
	input Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;

****Part 1 Problem 2****

*create new variable SUM representing summation of enzyme variables; 
data liver; set liver;
	*sum of aspartate and alanin aminotransferases;
	SUM=ast + alt;
	
*run regression with biopsy result as response;
proc reg data=liver;
	*run regression without any enzyme variables;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US;
	*run same regression with addition of sum variable;
	model LS_Bi=SUM Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US;
	*get F-statistic;
	test SUM;
run;

****Part 1 Problem 3****

*run regression with all predictors but SUM;
proc reg data=liver;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US / ss1 ss2;
run;

