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
				<h3 class="mt-4 mb-4">Create/Edit Company Profile</h3>
			</div>
			<hr />
			<spring:url var="posturl" value='/company/create'></spring:url>
			<form:form commandName="company" method="POST" action="${posturl}" cssClass="addCompany">
				<div class="">
					<div class="col-9">
						<form:input path="sid" id="sid" class="" type="hidden" value="${company.sid}" />
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyName" class="col-3 col-form-label">Company
						Name:</label>
					<div class="col-9">
						<form:input path="name" class="form-control" type="text" value="${company.name}"
							id="textCompanyName" placeholder="" required="required" />
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyAddress" class="col-3 col-form-label">Address:</label>
					<div class="col-9">
						<form:input path="address" class="form-control" type="text" value="${company.address}"
							id="textCompanyAddress" placeholder="" required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCity" class="col-3 col-form-label">City:</label>
					<div class="col-9">
						<form:input path="city" class="form-control" type="text" value="${company.city}"
							id="textCompanyCity" placeholder="" required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyProvince" class="col-3 col-form-label">Province:</label>
					<div class="col-9">
						<form:input path="province" class="form-control" type="text"
							value="${company.province}" id="textCompanyProvince"
							placeholder="" required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyPostalCode" class="col-3 col-form-label">Postal
						Code:</label>
					<div class="col-9">
						<form:input path="postalCode" class="form-control" type="text"
							value="${company.postalCode}" id="textCompanyPostalCode"
							placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCountry" class="col-3 col-form-label">Country:</label>
					<div class="col-9">
						<form:input path="country" class="form-control" type="text" value="${company.country}"
							id="textCompanyCountry" placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCFName" class="col-3 col-form-label">Contact
						First Name:</label>
					<div class="col-9">
						<form:input path="contactFirstName" class="form-control" type="text"
							value="${company.contactFirstName}" id="textCompanyCFName"
							placeholder="" required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCLName" class="col-3 col-form-label">Contact
						Last Name:</label>
					<div class="col-9">
						<form:input path="contactLastName" class="form-control" type="text"
							value="${company.contactLastName}" id="textCompanyCLName"
							placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyCPos" class="col-3 col-form-label">Contact
						Person Position:</label>
					<div class="col-9">
						<form:input path="contactPosition" class="form-control" type="text"
							value="${company.contactPosition}"
							id="textCompanyCPos"
							placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyEmail" class="col-3 col-form-label">Contact
						Email:</label>
					<div class="col-9">
						<form:input path="contactEmailId" class="form-control" type="text"
							value="${company.contactEmailId}" id="textCompanyEmail"
							placeholder="" required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyPhn" class="col-3 col-form-label">Contact
						Telephone:</label>
					<div class="col-9">
						<form:input path="contactTelephone" class="form-control" type="tel" value="${company.contactTelephone}"
							id="textCompanyPhn"
							placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textCompanyURL" class="col-3 col-form-label">Company
						URL:</label>
					<div class="col-9">
						<form:input path="website" class="form-control" type="url" value="${company.website}"
							id="textCompanyURL" placeholder=""/>
					</div>
				</div>
				<div class="form-group row">
					<label for="textAreaNotes" class="col-3 col-form-label">Notes:</label>
					<div class="col-9">
						<form:textarea path="notes" class="form-control" id="textAreaNotes" rows="3"
							value="${company.notes}" placeholder="Notea about the company..."></form:textarea>
					</div>
				</div>

				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>