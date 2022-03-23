<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Teacher</title>
<style type="text/css">
	body{
	padding:0;
	margin-top:0;
}

	div{
		position:relative;
		left:30%;
		width:60%;
		border: 1px solid black;
		margin-top: 15%;
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

</style>
</head>
<body>

	<jsp:include page="navigation.jsp"></jsp:include>
	<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	

	<%
		String msg = (String)request.getAttribute("msg");
		if("added".equals(msg)){
	%>
		<p>Teacher added Successfully</p>
		
	<%
		}
		else if("error".equals(msg)){
	%>
		<p>Could Not add Teacher, Please try again!!</p>
	<%
	}
	%>
	<div>
		<h1>Add Teacher</h1>
		<form method="post" action="${path}/addTeacherAction">
		<input class="input" type="text" name="firstName" placeholder="Enter First Name" required/>
		<input class="input type="text" name="lastName" placeholder="Enter Last Name" required/>
		<button class="button type="submit">Submit</button>
	</form>
	</div>
	

</body>
</html>