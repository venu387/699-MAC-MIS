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
<link rel="icon" href="/assets/img/uw_logo_blue.png">

<title>MAC - MIS</title>
<jsp:include page="../shared/styles.jsp" />
</head>
<body>
	<jsp:include page="../shared/navbar.jsp" />
	<div class="container">
		<div class="container-fluid">
			<div>
				<h3 class="mt-4 mb-4">Create/Edit Student Internship Details</h3>
			</div>
			<hr />
			<form:form commandName="internship" action="/admin/addstudentinternship"
				method="POST" cssClass="addStudentInternship">
				<div class="col-9">
					<form:input path="sid" class="form-control" type="hidden"
						value="${internship.sid}" id="textStudentID"></form:input>
				</div>
				<div class="form-group row">
					<label for="studentDdl" class="col-3 col-form-label">Student:</label>
					<div class="col-7">
						<form:select path="member.sid" class="custom-select form-control"
							id="studentDdl" required="required">
							<option value="">--Select--</option>
							<c:forEach items="${studentList}" var="student">
								<c:choose>
									<c:when test="${student.sid == internship.member.sid}">
										<form:option selected="selected" value="${student.sid}">${student.firstName} ${student.lastName} (${student.studentId})</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="${student.sid}">${student.firstName} ${student.lastName} (${student.studentId})</form:option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<div class="form-group row">
					<label for="jobDdl" class="col-3 col-form-label">Job:</label>
					<div class="col-7">
						<form:select path="job.sid" class="custom-select form-control"
							id="jobDdl" required="required">
							<option value="">--Select--</option>
							<c:forEach items="${jobList}" var="job">
								<c:choose>
									<c:when test="${job.sid == internship.job.sid}">
										<form:option selected="selected" value="${job.sid}">${job.company.name} (${job.title})</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="${job.sid}">${job.company.name} (${job.title})</form:option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>