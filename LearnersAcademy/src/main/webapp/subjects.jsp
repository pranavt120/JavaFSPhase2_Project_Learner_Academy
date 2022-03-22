<%@page import="beans.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.SubjectTeacher"%>
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
		<p>Subject deleted successfully</p>
		
	<%
		}else if ("error".equals(msg)){
	%>
		<p>Could not delete subject, Please try again</p>
	<% 
		}
	%>	


	<form method="get" action="${path}/addSubject">
    	<button type="submit">Add Subject</button>
	</form>

	
	<table>
	<thead>
		<td>SNo.</td>
		<td>Subject Name</td>
		<td>Delete Subject</td>
	</thead>
	<%
	int serialNo = 1;
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
		<td><a href="${path}/deleteSubject?id=<%=subjectList.get(i).getId()%>">Delete</a></td>
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