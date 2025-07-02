# Network Intrusion Detection Management System

The topic of my final course project is a management system for a **Network Intrusion Detection System** built with **WebRatio**. The system uses several inline sensors to capture, analyze and store network traffic data in a database, while the management interface allows different users to browse the data and perform various tasks. See more in the [full report](ASE_Project_Report.pdf).

---

## Initializing the project

To get started, import the project archive (`IntrusionDetectionSystem.zip`) into WebRatio—if you’re not sure how, check out this [video tutorial](https://my.webratio.com/learn/learningobject/organize-the-workspace-v-72?cbck=wrReq87824). Once the project is in place, upload into it my custom style templates (`IDSstyle.zip`) via the WebRatio interface. If you encounter errors after applying the style, simply switch back to the **DefaultWebRatio** style and remove the **Reloading Operation** and **Periodical Refresh Component** from the site views.

Before you can generate and run the application, you’ll need to create a database and link it to the **Domain Model** in your project. In the `DB_script/` folder you’ll find `backup.sql`, which sets up the correct schema, and `datas.sql`, which populates your tables with sample data. Run `backup.sql` first, then `datas.sql`.

Once your database is configured, generate the application in WebRatio and log in to the Administrator view using **admin / admin**. Be aware that, due to a quirk in WebRatio, login only works if each user’s Name, Surname, Username and Password are identical—so keep that in mind when creating operator accounts.

If you run into any problems with my project or with WebRatio in general, just let me know. Have fun!
