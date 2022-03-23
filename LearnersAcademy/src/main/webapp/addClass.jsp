<%@page import="java.util.ArrayList"%>
<%@page import="beans.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Class</title>
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
		margin-top: 9%;
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
		width:30%;
		margin: 5px 36%;
	}
	.select{
		width:70%;
		margin: 0 auto;
	}
	.select>select{
		width:100%;
		margin: 3px auto;
		padding: 3px 10px;
	}

</style>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>



	<div class="main">
		<h1>Add Class</h1>
		<form method="post" action="${path}/selectTeacher">
		<input class="input type="text"  name="className" placeholder="Enter Class Name" required />
		<br><br>
		<div class="select">
			<label for="Subject" >Select Subject</label><br>
			<select name="subjectChosen1">
			<%
				List<Subject> subjectList = new ArrayList<>();
				subjectList = (ArrayList<Subject>)request.getAttribute("subjectList");
				int size = subjectList.size();
				int i=0;
				while(size>0){
			%>
				<option><%=subjectList.get(i).getName() %></option>
			<%
				size--;
				i++;
				}
				%>
			</select>
		
			<br><br>
				<label for="Subject1" >Select Subject</label><br>
				<select name="subjectChosen2" required>
				<%
					size = subjectList.size();
					i=0;
					while(size>0){
				%>
					<option><%=subjectList.get(i).getName() %></option>
				<%
					size--;
					i++;
					}
					%>
				</select>	
				
				<br><br>
				<label for="Subject3" >Select Subject</label><br>
				<select name="subjectChosen3" required>
				<%
					size = subjectList.size();
					i=0;
					while(size>0){
				%>
					<option><%=subjectList.get(i).getName() %></option>
				<%
					size--;
					i++;
					}
					%>
				</select>	<br><br>
		</div>
			
		
		<button class="button" type="submit">Submit</button>
	</form>
	
	</div>

	

</body>
</html>