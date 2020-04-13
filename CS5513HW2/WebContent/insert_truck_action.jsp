<%@page import="cs5513.DataHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Car Action</title>
</head>
<body>
<br><br><br>
<center><a href="menu.jsp"><strong>Truck Record Inserted! Click Here to Go Back to Menu Page</strong></a></center>

<%  
  DataHandler handler = new DataHandler(); 
System.out.println("invoking the insert car method");
handler.insTruck(request.getParameter("liscenseplate"), 
	      request.getParameter("model"),
	      request.getParameter("make"),
	      Integer.parseInt(request.getParameter("year")),
	      request.getParameter("op1"),
	      request.getParameter("op2"),
	      request.getParameter("op3"),request.getParameter("CabinType"),Integer.parseInt(request.getParameter("Weight")));
  
%>
		
</body>
</html>