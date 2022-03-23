<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Administrator Login</title>
	<style>
		.Header{
			text-align: center;
		}
		div{
			border: 2px solid black;
			width:50%;
			margin:auto auto;
		}
		
		.input{
			display:block;
			width: 90%;
			margin: 2% auto;
			padding: 10px;
		}
		
		.input-submit{
			display: block;
			width:50%;
			margin: 2% auto;
			padding: 10px;
		}
	</style>
  </head>
  <body>
  <c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
  
  <div>
  <h1 class="Header">Admin Login</h1>

  <% 
  	String msg = (String)request.getAttribute("msg");
  	if("invalid".equals(msg)){	
  %>
  	<h3>Invalid Credentials! Please try again</h3>
  <% } %>	

  	
	
	<form action= "${requestScope['jakarta.servlet.forward.context_path']}/loginAction" method="post">
		<input class="input" type="text" name="email" placeholder="Enter Email" required />
		<input class="input" type="password" name="password" placeholder="Enter Password" required />
		<input class="input-submit" type="submit" value="Submit">
		
	</form>
  </div>
  
  </body>
</html>