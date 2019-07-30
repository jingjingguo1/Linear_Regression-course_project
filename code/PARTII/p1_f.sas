* import data;
data liver;
infile 'D:\01PROGRAMS\sas\data\LiverSteatosis.csv' DELIMITER=',' DSD;
input Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;

ods graphics on;
title 'Liver Data';
proc corr data=liver nomiss plots=matrix(histogram NVAR=ALL NWITH=ALL) PLOTS(MAXPOINTS=NONE);
	*var Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;
	var CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;
run;
ods graphics off;

quit;
