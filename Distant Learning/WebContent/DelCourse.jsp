<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dl.dao.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DELETE COURSE</title>

</head>
<body background="c1.jpg" text="maroon" link="yellow" vlink="red">
<img alt="Search" src="courses.jpg">
<center>

<font size="6.5" face="Comic Sans MS"><strong>Enter Course Name to search:</strong></font>
<br>
<br>
<form action="DelCourse.jsp" method="post">
<input type="text" name="name">
<br>
<input type="submit" value="SEARCH">
</form>

<%

if(request.getParameter("name")!=null)
{
	String name=request.getParameter("name");
	out.println("<h3><font size=12 color=green>"+name+"</font></h3>");
	String sql="SELECT * FROM COURSE WHERE NAME=?";
	DLDAO obj=new DLDAO();
	ResultSet rs=obj.FetchCourse(sql,name);


%>
<form action="deletecourse" method="post">
<table border="2">
			<tr>
				
				<th>NAME</th>
           		<th>DURATION</th>
            	<th>DETAILS</th>
            	<th>TRAINER</th>
            	<th>ELIGIBILITY CRITERIA</th>
            	<th>ASSIGNMENTS</th>
            	<th>CERTIFICATION</th>
            </tr>
        <%while(rs.next()){ %>
	
            <tr>
				<td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
                
            </tr>
         
</table>
<br>
<input type="text" name="R" placeholder="Confirm Course Name to delete">
<br>
<input type="submit" value="CONFIRM">
 </form>
 
<%} }%>
<br>
<a  href="DelCourse.jsp">FIND ANOTHER COURSE</a>
</center>

</body>
</html>