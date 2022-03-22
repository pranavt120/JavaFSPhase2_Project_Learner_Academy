<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Administrator Login</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <h1>Admin Login</h1>

 
  <% 
  	String msg = (String)request.getAttribute("msg");
  	if("invalid".equals(msg)){	
  %>
  	<h3>Invalid Credentials! Please try again</h3>
  <% } %>	

  	
	
	<form action= "${requestScope['jakarta.servlet.forward.context_path']}/loginAction" method="post">
		<input type="text" name="email" placeholder="Enter Email" required />
		<input type="password" name="password" placeholder="Enter Password" required />
		<input type="submit" value="Submit">
		
	</form>
  </body>
</html>