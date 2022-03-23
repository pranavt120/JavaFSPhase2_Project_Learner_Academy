<%@page import="java.util.ArrayList"%>
<%@page import="beans.StudentSubject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students Enrolled</title>
<style type="text/css">
body{
	padding:0;
	margin-top:0;
}

	div{
		position:relative;
		left:18%;
		width:80%;
	}
	
	h1{
		text-align: center;
	}
	
	div>table{
		
		border:1px solid grey;
		width:100%;
		
	}
	
	.col{
		text-align: center;
		padding: 10 20px;
		background-color: rgb(238, 238, 238 )
		
	}
	
	.head{
		background-color: rgb(0,0,0);
		color:white;
	}
	
	
</style>
</head>
<body>

<jsp:include page="navigation.jsp"></jsp:include>


<div>
	<h1>Students Enrolled</h1>
	<table>
		<thead>
			<td class="col head">SNo.</td>
			<td class="col head">First Name</td>
			<td class="col head">Last Name</td>
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
			<td class="col"> <%= serialNo %></td>
			<td class="col"><%= studentList.get(i).getFirstName() %></td>
			<td class="col"><%= studentList.get(i).getLastName() %></td>
		</tr>
	
	<%
		serialNo++;
		i++;
		size--;
			}
	%>

	</table>
	
</div>


</body>
</html>