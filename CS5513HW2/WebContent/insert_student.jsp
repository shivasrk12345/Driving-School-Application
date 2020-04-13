<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert a student Record</title>
</head>
<body>

	<h2 align="center">CS5513 Web Application</h2>
	<h3 align="center">Insert a  student Record</h3>
	<h3 align="center"><jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session"/>
	</h3>


	<form action="insert_student_action2.jsp">
		
		<div align="center"> 
      	<p>&nbsp;</p> 
      	<table cellspacing="2" cellpadding="3" border="1" width="369"> 
        <tr> 
          <td width="38%"> 
          	<strong>studentid :</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="studentid"/> 
          </td> 
        </tr> 
        <tr> 
          <td width="38%"> 
            <strong>studentname:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="studentname"/> 
          </td> 
        </tr> 
        
           
        <tr> 
          <td width="38%"> 
            <strong>street:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="street"/> 
          </td>
        </tr> 
        
        <tr> 
          <td width="38%"> 
            <strong>city:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="city"/> 
          </td>
        </tr> 
        <tr> 
          <td width="38%"> 
            <strong>day:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="day"/> 
          </td>
        </tr> 
        
        <tr> 
          <td width="38%"> 
            <strong>month:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="month"/> 
          </td>
        </tr> 
        <tr> 
          <td width="38%"> 
            <strong>year:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="year"/> 
          </td>
        </tr> 
        
        
          <td width="38%"> 
            <strong>driverid:</strong> 
          </td> 
          <td width="62%"> 
            <input type="text" name="driverid"/> 
          </td>
        </tr> 
         
      </table> 
      <table cellspacing="3" cellpadding="2" border="0"> 
        <tr> 
          <td> 
            <input type="submit" value="Insert Student"/> 
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