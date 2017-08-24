<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal ViewJob Start -->
<div class="modal fade" id="memberDetailModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Member
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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>
<!-- Modal ViewJob End -->