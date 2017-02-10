PROC MEANS DATA=statdata.testscores
   maxdec=2 fw=10 printalltypes;
  class Gender;
  var SATScore;
  title 'Descriptive Statistics Using SAS Mean';
  RUN;
  
PROC MEANS DATA=statdata.testscores
   maxdec=2 fw=10 printalltypes
   n mean median std var q1 q3;
  class Gender;
  var SATScore;
  title 'Descriptive Statistics Using SAS Mean';
  RUN;
  

  
  