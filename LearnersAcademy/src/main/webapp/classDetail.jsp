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
			<td>Students Enrolled</td>
		</thead>
		
		<%
			while(size>0){
		%>
		<tr>
			<td><%=serialNo %></td>
			<td><%= classReportList.get(i).getTeacher() %></td>
			<td><%= classReportList.get(i).getSubject() %></td>
			<td><a href="${path}/studentsEnrolled?&subject=<%= classReportList.get(i).getSubject() %>">Student List </a></td>
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