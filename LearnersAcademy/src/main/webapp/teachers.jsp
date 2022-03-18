<%@page import="java.util.ArrayList"%>
<%@page import="beans.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="navigation.jsp"></jsp:include>

	
	<table>
		<thead>
			<td>SNo.</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Subjects</td>
			
		</thead>
		<%
			int serialNo = 1;
			int size = 0;
			int i = 0;
			List<Teacher> teacherList = new ArrayList<>();
			teacherList = (ArrayList<Teacher>)request.getAttribute("teacherList");
			size = teacherList.size();
			while(size>0){
		%>
		<tr>
			<td><%= serialNo %></td>
			<td><%= teacherList.get(i).getFirstName() %></td>
			<td><%= teacherList.get(i).getLastName() %></td>
			<td><%= teacherList.get(i).getSubjects() %></td>
		</tr>
		<%
			serialNo++;
			i++;
			size--;
			}
		%>
	</table>
</body>
</html>