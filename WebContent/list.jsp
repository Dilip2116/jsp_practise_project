<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@page import="study.dao.DAO" import="java.sql.ResultSet"
               import ="java.sql.SQLException"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "homePage.jsp"></jsp:include>
<% 
	String uname=(String)session.getAttribute("uname");
	String datee=request.getParameter("d2");
	DAO dao =new DAO();
	if(datee!=null)
	{
	ResultSet rs=dao.getRows("select choice,ftime,time from appointment where username='"+uname+"' and ap_date='"+datee+"'");
	%>
			<center><u><h2>--- UPCCOMING Appointments ---</h2></u>
			<center><h3>USERNAME: <%=uname %>   </h3><h3>DATE: <%=datee %></h3></center>
			<table border=1 >
			<th>Purpose</th>
			<th>Start-Time</th>
			<th>End-Time</th>

<% 
			while(rs.next())
				{
		
					String c=rs.getString(1);
					String d=rs.getString(2);
					String e=rs.getString(3);
					
	%>
				<tr><td><%=c %></td><td><%=d %></td><td><%=e %></td></tr>
				
			<%}
}%>
			
		</table>
		</center>
	
</body>
</html>