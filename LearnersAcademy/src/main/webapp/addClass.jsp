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
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<c:set var = "path" scope = "session" value = "${requestScope['jakarta.servlet.forward.context_path']}"/>



	<form method="post" action="${path}/selectTeacher">
		<input type="text"  name="className" placeholder="Enter Class Name" required />
		<br><br>
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
		
		<button type="submit">Submit</button>
	</form>

</body>
</html>