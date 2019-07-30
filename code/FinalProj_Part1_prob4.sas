*import Liver Steatosis data from url;
filename liverdat url 'http://www.stat.purdue.edu/~wsharaba/stat512/LiverSteatosis.csv';

*read in data;
data liver;
	*specify comma as delimiter, set infile to begin reading at second row;
	infile liverdat delimiter=',' dsd firstobs=2;
	input Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;

*create new variable SUM representing summation of enzyme variables; 
data liver; set liver;
	*sum of aspartate and alanin aminotransferases;
	SUM=ast + alt;
	proc print data=liver;
	run;	
*run regression with biopsy result as response;
proc reg data=liver;
	*run regression without any enzyme variables;
	model LS_Bi=Age Sex Height Weight BMI SUM;
	model LS_Bi=Age Sex Height Weight SUM LS_US;
	model LS_Bi=BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US SUM;
	model LS_Bi=BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US SUM;
	model LS_Bi=BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG HDL LDL VDL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US SUM;
    model LS_Bi=Age Sex Height Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL NAS Fibrosis LS_US SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL SUM;
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL NAS LS_US SUM;	
run;
quit;

