<%@page import="beans.Subject"%>
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
<title>Allocate Teacher</title>
</head>
<body>

	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	<jsp:include page="navigation.jsp"></jsp:include>
	
	
	<table>
		<thead>
			<td>SNo.</td>
			<td>Subjects Allocated</td>
		</thead>
	<%
		int size=0,i=0,serialNo=1;
		List<Subject> allocatedSubject = new ArrayList<>();
		List<Subject> subjectList =  new ArrayList<>();
		allocatedSubject = (ArrayList<Subject>)request.getAttribute("allocatedSubjects");
		subjectList = (ArrayList<Subject>)request.getAttribute("subjectList");
		size = allocatedSubject.size();
		while(size>0){
	%>
		<tr>
			<td><%= serialNo %></td>
			<td><%=allocatedSubject.get(i).getName() %></td>
		</tr>
	<%
		size--;
		serialNo++;
		i++;
		}
	%>
	</table>
	<p>Choose subject to Allocate</p>
	<form method="post" action="${path}/allotSubject">
		<label for="choose">Choose:</label>
		<select name="subjectChosen">
		<%
			size = subjectList.size();
			i = 0;
			while(size>0){
		%>
			<option value="<%=session.getAttribute("teacherId")%>,<%=subjectList.get(i).getId()%>"><%=subjectList.get(i).getName() %></option>
			
		<%
			size--;
			i++;
			}
		%>
		</select>
		<button type="submit">submit</button>
	</form>
</body>
</html>