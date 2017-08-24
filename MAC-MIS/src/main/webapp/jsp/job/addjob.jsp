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
			<form:form commandName="job" action="/job/create" method="POST"
				cssClass="addJob">
				<div class="modal-body">
					<div class="col-9">
						<form:input path="sid" class="form-control" type="hidden"
							value="${job.sid}" id="hdnSid" />
					</div>
					<div class="form-group row">
						<label for="textJobTitle" class="col-3 col-form-label">Job
							Title:</label>
						<div class="col-9">
							<form:input path="title" class="form-control" type="text"
								value="${job.title}" id="textJobTitle" required="required" />
						</div>
					</div>
					<div class="form-group row">
						<label for="jobGroupDdl" class="col-3 col-form-label">Job
							Group:</label>
						<div class="col-7">
							<form:select path="group.sid" class="custom-select form-control"
								id="jobGroupDdl" required="required">
								<option value="">--Select--</option>
								<c:forEach items="${jobGroups}" var="group">
									<c:choose>
										<c:when test="${group.sid == job.group.sid}">
											<option selected="selected" value="${group.sid}">${group.description}</option>
										</c:when>
										<c:otherwise>
											<option value="${group.sid}">${group.description}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<div class="col-2 mt-1">
							<a href="/job/createGroup"
								class="btn btn-secondary btn-sm pull-right" target="_blank">Add
								New</a>
						</div>
					</div>
					<div class="form-group row">
						<label for="companyDdl" class="col-3 col-form-label">Company:</label>
						<div class="col-7">
							<form:select path="company.sid"
								class="custom-select form-control" id="companyDdl"
								required="required">
								<option value="">--Select--</option>
								<c:forEach items="${companyList}" var="company">
									<c:choose>
										<c:when test="${company.sid == job.company.sid}">
											<form:option selected="selected" value="${company.sid}">${company.name}</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="${company.sid}">${company.name}</form:option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<div class="col-2 mt-1">
							<a href="/company/create"
								class="btn btn-secondary btn-sm pull-right" target="_blank">Add
								New</a>
						</div>
					</div>
					<div class="form-group row">
						<label for="internshipTypeDdl" class="col-3 col-form-label">Type
							of Internship:</label>
						<div class="col-9">
							<form:select path="internshipType"
								class="custom-select form-control" id="internshipTypeDdl"
								required="required">
								<option value="">--Select--</option>
								<c:choose>
									<c:when test="${job.internshipType == 1}">
										<form:option selected="selected" value="1">Industry</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="1">Industry</form:option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${job.internshipType == 2}">
										<form:option selected="selected" value="2">MAC Project</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="2">MAC Project</form:option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${job.internshipType == 3}">
										<form:option selected="selected" value="3">Other</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="1">Other</form:option>
									</c:otherwise>
								</c:choose>
							</form:select>
						</div>
					</div>
					<div class="form-group row">
						<label for="textContact" class="col-3 col-form-label">Contact
							Email ID:</label>
						<div class="col-9">
							<form:input path="contactEmailId" class="form-control"
								type="text" value="${job.contactEmailId}" id="textContact"
								required="required"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="textSalary" class="col-3 col-form-label">Salary:</label>
						<div class="col-9">
							<form:input path="salary" class="form-control" type="text"
								value="${job.salary}" id="textSalary" required="required"></form:input>
						</div>
					</div>
					<!-- 					<div class="form-group row"> -->
					<!-- 						<label for="textDOJ" class="col-3 col-form-label">Expected -->
					<!-- 							DOJ:</label> -->
					<!-- 						<div class="col-9"> -->
					<%-- 							<form:input path="expDoj" class="form-control" type="text" --%>
					<%-- 								value="${job.expDoj}" id="textDOJ"></form:input> --%>
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="form-group row">
						<label for="textURL" class="col-3 col-form-label">Job
							Posting URL:</label>
						<div class="col-9">
							<form:input path="url" class="form-control" type="url"
								value="${job.url}" id="textURL" required="required"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="jobStatusDdl" class="col-3 col-form-label">Job
							Status:</label>
						<div class="col-9">
							<form:select path="status" class="custom-select form-control"
								id="jobStatusDdl" required="required">
								<option value="">--Select--</option>
								<c:choose>
									<c:when test="${job.status == 1}">
										<form:option selected="selected" value="1">Unopen</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="1">Unopen</form:option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${job.status == 2}">
										<form:option selected="selected" value="2">Open</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="2">Open</form:option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${job.status == 3}">
										<form:option selected="selected" value="3">Closed</form:option>
									</c:when>
									<c:otherwise>
										<form:option value="1">Closed</form:option>
									</c:otherwise>
								</c:choose>
							</form:select>
						</div>
					</div>
					<div class="form-group row jobAlertPopup">
						<label for="textAlert" class="col-3 col-form-label">Send
							Job Alert:</label>
						<div class="col-9">
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <form:radiobutton
										path="sendAlert" class="form-check-input"
										name="inlineRadioOptions_JobAlert" id="rdoall" value="1"></form:radiobutton>
									To All Students
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <form:radiobutton
										path="sendAlert" class="form-check-input"
										name="inlineRadioOptions_JobAlert" id="rdosome" value="2"></form:radiobutton>
									To Seleted Students
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <form:radiobutton
										path="sendAlert" class="form-check-input"
										name="inlineRadioOptions_JobAlert" id="rdonone" value="3"></form:radiobutton>
									Do not send
								</label>
							</div>
						</div>
					</div>
					<div class="col-9">
						<form:input path="hdnIdList" class="form-control" type="hidden"
							value="${job.hdnIdList}" id="hdnIdList" />
					</div>
					<div class="form-group row jobAlertStudentList">
						<label for="textAlert" class="col-3 col-form-label"></label>
						<div class="col-9">
							<select id="ddlStudents" class="multiselect-ui form-control multiselectStudentsJob"
								multiple="multiple">
								<c:forEach items="${studentList}" var="student">
									<option value="${student.sid}">${student.firstName} ${student.lastName} (${student.studentId})</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="textAreaDesc" class="col-3 col-form-label">Job
							Description:</label>
						<div class="col-9">
							<form:textarea path="description" class="form-control"
								id="textAreaDesc" rows="3" value="${job.description}"></form:textarea>
						</div>
					</div>
					<hr />
					<!-- 					<h6 class="col-10 col-form-label mb-3">Job Requirements:</h6> -->
					<!-- 					<div class="form-group row"> -->
					<%-- 						<c:choose> --%>
					<%-- 							<c:when test="${reqList.size() > 0}"> --%>
					<!-- 								<input path="" id="hdnReqListCount" type="hidden" -->
					<%-- 									value="<c:out value="${reqList.size()}"></c:out>" /> --%>

					<%-- 								<c:forEach items="${reqList}" var="req"> --%>
					<%-- 									<c:choose> --%>
					<%-- 										<c:when test="${req.type == 1}"> --%>
					<%-- 											<form:input path="reqRoleList[${req.sid}]" autocomplete="off" --%>
					<%-- 												class="input form-control col-10 jobreqs" --%>
					<%-- 												id="reqfield${req.sid}" name="prof1" type="text" --%>
					<%-- 												placeholder="Requirement Description..." data-items="8" --%>
					<%-- 												value="${req.description}"></form:input> --%>
					<%-- 											<c:choose> --%>
					<%-- 												<c:when test="${reqList.indexOf(req) == (reqList.size()-1)}"> --%>
					<%-- 													<button id="jr${req.sid}" class="btn add-more-req" --%>
					<!-- 														type="button">+</button> -->
					<%-- 												</c:when> --%>
					<%-- 												<c:otherwise> --%>
					<%-- 													<button id="remove${req.sid}" --%>
					<!-- 														class="btn btn-danger remove-me">-</button> -->
					<%-- 												</c:otherwise> --%>
					<%-- 											</c:choose> --%>
					<%-- 										</c:when> --%>
					<%-- 									</c:choose> --%>
					<%-- 								</c:forEach> --%>
					<%-- 							</c:when> --%>
					<%-- 							<c:otherwise> --%>
					<!-- 								<input id="hdnReqListCount" value="1"> -->
					<!-- 								<input autocomplete="off" -->
					<!-- 									class="input form-control col-10 jobreqs" id="reqfield1" -->
					<!-- 									name="prof1" type="text" -->
					<!-- 									placeholder="Requirement Description..." data-items="8" -->
					<!-- 									value=" "></input> -->
					<!-- 								<button id="jr1" class="btn add-more-req" type="button">+</button> -->
					<%-- 							</c:otherwise> --%>
					<%-- 						</c:choose> --%>
					<!-- 					</div> -->
					<!-- 					<hr /> -->
					<!-- 					<h6 class="col-10 col-form-label mb-3">Job Roles & -->
					<!-- 						Responsibilities:</h6> -->
					<!-- 					<div class="form-group row"> -->
					<%-- 						<c:choose> --%>
					<%-- 							<c:when test="${roleList.size() > 0}"> --%>
					<!-- 								<input id="hdnRoleListCount" type="hidden" -->
					<%-- 									value="<c:out value="${roleList.size()}"></c:out>"> --%>
					<%-- 								<c:forEach items="${roleList}" var="role"> --%>
					<%-- 									<c:choose> --%>
					<%-- 										<c:when test="${role.type == 2}"> --%>
					<%-- 											<form:input path="reqRoleList[${role.sid}]" --%>
					<%-- 												autocomplete="off" class="input form-control col-10 jobreqs" --%>
					<%-- 												id="rolefield${role.sid}" name="prof${role.sid}" type="text" --%>
					<%-- 												placeholder="Role & Responsibility Description..." --%>
					<%-- 												data-items="8" value="${role.description}"></form:input> --%>
					<%-- 											<c:choose> --%>
					<%-- 												<c:when --%>
					<%-- 													test="${roleList.indexOf(role) == (roleList.size()-1)}"> --%>
					<%-- 													<button id="jr${role.sid}" class="btn add-more-role" --%>
					<!-- 														type="button">+</button> -->
					<%-- 												</c:when> --%>
					<%-- 												<c:otherwise> --%>
					<%-- 													<button id="remove${role.sid}" --%>
					<!-- 														class="btn btn-danger remove-me">-</button> -->
					<%-- 												</c:otherwise> --%>
					<%-- 											</c:choose> --%>
					<%-- 										</c:when> --%>
					<%-- 									</c:choose> --%>
					<%-- 								</c:forEach> --%>
					<%-- 							</c:when> --%>
					<%-- 							<c:otherwise> --%>
					<!-- 								<input id="hdnRoleListCount" value="1"> -->
					<!-- 								<input autocomplete="off" -->
					<!-- 									class="input form-control col-10 jobreqs" id="rolefield1" -->
					<!-- 									name="prof1" type="text" -->
					<!-- 									placeholder="Role & Responsibility Description..." -->
					<!-- 									data-items="8" value=" "></input> -->
					<!-- 								<button id="jr1" class="btn add-more-req" type="button">+</button> -->
					<%-- 							</c:otherwise> --%>
					<%-- 						</c:choose> --%>
					<!-- 					</div> -->

					<div class="modal-footer">
						<button type=submit onClick="return btnAddJobClick()"
							class="btn btn-primary btnSubmitJob">Save</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>