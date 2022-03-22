<%@page import="java.util.ArrayList"%>
<%@page import="beans.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	<jsp:include page="navigation.jsp"></jsp:include>
	
	<%
		String msg = (String)request.getAttribute("msg");
		if("deleted".equals(msg)){
	%>
		<p>Teacher deleted successfully!!</p>
	<%
		}else if("error".equals(msg)){
	%>
		<p>Could not delete Teacher. Please try again</p>
	<%
		}
	%>
		<%
		String allocatemsg = (String)request.getAttribute("allocatemsg");
		if("added".equals(allocatemsg)){
	%>
		<p>Subject Allocated Successfully</p>
	<%
		}else if("error".equals(allocatemsg)){
	%>
		<p>Something went wrong , Please try again</p>
	<%
		}
	%>

	<form method="post" action="${path}/addTeacher">
		<button type="submit">Add Teacher</button>
	</form>
	
	<table>
		<thead>
			<td>SNo.</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Delete Teacher</td>
			<td>Allocate Subjects</td>
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
			<td><a href="${path}/deleteTeacher?id=<%=teacherList.get(i).getId()%>">Delete</a></td>
			<td><a href="${path}/allocateTeacher?id=<%=teacherList.get(i).getId()%>">Allocate</a></td>
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