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
				<h3 class="mt-4 mb-4">Available Jobs</h3>
				<%
					if (session.getAttribute("username") != null && session.getAttribute("type") != "3") {
				%>
				<a href="/job/create" class="btn btn-secondary pull-right btnAddNew"><span
					class="fa fa-plus-circle mr-2"></span>Add New</a>
				<%
					}
				%>
				<!-- <button type="button" class="btn btn-secondary pull-right btnAddNew" data-toggle="modal" data-target="#jobEditAddModal"><span class="fa fa-plus-circle mr-2"></span>Add New</button> -->
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Job Title</th>
						<th>Company</th>
						<th>Location</th>
						<th>Salary</th>
						<th>Contact</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jobList}" var="job">
						<tr>
							<th scope="row"><c:out value="${job.sid}"></c:out></th>
							<td><c:out value="${job.title}"></c:out></td>
							<td><c:out value="${job.company.name}"></c:out></td>
							<td><c:out value="${job.company.city}"></c:out></td>
							<td><c:out value="${job.salary}"></c:out></td>
							<td><a href="mailto:${job.contactEmailId}" target="_blank"><c:out value="${job.contactEmailId}"></c:out></a></td>
							<td>
								<button class="btn btn-primary btn-sm jobdetail btnJobDetails"
									data-id="${job.sid}">Details</button> <a
								href="/job/create?jobId=${job.sid}"
								class="btn btn-primary btn-sm jobdetail" data-id="${job.sid}">Edit</a>
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