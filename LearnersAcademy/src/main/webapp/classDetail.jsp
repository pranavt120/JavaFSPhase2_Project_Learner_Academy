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
<title>Class Details</title>
<style type="text/css">

body{
	padding:0;
	margin-top:0;
}

	div{
		position:relative;
		left:18%;
		width:80%;
	}
	
	h1{
		text-align: center;
	}
	
	div>table{
		
		border:1px solid grey;
		width:100%;
		
	}
	
	.col{
		text-align: center;
		padding: 10 20px;
		background-color: rgb(238, 238, 238 )
		
	}
	
	.head{
		background-color: rgb(0,0,0);
		color:white;
	}
	
	.button{
		padding: 2px 50px;
		margin: 5px;
	}
	
	.button:hover{
		background-color: black;
		color:white;
		cursor: pointer;
	}
	
	.link{
		text-decoration: none;
		
	}

</style>
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
	
	<div>
		<h1><%= classReportList.get(i).getName()%></h1>
	
	<table>
		<thead>
			<td class="col head">SNO.</td>
			<td class="col head">Teachers</td>
			<td class="col head">Subjects</td>
		</thead>
		
		<%
			while(size>0){
		%>
		<tr>
			<td class="col"><%=serialNo %></td>
			<td class="col"><%= classReportList.get(i).getTeacher() %></td>
			<td class="col"><%= classReportList.get(i).getSubject() %></td>
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
		<button class="button" type="submit">Get Student List</button>
	</form>
	
	</div>
	
	

</body>
</html>