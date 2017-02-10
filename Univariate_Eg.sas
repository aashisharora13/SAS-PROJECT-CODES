PROC CONTENTS DATA=statdata.testscores;
RUN;

ods graphics on/width=600;
PROC UNIVARIATE DATA=statdata.testscores;
VAR SATScore;
id IDNumber;
histogram SATScore / normal (mu=est sigma =est);
inset skewness kurtosis / position = ne;
probplot SATScore / normal (mu=est sigma=est);
inset skewness kurtosis;
title 'Descriptive Statistics Using PROC UNIVARIATE';
RUN;

