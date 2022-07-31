<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="study.dao.DAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String uname=request.getParameter("username");
String contact=request.getParameter("contact");
String pswd=request.getParameter("password");

DAO dao = new DAO();
dao.SignUp(name,gender,contact,uname,pswd);

%>
<center><h2><i>Successfully Registered</i></h2>
 <br/> <p><a href="logout.jsp">Logout </a>.<br/>
 <br/><p><a href="logout.jsp">Logout </a>
 
</center>

</body>
</html>