<%@page import="java.util.ArrayList"%>
<%@page import="beans.StudentSubject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="navigation.jsp"></jsp:include>


<table>
		<thead>
			<td>SNo.</td>
			<td>First Name</td>
			<td>Last Name</td>
		</thead>
		
		<%
				int serialNo=1;
					int size=0;
					int i=0;
					List<StudentSubject> studentList = new ArrayList<>();
					studentList = (ArrayList<StudentSubject>)request.getAttribute("studentList");
					size = studentList.size();
					while(size>0){
				%>
		<tr>
			<td> <%= serialNo %></td>
			<td><%= studentList.get(i).getFirstName() %></td>
			<td><%= studentList.get(i).getLastName() %></td>
		</tr>
	
	<%
		serialNo++;
		i++;
		size--;
			}
	%>

	</table>

</body>
</html>