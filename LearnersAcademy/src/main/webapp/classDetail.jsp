<%@page import="java.util.ArrayList"%>
<%@page import="beans.ClassReport"%>
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
	<c:set var="path" scope="session" value="${requestScope['jakarta.servlet.forward.context_path']}"></c:set>
	<%
	int serialNo =1;
	int size=0;
	int i = 0;
	List<ClassReport> classReportList = new ArrayList<>();
	classReportList = (ArrayList<ClassReport>)request.getAttribute("classReportList");
	size = classReportList.size(); 
	%>
	
	<h2><%= classReportList.get(i).getName()%></h2>
	
	<table>
		<thead>
			<td>SNO.</td>
			<td>Teachers</td>
			<td>Subjects</td>
		</thead>
		
		<%
			while(size>0){
		%>
		<tr>
			<td><%=serialNo %></td>
			<td><%= classReportList.get(i).getTeacher() %></td>
			<td><%= classReportList.get(i).getSubject() %></td>
		</tr>
		
		<%
			serialNo++;
			i++;
			size--;
			}
		%>
	</table>
	<br>
	
	<form method="post" action="${path}/studentsEnrolled?class=<%= classReportList.get(0).getClassId()%>">
		<button type="submit">Get Student List</button>
	</form>

</body>
</html>