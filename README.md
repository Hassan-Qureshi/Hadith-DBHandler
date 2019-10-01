# Hadith-DBHandler :book:
:wave:
This repository contains all the code to interact with the MySQL database. It also contains a .sql dumb file in order to create a database and structure.
You need to add following jars.
[Download JARS](https://docs.google.com/document/d/1qYKX0w1VZQzGS1whiRBW8zAnESgo0Q8jGBIgDN9mvm0/edit)
Following steps need to perform to setup the server from start.
Download eclipse java EE. (In our case we used Eclipse Neon)
[Download Eclipse Java EE](http://www.eclipse.org/downloads/packages/release/neon/r/eclipse-ide-java-ee-developers)
Install jdk. (In our case)
[Download JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
Now for the database interaction we have separate project and for the rest we use different project for ensuring the mvc.
Part-1 (MySQL interaction)
Part-2 (Creating Rest APIs using Jersey Framework)
First we’ll discuss the configuration of database interaction project.
	We need to follow simple steps:
Create new java project.
Right click on project name showing in project explorer and make a new folder with the name libraries. You will all paste the external third party jars over here.
Now paste the mysql connector jar. 
[Download MySQL connector JAR](https://dev.mysql.com/downloads/connector/j/)
Select all the pasted jars and right click. Go to build path and select configure build path... For further assistance follow step-1 only of this tutorial.
You are done. Now this project can interact with the database.
[Demo](https://www.wikihow.com/Add-JARs-to-Project-Build-Paths-in-Eclipse-(Java)) 
:ok_hand:
