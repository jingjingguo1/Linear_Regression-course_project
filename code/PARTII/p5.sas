* title 'GPA v.s. HSM and HSE';
* title2 'By Jingjing Guo';

data liverT;
	set liver;

	* Height0 = log(Height);
	* BMI0 = log(BMI);
	* Obes_5 = sqrt(Obes);
	* CHOL3 = pow(CHOL,3);
	* HDL2 = pow(HDL,2);
	* LDL3 = pow(LDL,3);
	* AST0 = log(AST);
	* ALT_25 = pow(ALT,0.25);
	Height1 = log(Height);
	BMI1 = log(BMI);
	Obes1 = sqrt(Obes);
	CHOL1 = CHOL**3;
	HDL1 = HDL**2;
	LDL1 = LDL**3;
	AST1 = log(AST);
	ALT1 = ALT**0.25;
run;

title 'LS_US v.s. Height1 TG ALT1 and NAS Fibrosis';
proc reg data=liverT2;
	model LS_US = Height1 TG ALT1 NAS Fibrosis;
	output out=results p=pred r=resid;

data results1;
	set results;
	obs=_n_;
	run;

symbol1 v=diamond;
title 'Scatter plot of residuals';
proc gplot data=results1;
	plot resid*obs / VREF=0; run;

title 'Residual Distribution';
proc univariate data=results noprint;
   histogram resid / odstitle = title normal;
run;


title 'Normal Probability Plot of Residuals';
proc univariate data=results;
   qqplot resid resid;
run;
quit;
