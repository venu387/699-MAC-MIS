<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>MAC - MIS</title>

<jsp:include page="../shared/styles.jsp" />
</head>
<body>
	<jsp:include page="../shared/navbar.jsp" />
	<div class="container">
		<div class="container-fluid">
			<div>
				<h3 class="mt-4 mb-4">Student List</h3>
				<a href="/member/addstudent"
					class="btn btn-secondary pull-right btnRegNew"><span
					class="fa fa-plus-circle mr-2"></span>Register New</a>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Student #</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Email ID</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${studentsList}" var="student">
						<tr>
							<th scope="row"><c:out value="${student.studentId}"></c:out></th>
							<td><c:out value="${student.firstName}"></c:out></td>
							<td><c:out value="${student.middleName}"></c:out></td>
							<td><c:out value="${student.lastName}"></c:out></td>
							<td><c:out value="${student.username}"></c:out></td>
							<td><a href="mailto:${student.emailId}" target="_blank"><c:out value="${student.emailId}"></c:out></a></td>
							<td>
								<button class="btn btn-primary btn-sm jobdetail btnStudentDetails"
									data-id="${student.sid}">Details</button> <a
								href="/member/addstudent?memberId=${student.sid}"
								class="btn btn-primary btn-sm jobdetail" data-id="${student.sid}">Edit</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a id="back-to-top" href="#" class="btn btn-info btn-lg back-to-top"
				role="button" title="" data-toggle="tooltip" data-placement="left"><span
				class="fa fa-arrow-circle-up"></span></a>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>