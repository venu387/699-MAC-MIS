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
				<h3 class="mt-4 mb-4">Create/Edit Faculty Profile</h3>
			</div>
			<form:form commandName="student" action="/member/addfaculty"
				method="POST" cssClass="addStudent">
				<h4 class="mb-4">General Information</h4>
				<div class="col-9">
					<form:input path="sid" value="${student.sid}" class="form-control"
						type="hidden"></form:input>
				</div>
				<div class="col-9">
					<form:input path="type" value="${student.type}"
						class="form-control" type="hidden"></form:input>
				</div>
				<div class="form-group row">
					<label for="textSFName" class="col-3 col-form-label">First
						Name:</label>
					<div class="col-9">
						<form:input path="firstName" value="${student.firstName}"
							class="form-control" type="text" id="textSFName" placeholder="" required="required"></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textSMName" class="col-3 col-form-label">Middle
						Name:</label>
					<div class="col-9">
						<form:input path="middleName" value="${student.middleName}"
							class="form-control" type="text" id="textSLName" placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textSLName" class="col-3 col-form-label">Last
						Name:</label>
					<div class="col-9">
						<form:input path="lastName" value="${student.lastName}"
							class="form-control" type="text" id="textSLName" placeholder="" required="required"></form:input>
					</div>
				</div>
				<c:choose>
					<c:when test="${isMyProfile == 1}">
						<div class="form-group row disabled">
							<label for="textSEmail" class="col-3 col-form-label">Email
								ID (Username):</label>
							<div class="col-9">
								<form:input path="emailId" value="${student.emailId}"
									class="form-control" type="text" id="textSEmail" placeholder="" required="required"></form:input>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-group row">
							<label for="textSEmail" class="col-3 col-form-label">Email
								ID (Username):</label>
							<div class="col-9">
								<form:input path="emailId" value="${student.emailId}"
									class="form-control" type="text" id="textSEmail" placeholder="" required="required"></form:input>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="form-group row">
					<label for="textSPassword" class="col-3 col-form-label">Password:</label>
					<div class="col-9">
						<form:input path="password" value="${student.password}"
							class="form-control" type="password" id="textSPassword"
							placeholder="" required="required"></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textTel" class="col-3 col-form-label">Telephone:</label>
					<div class="col-9">
						<form:input path="telephone" value="${student.telephone}"
							class="form-control" type="tel" id="textTel" placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyAddress" class="col-3 col-form-label">Address:</label>
					<div class="col-9">
						<form:input path="address" value="${student.address}"
							class="form-control" type="text" id="textCompanyAddress"
							placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCity" class="col-3 col-form-label">City:</label>
					<div class="col-9">
						<form:input path="city" class="form-control" type="text"
							value="${student.city}" id="textCompanyCity" placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyProvince" class="col-3 col-form-label">Province:</label>
					<div class="col-9">
						<form:input path="province" class="form-control" type="text"
							value="${student.province}" id="textCompanyProvince"
							placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyPostalCode" class="col-3 col-form-label">Postal
						Code:</label>
					<div class="col-9">
						<form:input path="postalCode" class="form-control" type="text"
							value="${student.postalCode}" id="textCompanyPostalCode"
							placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCountry" class="col-3 col-form-label">Country:</label>
					<div class="col-9">
						<form:input path="country" class="form-control" type="text"
							value="${student.country}" id="textCompanyCountry" placeholder=""></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textSFName" class="col-3 col-form-label">Gender:</label>
					<div class="col-9">
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.gender == 1}">
										<form:radiobutton path="gender" class="form-check-input"
											name="inlineRadioOptions_Gender" id="rdomale"
											checked="checked" value="1"></form:radiobutton>
								Male
									</c:when>
									<c:otherwise>
										<form:radiobutton path="gender" class="form-check-input"
											name="inlineRadioOptions_Gender" id="rdomale" value="1"></form:radiobutton>
								Male
									</c:otherwise>
								</c:choose>
							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.gender == 2}">
										<form:radiobutton path="gender" class="form-check-input"
											name="inlineRadioOptions_Gender" id="rdofemale"
											checked="checked" value="2"></form:radiobutton>
								Female
									</c:when>
									<c:otherwise>
										<form:radiobutton path="gender" class="form-check-input"
											name="inlineRadioOptions_Gender" id="rdofemale" value="2"></form:radiobutton>
								Female
									</c:otherwise>
								</c:choose>
							</label>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<p class="text-muted col-9">
						<small><em>*&nbspClicking Save button will send an
								email to the member containing instructions on how to activate
								the account.</em></small>
					</p>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>