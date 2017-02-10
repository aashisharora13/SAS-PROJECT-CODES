PROC SGPLOT Data=statdata.testscores;
refline 1200 / axis=y lineattrs=(color=blue);
vbox SATScore / datalabel=IDNumber;
format IDNumber 8.;
title 'Box Plots of SAT Score';
RUN;

