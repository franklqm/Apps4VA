<%@page import="java.util.*, db.*" %>
<!--Jeffrey Antetomaso, antetojl@dukes.jmu.edu-->
<!DOCTYPE html>
<html>
    <head>
        <title>Query Crew's Project</title>
        <link href="webapp.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    
    <body>
        <a href='https://vlds.virginia.gov'>
            <img src='https://vlds.virginia.gov/media/1006/logo-large.png' height='100' width='300'>
        </a>
        
        <h1><em>474 Query Crew</em></h1>
        <p>Jeff Antetomaso, Matt Bowyer, Quentin Franklin, Zac Taves</p>
        <br>
            
        <h3>Select your type of query</h3>
        <form>   
            <input type="button" value="Absentee VS Teacher Salary" onClick="self.location = 'absvssalary.jsp'"/>
        </form>
        <br>
    </body>
</html>