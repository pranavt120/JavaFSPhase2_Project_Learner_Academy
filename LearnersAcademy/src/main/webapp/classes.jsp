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
	
	<%	
		String msg = (String)request.getAttribute("msg");
		if("added".equals(msg)){
	%>
	<p> Class Added Successfully</p>
	<%
		}
		else if("error".equals(msg)){
	%>
	<p>Something went wrong, could not add Class, Please try again.</p>
	<%
		}
	%>
	<%
		String msgDel = (String)request.getAttribute("msg");
		if("deleted".equals(msgDel)){
	%>
		<p>Class deleted successfully!!</p>
	<%
		}else if("error".equals(msgDel)){
	%>
		<p>Could not delete Class. Please try again</p>
	<%
		}
	%>
	
	<form method="post" action="${path}/addClass">
		<button type="submit">Add Class</button>
	</form>
	
	<table>
		<thead>
			<td>SNo.</td>
			<td>class</td>
			<td>Delete Class</td>
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
			<td><a href="${path}/classesAction?name=<%=classList.get(i).getName()%>"><%= classList.get(i).getName() %></td>
			<td><a href="${path}/deleteClass?id=<%=classList.get(i).getId()%>" >Delete</a></td>
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