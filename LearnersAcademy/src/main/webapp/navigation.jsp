<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	
	body{
		padding-left:0;
		margin-left:0;
	}
	
	ul{
		background-color: rgba(0, 0, 0,1);
		list-style-type: none;
		border-right: 1px solid black;
		width: 14%;
		height:100%;
		position:fixed;
		top:0;
		left:0;
		padding-top:0;
		margin-top:0;
	}
	
	ul>li{
	padding: 10px;
	margin-left: auto;
	margin-top:10%;
	
	}
	
	ul>li>a{
		 
		  text-decoration: none;
		  font-size: 20px;
		  color: white;
		  display: block;
		  
	}
	
	ul>li>a:hover{
		color: rgba(234, 236, 238,0.5);	
	}
	

</style>
</head>
<body>

	
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	
	<ul>
		
		<li><a href="${path}/adminHome">Home</a></li>
		<li><a href="${path}/students">Students</a></li>
		<li><a href="${path}/subjects">Subjects</a></li>
		<li><a href="${path}/teachers">Teachers</a></li>
		<li><a href="${path}/classes">Classes</a></li>
		<li><a href="${path}/logout">Logout</a></li>
	</ul>

</body>
</html>