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
				<h3 class="mt-4 mb-4">Create/Edit Job Posting</h3>
			</div>
			<form:form commandName="jobGroup" action="/job/createGroup" method="POST"
				cssClass="addJob">
				<div class="modal-body">
					<div class="col-9">
						<form:input path="sid" class="form-control" type="hidden"
							value="${jobGroup.sid}" id="hdnSid" />
					</div>
					<div class="form-group row">
						<label for="textJobDesc" class="col-3 col-form-label">Job
							Group Name:</label>
						<div class="col-9">
							<form:input path="description" class="form-control" type="text"
								value="${jobGroup.description}" id="textJobDesc" />
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