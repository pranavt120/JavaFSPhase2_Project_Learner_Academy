<%@page import="beans.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.StudentSubject"%>
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

<jsp:include page="navigation.jsp"></jsp:include>
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>


<%
		String msg = (String)request.getAttribute("msg");
		if("deleted".equals(msg)){
	%>
		<p>Student deleted successfully!!</p>
	<%
		}else if("error".equals(msg)){
	%>
		<p>Could not delete Student. Please try again</p>
	<%
		}
	%>

<form method="get" action="${path}/addStudent">
	<button type="submit">Add Student</button>
</form>

<table>
		<thead>
			<td>SNo.</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Delete</td>
		</thead>
		<%
		int serialNo = 1;
			int size = 0;int i=0;
			List<Student> studentList = new ArrayList<>();
			if(!("null".equals((String)request.getAttribute("msg")))){
				studentList = (ArrayList<Student>)request.getAttribute("list");
				size = studentList.size();
				while(size > 0){
		%>
		<tr>
			<td><%= serialNo %></td>
			<td><%=studentList.get(i).getFirstName() %></td>
			<td><%= studentList.get(i).getLastName() %></td>
			<td><a href="${path}/deleteStudent?id=<%= studentList.get(i).getRollNo()%>">Delete</a></td>
		</tr>
		<%	serialNo++;
			i++;
			size--;
			}
			} %>
	</table>

</body>
</html>