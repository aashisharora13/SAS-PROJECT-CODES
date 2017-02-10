PROC PRINT DATA=statdata.normtemp (obs=10);
RUN; 

/*You want to understand if true mean body temperature is 98.6 and whether women's body temperatures
 are the same as men's body temperatures. 
 The Statdata.NormTemp data set contains the data that you need.*/
 
PROC MEANS DATA=STATDATA.normtemp
maxdec=2 fw=10 printalltypes
n mean median std q1 q3 QRANGE;
class Gender;
VAR BodyTemp;
RUN;

/*Do the mean values seem to differ between men and women? Answer - Yes*/
/*What is the interquartile range of body temperature? Answer - 0.90*/