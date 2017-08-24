<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal ViewJob Start -->
<div class="modal fade" id="studentDetailModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Student
					Details</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4 class="mb-4">General Information</h4>
				<div class="row">
					<label for="textSFName" class="col-3 col-form-label">First
						Name:</label>
					<div class="col-9">
						<label class="col-form-label">${member.firstName}</label>
					</div>
				</div>
				<div class="row">
					<label for="textSMName" class="col-3 col-form-label">Middle
						Name:</label>
					<div class="col-9">
						<label class="col-form-label">${member.middleName}</label>
						<!-- <input class="form-control" type="text" value="Middle Name" id="textSLName" placeholder="Enter student middle name..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textSLName" class="col-3 col-form-label">Last
						Name:</label>
					<div class="col-9">
						<label class="col-form-label">${member.lastName}</label>
						<!-- <input class="form-control" type="text" value="Last Name" id="textSLName" placeholder="Enter student last name..."> -->
					</div>
				</div>
				<div class="row disabled">
					<label for="textSEmail" class="col-3 col-form-label">Email
						ID:</label>
					<div class="col-9">
						<label class="col-form-label">${member.emailId}</label>
					</div>
				</div>
				<div class="row">
					<label for="textTel" class="col-3 col-form-label">Telephone:</label>
					<div class="col-9">
						<label class="col-form-label">${member.telephone}</label>
						<!-- <input class="form-control" type="tel" value="+1-(555)-555-5555" id="textTel" placeholder="Enter job designation..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textCompanyAddress" class="col-3 col-form-label">Address:</label>
					<div class="col-9">
						<label class="col-form-label">${member.address}</label>
						<!-- <input class="form-control" type="text" value="400 Avenue" id="textCompanyAddress" placeholder="Enter home address..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textCompanyCity" class="col-3 col-form-label">City:</label>
					<div class="col-9">
						<label class="col-form-label">${member.city}</label>
						<!-- <input class="form-control" type="text" value="Toronto" id="textCompanyCity" placeholder="Enter city..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textCompanyProvince" class="col-3 col-form-label">Province:</label>
					<div class="col-9">
						<label class="col-form-label">${member.province}</label>
						<!-- <input class="form-control" type="text" value="Ontario" id="textCompanyProvince" placeholder="Enter province..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textCompanyPostalCode" class="col-3 col-form-label">Postal
						Code:</label>
					<div class="col-9">
						<label class="col-form-label">${member.postalCode}</label>
						<!-- <input class="form-control" type="text" value="N9C 2P3" id="textCompanyPostalCode" placeholder="Enter postal code..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textCompanyCountry" class="col-3 col-form-label">Country:</label>
					<div class="col-9">
						<label class="col-form-label">${member.country}</label>
						<!-- <input class="form-control" type="text" value="Canada" id="textCompanyCountry" placeholder="Enter country..."> -->
					</div>
				</div>
				<div class="row">
					<label for="textSFName" class="col-3 col-form-label">Gender:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${member.gender == 1}">
								<label class="col-form-label">Male</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${member.gender == 2}">
										<label class="col-form-label">Female</label>
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
					<label for="textSFName" class="col-3 col-form-label">Student
						Status:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${member.status == 1}">
								<label class="col-form-label">International</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${member.status == 2}">
										<label class="col-form-label">PR/Citizen</label>
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
					<label for="textSFName" class="col-3 col-form-label">Student
						Curriculam Status:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${member.currstatus == 1}">
								<label class="col-form-label">Current Student</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${member.currstatus == 2}">
										<label class="col-form-label">Past Student</label>
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
					<label for="textSFName" class="col-3 col-form-label">Joining
						Semester/Year:</label>
					<div class="col-9">
						<c:choose>
							<c:when test="${member.semester == 1}">
								<label class="col-form-label">Fall/${member.year}</label>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${member.currstatus == 2}">
										<label class="col-form-label">Fall/${member.year}</label>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
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
								</a>
								<!-- <a class="btn btn-danger btn-sm pull-right removeDegree" id="btnRemoveDegree1"><span class="fa fa-trash-o mr-1"></span>Remove</a> -->
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
								</a>
								<!-- <a class="btn btn-danger btn-sm pull-right removeCert" id="btnRemoveCert1"><span class="fa fa-trash-o mr-1"></span>Remove</a> -->
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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>
<!-- Modal ViewJob End -->