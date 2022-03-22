<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Subject</title>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>

	<%	
		String msg = (String)request.getAttribute("msg");
		if("added".equals(msg)){
	%>
	<p> Student Added Successfully</p>
	<%
		}
		else if("error".equals(msg)){
	%>
	<p>Something went wrong, could not add Student, Please try again.</p>
	<%
		}
	%>

	<form method="post" action="${path}/addStudentAction">
		<input type="text" name="firstName" placeholder="Enter First Name" required />
		<input type="text" name="lastName" placeholder="Enter Last Name" required />
		
		<button type="submit">Submit</button>
	</form>

</body>
</html>