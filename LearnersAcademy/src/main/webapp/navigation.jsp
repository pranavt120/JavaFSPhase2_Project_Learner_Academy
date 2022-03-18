<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>
	
	<ul>
		
		<li><a href="${path}/adminHome">Home</a></li>
		<li><a href="${path}/students">Students</a></li>
		<li><a href="${path}/subjects">Subjects</a></li>
		<li><a href="${path}/teachers">Teachers</a></li>
		<li><a href="${path}/classes">Classes</a></li>
	
	</ul>

</body>
</html>