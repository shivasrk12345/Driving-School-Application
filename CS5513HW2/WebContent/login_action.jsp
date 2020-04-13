<%@page import="cs5513.DataHandler"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Action</title>

</head>
<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session"/>
<body>

<%@ page import="cs5513.DataHandler" %>
	<%@ page import="java.sql.ResultSet" %>
	<%@ page import="java.sql.Array" %>
	<%@ page import="javax.servlet.http.HttpSession" %>

	<%
		HttpSession thisSession = request.getSession();
		DataHandler handler = new DataHandler();
		String url = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";
		
		String id = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		
		try {
			int loggedin = handler.authenticateUser (url, id, pwd, thisSession);
			if(loggedin==1){
				session.setAttribute("userid", id);
				response.sendRedirect("menu.jsp");
			}
			else response.sendRedirect("login.jsp");
		}
		
		catch (Exception e) {
			System.out.println("Failed to login");
		}
	
	%>
	
</body>
</html>