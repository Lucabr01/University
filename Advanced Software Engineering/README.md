The topic of my final course project is a management system for a **Network-Intrusion Detection System**
built with **WebRatio**. The system uses several inline sensors to capture, analyze, and store
network traffic data in a database. The management interface is then used by various actors
to access the data and perform different tasks...See more on the [report](<ASE_Project_Report.pdf>)


#Inizializing the project

First you will have to import the [project](IntrusionDetectionSystem.zip) (if you dont know how to do it check this [video](https://my.webratio.com/learn/learningobject/organize-the-workspace-v-72?cbck=wrReq87824)). The you should add into the project (from the webratio platform software) my [custom style templates](IDSstyle.zip). If after adding the style WebRatio generates error, just apply the DefaultWebRatio Style pages and delete from the site views the **Reloading Operation** and the **Periodical Refresh Component". 

To generate and try the project, firsr, you must create a database and link it to the one inside the **Domain Model**. Inside the DB_scripts folder you can find the [backup.sql](DB_script/backup.sql) file, use it to create the right db schema. Then run the [datas.sql](DB_script/datas.sql) to populate the tables with some examples...

Once all works you can generate the project, than login inside the Administrator view with --admin--admin-- as username and pass. For some unknown reasons ( you will have a lot of wild errors with WebRatio, be ready :) ) the login only works if the Name,Surname,Passw and Username of each User are the same, so take it in mind when u try to create an operator. 

If you have some problems with my project or with WebRatio in general just write me. Have fun
