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
				<h3 class="mt-4 mb-4">Company Profiles</h3>
				<a href="/company/create"
					class="btn btn-secondary pull-right btnAddNew"><span
					class="fa fa-plus-circle mr-2"></span>Add New</a>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Company Name</th>
						<th>Location</th>
						<th>Contact Person</th>
						<th>Contact Email</th>
						<th>Website</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${companyList}" var="company">
						<tr>
							<th scope="row"><c:out value="${company.sid}"></c:out></th>
							<td><c:out value="${company.name}"></c:out></td>
							<td><c:out value="${company.address}"></c:out>,&nbsp<c:out
									value="${company.city}"></c:out>,&nbsp<c:out
									value="${company.country}"></c:out></td>
							<td><c:out value="${company.contactFirstName}"></c:out>,&nbsp<c:out
									value="${company.contactLastName}"></c:out></td>
							<td><a href="mailto:${company.contactEmailId}"
								target="_blank"><c:out value="${company.contactEmailId}"></c:out></a></td>
							<td><a href="${company.website}" target="_blank"><c:out
										value="${company.website}"></c:out></a></td>
							<td>
								<button
									class="btn btn-primary btn-sm jobdetail btnCompanyDetails"
									data-id="${company.sid}">Details</button> <%-- 								<form:input path="button" cssClass="btn btn-primary btn-sm jobdetail btnCompanyDetails" --%>
								<%-- 									data-id="${company_sid}" type="button" text="Details"></form:input> --%>
								<a href="/company/create?companyId=${company.sid}"
								class="btn btn-primary btn-sm jobdetail"
								data-id="${company.sid}">Edit</a>
							</td>
							<!-- <td><c:out value="${company.name}"></c:out></td> -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a id="back-to-top" href="#" class="btn btn-info btn-lg back-to-top">
				<span class="fa fa-arrow-circle-up"></span>
			</a>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>