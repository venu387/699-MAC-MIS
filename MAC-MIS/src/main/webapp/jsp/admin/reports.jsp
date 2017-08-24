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
	<div class="mycontainer">
		<div class="fluid">
			<div>
				<h3 class="mt-4 mb-4">Generate Reports</h3>
			</div>
			<form:form commandName="report" action="/admin/reports"
				method="POST" cssClass="reports">
				<div class="m-4">
					<h5 class="mb-3">Entities to include in report:</h5>
					<div>
						<label class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
							<form:checkbox path="includeStudent" class="custom-control-input" />
							<span class="custom-control-indicator"></span> <span
							class="custom-control-description">Student Data</span>

						</label> <label
							class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
							<form:checkbox path="includeInternship"
								class="custom-control-input" /> <span
							class="custom-control-indicator"></span> <span
							class="custom-control-description">Student Internship Data</span>

						</label> <label
							class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
							<form:checkbox path="includeJob" class="custom-control-input" />
							<span class="custom-control-indicator"></span> <span
							class="custom-control-description">Job Posting Data</span>

						</label> <label
							class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
							<form:checkbox path="includeCompany" class="custom-control-input" />
							<span class="custom-control-indicator"></span> <span
							class="custom-control-description">Company Profiles data</span>
						</label>
					</div>
				</div>
				<div id="accordion" role="tablist" aria-multiselectable="true">
					<div class="card">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">
							<div class="card-header" role="tab" id="headingOne">
								<h5 class="mb-0">Student</h5>
							</div>
						</a>
						<div id="collapseOne" class="collapse" role="tabpanel"
							aria-labelledby="headingOne">
							<div class="card-block">
								<div class="form-group row">
									<div class="col">
										<label for="textStudentID" class="col-4 col-form-label">Student
											ID:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.studentId"
												class="form-control" type="text"
												value="${report.studentFilter.studentId}" id="textStudentID"
												placeholder=""></form:input>
										</div>
									</div>
									<div class="col">
										<label for="studentDdl" class="col-4 col-form-label">Students:</label>
										<div class="col-7 fieldInline">
											<form:select path="studentFilter.idList"
												class="custom-select form-control multiselectStudents"
												id="studentDdl" multiple="multiple">
												<c:forEach items="${studentList}" var="student">
													<form:option value="${student.sid}">${student.firstName} ${student.lastName} (${student.studentId})</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col">
										<label for="textStudentFN" class="col-4 col-form-label">Student
											First Name:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.firstName"
												class="form-control" type="text" value="" id="textStudentFN"
												placeholder=""></form:input>
										</div>
									</div>
									<div class="col">
										<label for="textStudentLN" class="col-4 col-form-label">Student
											Last Name:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.lastName"
												class="form-control" type="text" value="" id="textStudentLN"
												placeholder=""></form:input>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textStudentEmail" class="col-4 col-form-label">Student
											Email:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.emailId" class="form-control"
												type="text" value="" id="textStudentEmail" placeholder=""></form:input>
										</div>
									</div>
									<div class="col">
										<label for="textStudentTelephone" class="col-4 col-form-label">Student
											Telephone:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.telephone"
												class="form-control" type="text" value=""
												id="textStudentTelephone" placeholder=""></form:input>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textStudentCity" class="col-4 col-form-label">Student
											City:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.city" class="form-control"
												type="text" value="" id="textStudentCity" placeholder=""></form:input>
										</div>
									</div>
									<div class="col">
										<label for="textStudentProvince" class="col-4 col-form-label">Student
											Province:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.province"
												class="form-control" type="text" value=""
												id="textStudentProvince" placeholder=""></form:input>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textStudentCountry" class="col-4 col-form-label">Student
											Country:</label>
										<div class="col-7 fieldInline">
											<form:input path="studentFilter.country" class="form-control"
												type="text" value="" id="textStudentCountry" placeholder=""></form:input>
										</div>
									</div>
									<div class="col">
										<label for="gender" class="col-4 col-form-label">Gender:</label>
										<div class="col-7 fieldInline">
											<form:select path="studentFilter.genderList" id="gender"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<form:option value="1">Male</form:option>
												<form:option value="2">Female</form:option>
											</form:select>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="status" class="col-4 col-form-label">Status:</label>
										<div class="col-7 fieldInline">
											<form:select path="studentFilter.statusList" id="status"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<form:option value="1">International</form:option>
												<form:option value="2">Citizen/PR</form:option>
											</form:select>
										</div>
									</div>
									<div class="col">
										<label for="currstatus" class="col-4 col-form-label">Curriculum
											Status:</label>
										<div class="col-7 fieldInline">
											<form:select path="studentFilter.currstatusList"
												id="currstatus"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<form:option value="1">Current Student</form:option>
												<form:option value="2">Past Student</form:option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo" aria-expanded="true"
							aria-controls="collapseTwo">
							<div class="card-header" role="tab" id="headingTwo">
								<h5 class="mb-0">Internship</h5>
							</div>
						</a>
						<div id="collapseTwo" class="collapse" role="tabpanel"
							aria-labelledby="headingTwo">
							<div class="card-block">
								<div class="form-group row">
									<div class="col">
										<label for="pay" class="col-4 col-form-label">Pay:</label>
										<div class="col-7 fieldInline">
											<select id="pay"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<option value="1">Paid</option>
												<option value="2">Unpaid</option>
											</select>
										</div>
									</div>
									<div class="col">
										<label for="companyList" class="col-4 col-form-label">Companies:</label>
										<div class="col-7 fieldInline">
											<select id="companyList"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<option value="1">Company 1</option>
												<option value="2">Company 2</option>
												<option value="3">Company 3</option>
												<option value="4">Company 4</option>
												<option value="5">Company 5</option>
												<option value="6">Company 6</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree" aria-expanded="true"
							aria-controls="collapseThree">
							<div class="card-header" role="tab" id="headingThree">
								<h5 class="mb-0">Job</h5>
							</div>
						</a>
						<div id="collapseThree" class="collapse" role="tabpanel"
							aria-labelledby="headingThree">
							<div class="card-block">
								<div class="form-group row">
									<div class="col">
										<label for="textJobTitle" class="col-4 col-form-label">Job
											Title:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textJobTitle" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="jobList" class="col-4 col-form-label">Jobs
											List:</label>
										<div class="col-7 fieldInline">
											<select id="jobList"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<option value="1">Job 1</option>
												<option value="2">Job 2</option>
												<option value="3">Job 3</option>
												<option value="4">Job 4</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textSalaryFrom" class="col-4 col-form-label">Salary
											From:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="number" value=""
												id="textSalaryFrom" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="textSalaryTo" class="col-4 col-form-label">Salary
											To:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="number" value=""
												id="textSalaryTo" placeholder="">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textJobCity" class="col-4 col-form-label">Job
											City:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="number" value=""
												id="textJobCity" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="textJobProvince" class="col-4 col-form-label">Job
											Province:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="number" value=""
												id="textJobProvince" placeholder="">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textJobCountry" class="col-4 col-form-label">Job
											Country:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="number" value=""
												id="textJobCountry" placeholder="">
										</div>
									</div>
									<div class="col">
										<div class="col">
											<label for="jobStatusList" class="col-4 col-form-label">Status:</label>
											<div class="col-7 fieldInline">
												<select id="jobStatusList"
													class="multiselect-ui form-control multiselectStudents"
													multiple="multiple">
													<option value="1">Unopen</option>
													<option value="2">Open</option>
													<option value="3">Closed</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="jobGroupList" class="col-4 col-form-label">Job
											Group:</label>
										<div class="col-7 fieldInline">
											<select id="jobGroupList"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<option value="1">Web Development</option>
												<option value="2">Mobile Development</option>
											</select>
										</div>
									</div>
									<div class="col"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFour" aria-expanded="true"
							aria-controls="collapseFour">
							<div class="card-header" role="tab" id="headingFour">
								<h5 class="mb-0">Company Profile</h5>
							</div>
						</a>
						<div id="collapseFour" class="collapse" role="tabpanel"
							aria-labelledby="headingFour">
							<div class="card-block">
								<div class="form-group row">
									<div class="col">
										<label for="textCompanyName" class="col-4 col-form-label">Company
											Name:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyName" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="companyProfileList" class="col-4 col-form-label">Companies:</label>
										<div class="col-7 fieldInline">
											<select id="companyProfileList"
												class="multiselect-ui form-control multiselectStudents"
												multiple="multiple">
												<option value="1">Company 1</option>
												<option value="2">Company 2</option>
												<option value="3">Company 3</option>
												<option value="4">Company 4</option>
												<option value="5">Company 5</option>
												<option value="6">Company 6</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textCompanyCity" class="col-4 col-form-label">Company
											City:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyCity" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="textCompanyProvince" class="col-4 col-form-label">Company
											Province:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyProvince" placeholder="">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textCompanyCountry" class="col-4 col-form-label">Company
											Country:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyCountry" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="textCompanyContactFN" class="col-4 col-form-label">Contact
											First Name:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyContactFN" placeholder="">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col">
										<label for="textCompanyContactLN" class="col-4 col-form-label">Contact
											Last Name:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyContactLN" placeholder="">
										</div>
									</div>
									<div class="col">
										<label for="textCompanyContactEmail"
											class="col-4 col-form-label">Contact Email:</label>
										<div class="col-7 fieldInline">
											<input class="form-control" type="text" value=""
												id="textCompanyContactEmail" placeholder="">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Generate
						Report</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>