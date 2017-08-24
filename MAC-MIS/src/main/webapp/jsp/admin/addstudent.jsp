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
				<h3 class="mt-4 mb-4">Create/Edit Student Profile</h3>
			</div>
			<form:form commandName="student" action="/member/addstudent"
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
					<label for="textSNumber" class="col-3 col-form-label">Student
						#:</label>
					<div class="col-9">
						<form:input path="studentId" value="${student.studentId}"
							class="form-control" type="text" id="textSNumber" placeholder=""
							required="required"></form:input>
					</div>
				</div>
				<div class="form-group row">
					<label for="textSFName" class="col-3 col-form-label">First
						Name:</label>
					<div class="col-9">
						<form:input path="firstName" value="${student.firstName}"
							class="form-control" type="text" id="textSFName" placeholder=""
							required="required"></form:input>
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
							class="form-control" type="text" id="textSLName" placeholder=""
							required="required"></form:input>
					</div>
				</div>
				<c:choose>
					<c:when test="${isMyProfile == 1}">
						<div class="form-group row disabled">
							<label for="textSEmail" class="col-3 col-form-label">Email
								ID (Username):</label>
							<div class="col-9">
								<form:input path="emailId" value="${student.emailId}"
									class="form-control" type="text" id="textSEmail" placeholder=""
									required="required"></form:input>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-group row">
							<label for="textSEmail" class="col-3 col-form-label">Email
								ID (Username):</label>
							<div class="col-9">
								<form:input path="emailId" value="${student.emailId}"
									class="form-control" type="text" id="textSEmail" placeholder=""
									required="required"></form:input>
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
										<form:radiobutton path="gender" class="form-check-input required"
											name="inlineRadioOptions_Gender" id="rdomale"  required="required"
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
				<div class="form-group row">
					<label for="textSFName" class="col-3 col-form-label">Student
						Status:</label>
					<div class="col-9">
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.status == 1}">
										<form:radiobutton path="status" class="form-check-input"
											name="inlineRadioOptions_Status" id="rdoint" required="required"
											checked="checked" value="1"></form:radiobutton>
								International
									</c:when>
									<c:otherwise>
										<form:radiobutton path="status" class="form-check-input"
											name="inlineRadioOptions_Status" id="rdoint" value="1"></form:radiobutton>
								International
									</c:otherwise>
								</c:choose>

							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.status == 2}">
										<form:radiobutton path="status" class="form-check-input"
											name="inlineRadioOptions_Status" id="rdocur" required="required"
											checked="checked" value="2"></form:radiobutton>
								Permanent Resident/Citizen of Canada
									</c:when>
									<c:otherwise>
										<form:radiobutton path="status" class="form-check-input"
											name="inlineRadioOptions_Status" id="rdocur" value="2"></form:radiobutton>
								Permanent Resident/Citizen of Canada
									</c:otherwise>
								</c:choose>

							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="textSFName" class="col-3 col-form-label">Student
						Curriculam Status:</label>
					<div class="col-9">
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.currstatus == 1}">
										<form:radiobutton path="currstatus" class="form-check-input"
											name="inlineRadioOptions_CurStatus" id="rdocur" required="required"
											checked="checked" value="1"></form:radiobutton>
								Current Student
									</c:when>
									<c:otherwise>
										<form:radiobutton path="currstatus" class="form-check-input"
											name="inlineRadioOptions_CurStatus" id="rdocur" value="1"></form:radiobutton>
								Current Student
									</c:otherwise>
								</c:choose>

							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <c:choose>
									<c:when test="${student.currstatus == 2}">
										<form:radiobutton path="currstatus" class="form-check-input"
											name="inlineRadioOptions_CurStatus" id="rdocur" required="required"
											checked="checked" value="2"></form:radiobutton>
								Past Student
									</c:when>
									<c:otherwise>
										<form:radiobutton path="currstatus" class="form-check-input"
											name="inlineRadioOptions_CurStatus" id="rdocur" value="2"></form:radiobutton>
								Past Student
									</c:otherwise>
								</c:choose>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="companyDdl" class="col-3 col-form-label">Semester
						Registered:</label>
					<div class="form-check form-check-inline">
						<div class="col-12">
							<form:select path="semester" class="custom-select form-control"
								id="semDdl" required="required">
								<option value="">--Select--</option>
								<c:choose>
									<c:when test="${student.semester == 1}">
										<form:option selected="selected" value="1">Fall</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="1">Fall</form:option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${student.semester == 2}">
										<form:option selected="selected" value="2">Winter</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="2">Winter</form:option>
									</c:otherwise>
								</c:choose>
							</form:select>
						</div>
					</div>
					<div class="form-check form-check-inline">
						<div class="col-6">
							<form:input path="year" class="form-control" type="year"
								value="${student.year}" id="textRegYear" placeholder="YYYY"
								required="required"></form:input>
						</div>
					</div>
				</div>
				<hr />
				<h4 class="mb-4">Education</h4>
				<h5 class="col-4 mb-4">Degrees</h5>
				<div class="form-group">
					<div id="accordiondegrees" role="tablist"
						aria-multiselectable="true">
						<!-- One Card Start -->
						<div class="card degree" id="degree1">
							<div class="card-header" role="tab" id="heading1">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1" aria-expanded="true"
									aria-controls="collapse1">Degree 1
									<h5 class="mb-0" style="display: inline;"></h5>
								</a> <a class="btn btn-danger btn-sm pull-right removeDegree"
									id="btnRemoveDegree1"><span class="fa fa-trash-o mr-1"></span>Remove</a>
							</div>

							<div id="collapse1" class="collapse" role="tabpanel"
								aria-labelledby="heading1">
								<div class="card-block">
									<div class="form-group row">
										<label for="degreeDdl1" class="col-3 col-form-label">Degree:</label>
										<div class="col-9">
											<select class="custom-select form-control" id="degreeDdl1">
												<option selected>--Select--</option>
												<option value="1">Undergraduate</option>
												<option value="2">Graduate</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="textDegreeTitle1" class="col-3 col-form-label">Degree
											Title:</label>
										<div class="col-9">
											<input class="form-control" type="text"
												value="Master of Applied Computing" id="textDegreeTitle1"
												placeholder="Enter degree title...">
										</div>
									</div>
									<div class="form-group row">
										<label for="textDegreeCGPA1" class="col-3 col-form-label">Degree
											CGPA:</label>
										<div class="col-9">
											<input class="form-control" type="text" value="8.5"
												id="textDegreeCGPA1" placeholder="Enter degree CGPA or %...">
										</div>
									</div>
									<div class="form-group row">
										<label for="textDegreeUniv1" class="col-3 col-form-label">University:</label>
										<div class="col-9">
											<input class="form-control" type="text"
												value="University of Windsor" id="textDegreeUniv1"
												placeholder="Enter university name...">
										</div>
									</div>
									<div class="form-group row">
										<label for="textDegreeUnivCountry1"
											class="col-3 col-form-label">University Location
											(Country):</label>
										<div class="col-9">
											<input class="form-control" type="text" value="Canada"
												id="textDegreeUnivCountry1"
												placeholder="Enter university location (country)...">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- One Card End -->
					</div>
					<button type="button"
						class="btn btn-secondary btn-sm mt-3 btnAddDegree">Add
						New Degree</button>
				</div>

				<h5 class="col-4 mb-4">Certifications</h5>
				<div class="form-group">
					<div id="accordioncert" role="tablist" aria-multiselectable="true">
						<!-- One Cert Card Start -->
						<div class="card cert" id="cert1">
							<div class="card-header" role="tab" id="headingCert1">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseCert1" aria-expanded="true"
									aria-controls="collapseCert1">Certification 1
									<h5 class="mb-0" style="display: inline;"></h5>
								</a> <a class="btn btn-danger btn-sm pull-right removeCert"
									id="btnRemoveCert1"><span class="fa fa-trash-o mr-1"></span>Remove</a>
							</div>

							<div id="collapseCert1" class="collapse" role="tabpanel"
								aria-labelledby="headingCert1">
								<div class="card-block">
									<div class="form-group row">
										<label for="textCertTitle1" class="col-3 col-form-label">Certificate
											Title:</label>
										<div class="col-9">
											<input class="form-control" type="text" value="CCNA"
												id="textCertTitle1" placeholder="Enter certificate title...">
										</div>
									</div>
									<div class="form-group row">
										<label for="textCertBody1" class="col-3 col-form-label">Certificate
											Body:</label>
										<div class="col-9">
											<input class="form-control" type="text" value="CISCO"
												id="textCertBody1"
												placeholder="Enter certificate body or certification provider...">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- One Cert Card End -->
					</div>
					<button type="button"
						class="btn btn-secondary btn-sm mt-3 btnAddCert">Add New
						Certificate</button>
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