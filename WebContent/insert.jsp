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
	String name=(String)session.getAttribute("uname");
     String date=request.getParameter("apdate");
	String choice=request.getParameter("option");
	String ftime=request.getParameter("from");
	String ttime=request.getParameter("to");

		DAO dao=new DAO();
dao.addAppoint(name, date, choice, ftime, ttime);
%>

<jsp:include page = "homePage.jsp"></jsp:include>

</body>
</html>