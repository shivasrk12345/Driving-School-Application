<%@page import="cs5513.DataHandler"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Students details</title>
</head>
<body>
<br><br><br>
<center><a href="menu.jsp"><strong>Query Results are as follows: Click Here to Go Back to Menu Page</strong></a></center>
<jsp:useBean id="empsbean" class="cs5513.DataHandler" scope="session"/>
<p>
	<%
	DataHandler handler = new DataHandler();  
	ResultSet rset=null; 
	
	try{
		rset= handler.findCarDetails(request.getParameter("equipmentoption"));
	
	}
	catch(Exception e){
		System.out.println("error");
		e.printStackTrace();
	}
	System.out.println(rset);
	%>
	</p>
	
	<div align="center"> 
  <table cellspacing="2" cellpadding="3" border="1"> 
  <tr> 
    <td align="center"> 
      <h4>lisenseplate</h4> 
    </td> 
    <td align="center"> 
      <h4>model</h4> 
    </td> 
    <td align="center"> 
      <h4>make</h4> 
    </td> 
    <td align="center"> 
      <h4>year</h4> 
    </td>
  </tr> 
  <% 
  while (rset.next()) 
  {   
	 
    out.println("<tr>"); 
    out.println("<td align=\"center\">" + 
    rset.getString(1) + "</td><td align=\"center\"> " +
    rset.getString(2) + "</td><td align=\"center\"> " +
    rset.getString(3) + "</td><td align=\"center\"> " +
	rset.getString(4)+"</td>"); 
    out.println("</tr>"); 
  } 
  %> 
  </table>
  </div>

</body>
</html>