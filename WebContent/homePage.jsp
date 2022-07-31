<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
            <%@page import="study.dao.DAO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="orange">
<fieldset>

 <br/> <p><a href="logout.jsp">Logout </a>.

<center>
	<% String name=(String)session.getAttribute("uname");
		
	if(name==null)
	{
	%>
	<p>Can't access without login</p>
	<jsp:include page = "homePage.jsp"></jsp:include>
	<%}
	else
	{%>

<h2><p>Welcome ${param.uname}</p></h2>
<h2><u>Set Your Appointment Date & Time</u></h2>
<form action="insert.jsp" method="post">
	 <b>Select Date :</b> <input type="date" name="apdate"/><br/>    
<br/><b>Select option :<br/>
					  </b> OFFICIAL<input type="radio" name="option" value="official"/><br/>
                      </b> PERSONAL<input type="radio" name="option" value="personal"/> <br/></br>
                      <b>Select time :</b>From <input type="time" name="from"/>To <input type="time" name="to"/><br/><br/>  
 <br/><input type="submit"  value="SAVE">       
</form>


<form action="list.jsp" />
<br/>
<% }%>
</center>

</fieldset>
<fieldset>
<center>
<br/><center>--:Select Date To Check Your Appointment:-- :<input type="date" name="d2" /> 
<input
type="submit" name="submit" value="Appointment List"></center>
</form>
</center>

</fieldset>



</body>
</html>