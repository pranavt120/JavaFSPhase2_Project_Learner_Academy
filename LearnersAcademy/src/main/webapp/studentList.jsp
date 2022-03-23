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
<title>Student List</title>
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
	
	
	<div>
		<h1>Student List</h1>
		<form method="get" action="${path}/addStudent">
			<button  class="button" type="submit">Add Student</button>
		</form>
	
	<table>
			<thead class="row">
				<td class="col head">SNo.</td>
				<td class="col head">First Name</td>
				<td class="col head">Last Name</td>
				<td class="col head">Delete</td>
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
			<tr class="row">
				<td class="col"><%= serialNo %></td>
				<td class="col"><%=studentList.get(i).getFirstName() %></td>
				<td class="col"><%= studentList.get(i).getLastName() %></td>
				<td class="col"><a class="link" href="${path}/deleteStudent?id=<%= studentList.get(i).getRollNo()%>">Delete</a></td>
			</tr>
			<%	serialNo++;
				i++;
				size--;
				}
				} %>
		</table>
			
	</div>

</body>
</html>