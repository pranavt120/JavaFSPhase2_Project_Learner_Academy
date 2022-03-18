<%@page import="java.util.ArrayList"%>
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
	
	<table>
		<thead>
			<td>SNo.</td>
			<td>class</td>
		</thead>
		
		<% int serialNo = 1;
			int size = 0;
			int i = 0;
			List<beans.Class> classList = new ArrayList<>();
			classList = (ArrayList<beans.Class>)request.getAttribute("classList");
			size = classList.size();
			
			while(size>0){
		%>
		<tr>
			<td><%= serialNo %></td>
			<td><a href="${path}/classesAction?name=<%=classList.get(i).getName() %>"><%= classList.get(i).getName() %></td>
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