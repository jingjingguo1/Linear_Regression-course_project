data liver;
infile 'C:\Users\clint\Downloads\LiverSteatosis2.csv' DELIMITER=',' DSD firstobs=2;
input Age Sex Height Weight BMI Obes DM Met HTN HPL TG CHOL HDL LDL VDL AST ALT NAS Fibrosis LS_US LS_Bi;
symbol1 v=circle i=sm70 c=black;
proc sort data=liver; by VDL;
proc gplot data=liver;
title1 'Positive liver steatosis by biopsy versus very-low-density lipoprotein cholesterol';
title2 'Smoothing at 70';
plot LS_Bi*VDL;
run;
data liver; set liver;
if VDL le 25
then cslope=0;
if VDL gt 25
then cslope=VDL-25;
proc print data=liver;
run;
proc reg data=liver;
model LS_Bi=VDL cslope;
sameline: test VDL,cslope;
output out=pieceout p=varhat;
symbol1 v=circle i=none c=black;
symbol2 v=none i=join c=black;
proc sort data=pieceout; by VDL;
proc gplot data=pieceout;
title2 'Piecewise regression with change at VDL=25';
plot (LS_Bi varhat)*VDL/overlay;
run;
quit;
