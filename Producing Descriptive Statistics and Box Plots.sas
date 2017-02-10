/*You need to determine if the variables BodyTemp and HeartRate in the Statdata.NormTemp data 
set are normally distributed and if average body temperature is truly 98.6 degrees.*/
PROC PRINT DATA=statdata.normtemp (Obs=10);
RUN;

ods graphics on/width=600;
PROC UNIVARIATE DATA= statdata.normtemp;
var BodyTemp HeartRate;
id ID;
histogram BodyTemp / normal (mu=est sigma =est);
inset skewness kurtosis / position = ne;
probplot BodyTemp / normal (mu=est sigma=est);
inset skewness kurtosis;
histogram HeartRate / normal (mu=est sigma =est);
inset skewness kurtosis / position = ne;
probplot HeartRate / normal (mu=est sigma=est);
inset skewness kurtosis;
title 'Descriptive Statistics Using PROC UNIVARIATE';
RUN;

/*Create box plots for the BodyTemp and HeartRate variables. Use ID to identify outliers. For BodyTemp, 
display a reference line at 98.6 degrees. Does the average body temperature seem to be 98.6 degrees?*/

PROC SGPLOT Data=statdata.normtemp;
refline 98.6 / axis=y lineattrs=(color=blue);
vbox BodyTemp / datalabel=ID;
format ID 8.;
title 'Box Plots of Body Temp ';
RUN;


PROC SGPLOT Data=statdata.normtemp;
*refline 98.6 / axis=y lineattrs=(color=blue);
vbox HeartRate / datalabel= ID;
format ID 8.;
title 'Box Plots of Heart Rate ';
RUN;


/*Conclusion*/
/* Because the histograms are bell shaped and the data follows the diagonal reference lines 
   in the normal probability plots, the variables BodyTemp and HeartRate are both normally distributed.
   The skewness and kurtosis statistics are fairly close to zero for both variables as well, 
   which tells us that BodyTemp and HeartRate are approximately normal.*/
   
/******************************************************************************************/   
   
/*Finding Standard Error And Confidence Interval*/

PROC MEANS DATA = Statdata.testscores maxdec=4
       n mean stderr clm;
       var SATScore;
       title '95% Confidence Interval SAT';
RUN;
title;      

/*The sample size is 80. The mean of SATScore is 1190.625. The standard error of the mean is 16.4416.
 The standard error measures the variability of the sample mean or how much error we can expect 
 if we use the sample mean to estimate the true population mean. The 95% confidence interval of the 
 mean is 1157.9 to 1223.4. This indicates that you're 95% confident that the true population mean
  is contained within this interval. */


/*Practice Confidence Interval*/
/*Use PROC MEANS to generate a 95% confidence interval for the mean of BodyTemp in the NormTemp data set. 
Is the assumption of normality met to produce a confidence interval for these data? */

PROC MEANS DATA=statdata.normtemp 
n mean stderr clm;
var BodyTemp;
title '95% Confidence Interval of Norm Temperature';
RUN;
title;

/* The normality assumption seems to hold because the sample size is large enough and 
because the data values seemed to be normally distributed.
The 95% confidence interval is 98.12 to 98.38 degrees Fahrenheit.
You are 95% confident that the true mean body temperature for the population of all people in the world is somewhere 
between 98.12 and 98.38 degrees.*/


/*############################################################################################*/
/*Using PROC UNIVARIATE to Perform a Hypothesis Test*/
/*This program uses PROC UNIVARIATE to test the hypothesis that the mean of SATScore is equal to 1200.
Your null hypothesis is that the population's 
mean SAT score for the Carver County magnet high schools is 1200. */

ods select testsforlocation;
PROC UNIVARIATE data=statdata.testscores mu0=1200;
   VAR SATscore;
   title 'Testing whether mean of test score is 1200';
   RUN;

/*The Tests for Location table provides the t statistic, labeled Student's t, 
  and the corresponding p-value. The p-value is greater than the significance level,
  or α, of 0.05 that we had set. Note by the way that it is a coincidence that the
  t statistic and p-value have the same numeric value (although one is positive and 
  the other negative). Because the p-value is greater than alpha, we fail to reject 
  the null hypothesis. Therefore, we believe that there is no statistical difference 
  between the sample mean of 1190 and the hypothesized mean of 1200. */  
  
/*############################################################################################*/


PROC UNIVARIATE DATA=statdata.normtemp mu0=98.6;
var BodyTemp;
title 'Testing whether the mean of BodyTemp is 98.6';
RUN;

/*Because the p-value is less than the stated alpha level of .05, you do reject the null hypothesis.*/








