*proc reg data=surgical;
*	model lsurv=blood prog enz liver/ selection=rsquare cp aic sbc b best=3;

proc reg data=liverT;
	model LS_Bi = Age Sex Height1 Weight BMI1 Obes1 DM Met HTN HPL TG CHOL1 HDL1 LDL1 VDL AST1 ALT1 NAS Fibrosis/ selection=rsquare cp aic sbc b best=5;
run; quit;
