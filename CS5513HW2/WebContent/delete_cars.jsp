<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete cars</title>
</head>
<body>

<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Delete cars</h3>
	<h3 align="center"><jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session"/>
	</h3>


	<form action="delete_cars_action.jsp">
	
		<div align="center"> 
      	<p>&nbsp;</p> 
      	<table cellspacing="2" cellpadding="3" border="1" width="369"> 
        <tr> 
          <td width="38%"> 
          	<strong>numdoors:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="numdoors"/> 
          </td> 
        </tr> 
                 
      </table> 
      
      <table cellspacing="3" cellpadding="2" border="0"> 
        <tr> 
          <td> 
            <input type="submit" value="Delete cars"/> 
          </td> 
        </tr> 
      </table> 
      <br><br> <a href="menu.jsp"><strong>Back to Menu Page</strong></a>
      <p> 
        &nbsp; 
      </p> 
    </div>

	</form> 

</body>
</html>