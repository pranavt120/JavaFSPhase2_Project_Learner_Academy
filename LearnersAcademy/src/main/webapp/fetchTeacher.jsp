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
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>



	<form method="post" action="${path}/addClassAction">
		
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
			
		
		<button type="submit">Submit</button>
	</form>

</body>
</html>