title 'Car Inventory By Type';
PROC FREQ DATA=sashelp.cars;
   TABLES TYPE/nocum;
   RUN;
title;


