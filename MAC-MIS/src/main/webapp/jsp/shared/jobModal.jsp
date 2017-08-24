<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal ViewJob Start -->
<div class="modal fade" id="jobDetailModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Job Details</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Job
						Title:</label>
					<div class="col-9">
						<label class="col-form-label">${job.title}</label>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Job
						Group:</label>
					<div class="col-9">
						<label class="col-form-label">${job.group.description}</label>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Company:</label>
					<div class="col-9">
						<label class="col-form-label">${job.company.name}</label>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Type
						of Internship:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${job.internshipType == 1}">
								<label class="col-form-label">Industry</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${job.internshipType == 2}">
										<label class="col-form-label">MAC Project</label>
									</c:when>
									<c:otherwise>
										<label class="col-form-label">Other</label>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Contact
						Email ID:</label>
					<div class="col-9">
						<label class="col-form-label">${job.contactEmailId}</label>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Salary:</label>
					<div class="col-9">
						<label class="col-form-label">${job.salary}</label>
					</div>
				</div>
				<!-- 				<div class="row"> -->
				<!-- 					<label for="example-text-input" class="col-3 col-form-label">Expected -->
				<!-- 						DOJ:</label> -->
				<!-- 					<div class="col-9"> -->
				<!-- 						<label class="col-form-label">Jan 01 2018</label> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Job
						Status:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${job.status == 1}">
								<label class="col-form-label">Unopen</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${job.status == 2}">
										<label class="col-form-label">Open</label>
									</c:when>
									<c:otherwise>
										<label class="col-form-label">Closed</label>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Job
						Posting URL:</label>
					<div class="col-9">
						<label class="col-form-label">${job.url}</label>
					</div>
				</div>
				<div class="row">
					<label for="example-text-input" class="col-3 col-form-label">Job
						Description:</label>
					<div class="col-9">
						<label class="col-form-label">${job.description}</label>
					</div>
				</div>
				<!--  <hr /> -->
				<!-- 				<h6 for="example-text-input" class="col-10 col-form-label">Job -->
				<!-- 					Requirements</h6> -->
				<!-- 				<div class="row"> -->
				<!-- 					<ul> -->
				<!-- 						<li>First Requirement</li> -->
				<!-- 						<li>Second Requirement</li> -->
				<!-- 					</ul> -->
				<!-- 				</div> -->
				<!-- 				<hr /> -->
				<!-- 				<h6 for="example-text-input" class="col-10 col-form-label">Job -->
				<!-- 					Roles & Responsibilities</h6> -->
				<!-- 				<div class="row"> -->
				<!-- 					<ul> -->
				<!-- 						<li>First Responsibility</li> -->
				<!-- 						<li>Second Responsibility</li> -->
				<!-- 					</ul> -->
				<!-- 				</div> -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>
<!-- Modal ViewJob End -->