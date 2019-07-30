
* choose different variable as "response" to get the best transformation lambda;

proc transreg details data=liver ss2 plots=(transformation(dependent) obp);
  model BoxCox(Age / convenient lambda=-5 to 5 by 0.05) = qpoint(Age Sex Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi);
run;
