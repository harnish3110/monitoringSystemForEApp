1.	Introduction 

	1.1 Purpose of this document

    1.	Download and Install the necessary software
    2.	Import the Data base Schema (MySQL)
    3.	Import the code
    4.	Run the code

  1.2	Prerequisite:
    1.	JAVA software development kit should be installed. 
    The version I used is 1.8.x, link.
    2.	Hands on experience on computer and beginner level understanding of software development structure.
    3.	I have used Windows 10 operating System, but the guide is essentially similar with difference in only with version of the software used. Each software has its own version of each type of operating system.
 


2.	Installation of required software:

  2.1	Download and install the following software
    1.	MySQL Community Installer (link)
    When setting up the server, keep a note of what password are you setting up for the database, I gave as Admin123
    2.	Apache Tomcat v8 (Can use any version) link
    It is usually an archive folder which can be extracted to anywhere in the computer
    3.	Eclipse IDE (Latest version is advised but should work with any version) link


3. Code Integration

  3.1	Setting up Database:
    1.	In the code base, a folder named “sql” contains the script for database skeleton.
    2.	Open the MySQL workbench and connect to local host. Enter the credential as “root” and password, which you set during the installation of server.
    3.	Go to file create new SQL script. Copy the contain of database_skeleton_dump.sql from sql folder in point 1.
    4.	Run the script.
    5.	This skeleton is empty with an exception of “login” table which has the login credential for the project. The password for this user is a hash conversion of original using MD5 algorithm. 
    The password you see: 21232f297a57a5a743894a0e4a801fc3
    The actual password: admin
    6.	Once the scripts are executed you will be able to see a new schema name: “master_project” on left side, if not click on the refresh button.
    7.	The database is set up and ready to use.

  3.2	Setting the Code:

    1.	Open eclipse 
    2.	If it is a first time it may ask you to select a workspace, select one and continue.
    Workspace is a folder where all your codes and projects reside. You can have multiple workspace in a single system.
    3.	Go to file, Import, existing project.
    4.	Select the project, it may ask you to set a runtime instance. Here you will specify the server you installed in point 2.1-2. Select the appropriate version and location where it exists.
    5.	Once the import wizard is done, go to project and then clean and select the imported project. This will ensure all the libraries and installed and ready to use.
    I used maven dependency which is a software dependency manager where all the supporting libraries when mention are downloaded and ready to use.
    6.	Once all the dependencies are downloaded select the project and click on run. 
    If ask for which runtime environment select the Tomcat version you downloaded and the give the path where it is installed. Then continue.
    7.	Once the server boots up a new window should open with:
    url: localhost:8080/[project-name]/login.jsp
    8.	Enter the credentials:
      a.	User: admin
      b.	Password: admin
4	Key Files to remember:

  4.1.	Database Connection
    a.	In the source code go to: com.master.project.task.util
    b.	Open DBConnection.java
    c.	The code for database connection exists here.
    d.	If you have used different password when installing the MySQL server. Change the value of PASSWORD at line 12.
    Or if you have change the port or the user or are using different system as database then change the IP address of that system.
    e.	The variable DB holds the value of the schema where all your table reside for the system. 
    f.	If you are using some different database to use with this system, write the code for that in the method createConnection().
  4.2.	Dependency Manager:
    a.	The file pom.xml contains all the required dependency for the project.
    b.	If you want to add another dependency you need to enter your dependency module here.
  4.3.	Web Files;
    a.	All the JSP files are in WebContent
    b.	Here all the web pages reside.
 
5. Google Maps Integration

    1.	I have used my personal GMAIL address to get access to Google Maps API
    2.	Follow the tutorial to get your own API.
    3.	I have used marker clustering to group the markers all together.
    4.	In the WebContents folder open footer.jsp
    5.	Change the value of variable “api” at line 13 to your own google API key.
