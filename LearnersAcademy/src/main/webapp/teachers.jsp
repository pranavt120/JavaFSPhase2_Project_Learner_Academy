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
<title>Teacher List</title>

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
	
	h1,h3{
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

	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	<jsp:include page="navigation.jsp"></jsp:include>
	
	<%
		String msg = (String)request.getAttribute("msg");
		if("deleted".equals(msg)){
	%>
		<h3>Teacher deleted successfully!!</h3>
	<%
		}else if("error".equals(msg)){
	%>
		<h3>Could not delete Teacher. Please try again</h3>
	<%
		}
	%>
		<%
		String allocatemsg = (String)request.getAttribute("allocatemsg");
		if("added".equals(allocatemsg)){
	%>
		<h3>Subject Allocated Successfully</h3>
	<%
		}else if("error".equals(allocatemsg)){
	%>
		<h3>Something went wrong , Please try again</h3>
	<%
		}
	%>
	
	<div>
	<h1>Teacher List</h1>
		<form method="post" action="${path}/addTeacher">
		<button class="button" type="submit">Add Teacher</button>
	</form>
	
	<table>
		<thead>
			<td class="col head">SNo.</td>
			<td class="col head">First Name</td>
			<td class="col head">Last Name</td>
			<td class="col head">Delete Teacher</td>
			<td class="col head">Allocate Subjects</td>
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
			<td class="col"><%= serialNo %></td>
			<td class="col"><%= teacherList.get(i).getFirstName() %></td>
			<td class="col"><%= teacherList.get(i).getLastName() %></td>
			<td class="col"><a class="link" href="${path}/deleteTeacher?id=<%=teacherList.get(i).getId()%>">Delete</a></td>
			<td class="col"><a class="link" href="${path}/allocateTeacher?id=<%=teacherList.get(i).getId()%>">Allocate</a></td>
		</tr>
		<%
			serialNo++;
			i++;
			size--;
			}
		%>
	</table>
	</div>

	
</body>
</html>