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
	LS_Bi_T=sqrt(LS_Bi);
	AgeT=sqrt(Age);	SexT=sqrt(Sex);	HeightT=sqrt(Height); WeightT=sqrt(Weight); BMIT=sqrt(BMI); ObesT=sqrt(Obes); DMT=sqrt(DM);
		MetT=sqrt(Met);	HTNT=sqrt(HTN);	HPLT=sqrt(HPL);	TGT=sqrt(TG); CHOLT=sqrt(CHOL);HDLT=sqrt(HDL);LDLT=sqrt(LDL);VDLT=sqrt(VDL);
		ASTT=sqrt(AST);ALTT=sqrt(ALT);NAST=sqrt(NAS);FibrosisT=sqrt(Fibrosis);LS_UST=sqrt(LS_US);
	proc print data=liver;
	run;	
*run regression with biopsy result as response;
proc reg data=liver;
	*run regression without any enzyme variables;
	model LS_Bi=AgeT SexT HeightT WeightT BMIT ObesT DMT MetT HTNT HPLT TGT CHOLT HDLT LDLT VDLT ASTT ALTT NAST FibrosisT LS_UST;	
	model LS_Bi=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US;	
	model LS_Bi_T=Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US;	
run;
quit;

