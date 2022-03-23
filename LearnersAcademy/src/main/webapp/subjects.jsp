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
<title>Subjects</title>
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

	
	<div>
		<h1>Subjects</h1>
		<form method="get" action="${path}/addSubject">
    	<button class="button" type="submit">Add Subject</button>
	</form>

	
	<table>
	<thead>
		<td class="col head">SNo.</td>
		<td class="col head">Subject Name</td>
		<td class="col head">Delete Subject</td>
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
		<td class="col"><%= serialNo %></td>
		<td class="col"><%= subjectList.get(i).getName() %></td>
		<td class="col"><a href="${path}/deleteSubject?id=<%=subjectList.get(i).getId()%>">Delete</a></td>
	</tr>
	<%
		serialNo++;
		i++;
		size--;
			}
		}
	%>
	
	</table>
	
	</div>
	
	

</body>
</html>