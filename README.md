# ScotiaCruisesV5
This was a BSc Computing (Software Development) Third Year project for 'Designing Web-based Applications' 
at Moray College UHI (The University of the Highlands and Islands) under Lecturer Darryl Oatridge in Elgin.
It is written in Java / JSP and uses Servlets as controllers and has model and DAO classes. 
This project is very much a work in progress. The first iteration had basic functionality but had several 
anomalies and was strewn with errors. I have made several revisions since it was first submitted and it is 
now in a state that it worth sharing online, although it still has some obvious issues which need to be addressed.
 
There is one daily cruise per route, and three routes (301, 302 and 303), which are Morar to Rum return, Morar to Muck return, and Morar
to Eigg return. The vessels circumnavigate the islands in question and make stops to enable passengers to explore each of the Small Isles.

You can create the database in MySQL running 'CreateDatabaseRevA.sql' - this creates the database 'dwba_assessmentV5'. 
As its a MySQL database be sure to connect to localhost port 3306, with the user as 'root' and the password as 'stcallans'.
Alternatively you can edit the source code.

To login as an admin user use 'admin' as the login username, and 'admin' as the login password. You can then 
browse the application. To use the application as a customer, first register / login with your username and password
