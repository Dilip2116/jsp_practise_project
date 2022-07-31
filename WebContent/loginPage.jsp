<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@page import="study.dao.DAO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="skyblue">
<fieldset>
 <br/> <p><a href="logout.jsp">Logout </a>.
<center>
<h1><u>FOR APPOINTMENT LOG-IN</u></h1>

<form method="post">
<br/>
<br/>
<b>UserName :</b> <input type="text" name="uname"  required ><br/>    
<br/><b>Password: </b><input type="Password" name="pass" required> <br/>    
 <br/><input type="submit"  value="LogIn">&emsp;<input type="reset" ><br/>
 <br/> <p><a href="signup.html">click here to register </a>.
 </form>
 </center>
</fieldset>




<%
	String uname =request.getParameter("uname");
	String pass =request.getParameter("pass");
	DAO dao = new DAO();
	session.setAttribute("uname", uname);
	if(uname!=null && pass!=null)
	{
 	if(dao.SignIn(uname, pass))
		{%>
	
		<jsp:forward page="homePage.jsp">
		<jsp:param value="${username}" name="vname"/>
		</jsp:forward>
		
	<%}
 	else{
 %>
 <br/>
 <br/>
 <center><font size="10" color="red"><i>INVALID USER --Enter Valid details</i></font>
 </center>
 	<%}
	} %>
	
  	
</body>
</html>