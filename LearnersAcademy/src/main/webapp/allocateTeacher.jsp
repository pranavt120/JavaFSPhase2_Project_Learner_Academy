<%@page import="beans.Subject"%>
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
<title>Allocate Teacher</title>
<style type="text/css">
		body{
	padding:0;
	margin-top:0;
}

	div.main{
		position:relative;
		left:30%;
		width:60%;
		border: 1px solid black;
		margin-top: 15%;
	}
	
	div>table{
		
		border:1px solid grey;
		width:95%;
		margin: 0 auto;
		
	}
	
	h1{
		text-align: center;
	}
	
	.input{
		display:block;
		width:70%;
		margin: 3px auto;
		padding: 3px 10px;
	}
	
	.button{
		width:20%;
		margin: 10px 36%;
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
	
	.button:hover{
		background-color: black;
		color:white;
		cursor: pointer;
	}
	.inside-form{
		width:95%;
		padding 5px 20px;
		margin: 2% auto;
	}
	
	.inside-form>p{
		font-size: 20px;
		text-align: center;
	}
	.inside-form>form{
		font-size:20px;
		text-align: center;
	}

</style>
</head>
<body>

	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	<jsp:include page="navigation.jsp"></jsp:include>
	
	<div class="main">
		<h1>Allot Subjects</h1>
		<table>
		<thead>
			<td class="col head">SNo.</td>
			<td class="col head">Subjects Allocated</td>
		</thead>
	<%
		int size=0,i=0,serialNo=1;
		List<Subject> allocatedSubject = new ArrayList<>();
		List<Subject> subjectList =  new ArrayList<>();
		allocatedSubject = (ArrayList<Subject>)request.getAttribute("allocatedSubjects");
		subjectList = (ArrayList<Subject>)request.getAttribute("subjectList");
		size = allocatedSubject.size();
		while(size>0){
	%>
		<tr>
			<td class="col"><%= serialNo %></td>
			<td class="col"><%=allocatedSubject.get(i).getName() %></td>
		</tr>
	<%
		size--;
		serialNo++;
		i++;
		}
	%>
	</table>
	
	<div class="inside-form">
		<p>Choose subject to Allocate</p>
		<form method="post" action="${path}/allotSubject">
			<label for="choose">Choose:</label>
			<select name="subjectChosen">
			<%
				size = subjectList.size();
				i = 0;
				while(size>0){
			%>
				<option value="<%=session.getAttribute("teacherId")%>,<%=subjectList.get(i).getId()%>"><%=subjectList.get(i).getName() %></option>
				
			<%
				size--;
				i++;
				}
			%>
			</select>
			<button class="button" type="submit">submit</button>
		</form>
	</div>
	
	</div>
	
	
	
</body>
</html>