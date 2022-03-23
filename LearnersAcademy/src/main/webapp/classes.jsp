<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class Listt</title>
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

	<jsp:include page="navigation.jsp"></jsp:include>
	
	
	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	
	<%	
		String msg = (String)request.getAttribute("msg");
		if("added".equals(msg)){
	%>
	<h3> Class Added Successfully</h3>
	<%
		}
		else if("error".equals(msg)){
	%>
	<h3>Something went wrong, could not add Class, Please try again.</h3>
	<%
		}
	%>
	<%
		String msgDel = (String)request.getAttribute("msg");
		if("deleted".equals(msgDel)){
	%>
		<h3>Class deleted successfully!!</h3>
	<%
		}else if("error".equals(msgDel)){
	%>
		<h3>Could not delete Class. Please try again</h3>
	<%
		}
	%>
	
	<div>
		<h1>Class List</h1>
		<form method="post" action="${path}/addClass">
		<button class="button type="submit">Add Class</button>
	</form>
	
	<table>
		<thead>
			<td class="col head">SNo.</td>
			<td class="col head">class</td>
			<td class="col head">Delete Class</td>
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
			<td class="col"><%= serialNo %></td>
			<td class="col"><a href="${path}/classesAction?name=<%=classList.get(i).getName()%>"><%= classList.get(i).getName() %></td>
			<td class="col"><a href="${path}/deleteClass?id=<%=classList.get(i).getId()%>" >Delete</a></td>
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