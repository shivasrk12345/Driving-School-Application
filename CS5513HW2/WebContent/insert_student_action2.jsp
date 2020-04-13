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
<center><a href="menu.jsp"><strong>student Record Inserted! Click Here to Go Back to Menu Page</strong></a></center>

<%  
  DataHandler handler = new DataHandler(); 
System.out.println("invoking the insert car method");
handler.insertStudent(request.getParameter("studentid"), 
	      request.getParameter("steustudentnamedn"),
	      request.getParameter("street"),
	      request.getParameter("city"),
	      Integer.parseInt(request.getParameter("day")),
	      request.getParameter("month"),
	      Integer.parseInt(request.getParameter("year")),request.getParameter("driverid"));
  
%>
		
</body>
</html>