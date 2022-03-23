<%@page import="beans.Teacher"%>
<%@page import="beans.Student"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.SubjectTeacher"%>
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
<title>Select Teacher</title>
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
	<h1>Select Teachers</h1>
		<form method="post" action="${path}/addClassAction">
		
		<div class="select">
			<%
			Map<Subject,List<SubjectTeacher>> map = new HashMap<>();
			map = (HashMap<Subject,List<SubjectTeacher>>)request.getAttribute("map");
			for(Subject key : map.keySet()){
		%>
			
			<label for="Teacher" >Teacher Available for  <%=key.getName()%>:</label><br>
			<select name="teacherAlloted">
			<%
				for( SubjectTeacher item: map.get(key)){
					
			%>
				<option value="<%=item.getTeacherId()%>,<%=key.getId()%>"><%= item.getTeacher() %></option>
			<%
				}
			%>
			</select><br><br>
			<% 
			}
			%>
			
		
		<button class="button" type="submit">Submit</button>
	</form>
		</div>
		
		
	</div>

	

</body>
</html>