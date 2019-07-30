
*Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;

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

proc reg data = liverT alpha=0.15;
	model LS_Bi = Age Sex Height1 Weight BMI1 Obes1 DM Met HTN HPL TG CHOL1 HDL1 LDL1 VDL AST1 ALT1 NAS Fibrosis/ clb ;
	run;

proc reg data=liverT;
	model LS_Bi = Age Sex Height1 Weight BMI1 Obes1 DM Met HTN HPL TG CHOL1 HDL1 LDL1 VDL AST1 ALT1/ selection= cp b;
run; quit;