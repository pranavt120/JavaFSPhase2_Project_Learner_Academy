<%@page import="java.util.ArrayList"%>
<%@page import="beans.Subject"%>
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
		<td>Subject Name</td>
		<td>Teacher Allocated</td>
	</thead>
	<% int serialNo = 1;
		int size=0;
		int i = 0;
		
		List<Subject> subjectList = new ArrayList<>();
		subjectList = (ArrayList<Subject>)request.getAttribute("subjectList");
		size = subjectList.size();
		while(size>0){
			if(!("null".equals(request.getAttribute("null")))){
	%>
	
	<tr>
		<td><%= serialNo %></td>
		<td><%= subjectList.get(i).getName() %></td>
		<td><%= subjectList.get(i).getTeacher() %></td>
	</tr>
	<%
		serialNo++;
		i++;
		size--;
			}
		}
	%>
	
	</table>

</body>
</html>