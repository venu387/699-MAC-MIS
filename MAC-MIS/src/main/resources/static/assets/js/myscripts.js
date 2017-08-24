$(document)
		.ready(
				function() {
					var nextreq = $('#hdnReqListCount').length + 1;
					$(".add-more-req")
							.click(
									function(e) {
										e.preventDefault();
										var addto = "#reqfield" + nextreq;
										var addRemove = "#reqfield" + (nextreq);
										nextreq = nextreq + 1;
										var newIn = '<input autocomplete="off" class="input form-control col-10 jobreqs" id="reqfield'
												+ nextreq
												+ '" name="reqfield'
												+ nextreq
												+ '" type="text" placeholder="Requirement Description...">';
										var newInput = $(newIn);
										var removeBtn = '<button id="remove'
												+ (nextreq - 1)
												+ '" class="btn btn-danger remove-me" >-</button></div><div id="reqfield">';
										var removeButton = $(removeBtn);
										$(addto).after(newInput);
										$(addRemove).after(removeButton);
										$("#reqfield" + nextreq).attr(
												'data-source',
												$(addto).attr('data-source'));
										$("#count").val(nextreq);

										$('.remove-me')
												.click(
														function(e) {
															e.preventDefault();
															var fieldNum = this.id
																	.charAt(this.id.length - 1);
															var fieldID = "#reqfield"
																	+ fieldNum;
															$(this).remove();
															$(fieldID).remove();
														});
									});
				});
$(document)
		.ready(
				function() {
					var next = $('#hdnRoleListCount').length + 1;
					$(".add-more-role")
							.click(
									function(e) {
										e.preventDefault();
										var addto = "#rolefield" + next;
										var addRemove = "#rolefield" + (next);
										next = next + 1;
										var newIn = '<input autocomplete="off" class="input form-control col-10 jobreqs" id="rolefield'
												+ next
												+ '" name="rolefield'
												+ next
												+ '" type="text" placeholder="Role & Responsibility Description...">';
										var newInput = $(newIn);
										var removeBtn = '<button id="remove'
												+ (next - 1)
												+ '" class="btn btn-danger remove-me" >-</button></div><div id="rolefield">';
										var removeButton = $(removeBtn);
										$(addto).after(newInput);
										$(addRemove).after(removeButton);
										$("#rolefield" + next).attr(
												'data-source',
												$(addto).attr('data-source'));
										$("#count").val(next);

										$('.remove-me')
												.click(
														function(e) {
															e.preventDefault();
															var fieldNum = this.id
																	.charAt(this.id.length - 1);
															var fieldID = "#rolefield"
																	+ fieldNum;
															$(this).remove();
															$(fieldID).remove();
														});
									});

					// Form validations
					$('form.addStudent').validate({
						rules: {
						    gender: {
						      required: true
						    },
						    status: {
						    	required: true
						    },
						    currstatus: {
						    	required: true
						    }
						  }
					});

					$("#myform" ).validate({
						  rules: {
						    gender: {
						      required: true
						    }
						  }
						});
					

					// Move to Top
					$(window).scroll(function() {
						if ($(this).scrollTop() > 50) {
							$('#back-to-top').fadeIn();
						} else {
							$('#back-to-top').fadeOut();
						}
					});
					// scroll body to 0px on click
					$('#back-to-top').click(function() {
						// $('#back-to-top').tooltip('hide');
						$('body,html').animate({
							scrollTop : 0
						}, 800);
						return false;
					});

					// $('#back-to-top').tooltip('show');

					$(document).on('click', '.removeDegree', function(e) {
						e.preventDefault();
						var fieldNum = this.id.charAt(this.id.length - 1);
						var fieldID = "#degree" + fieldNum;
						$(fieldID).remove();
					});

					$(document).on('click', '.removeCert', function(e) {
						e.preventDefault();
						var fieldNum = this.id.charAt(this.id.length - 1);
						var fieldID = "#cert" + fieldNum;
						$(fieldID).remove();
					});

					degrees = 1
					certs = 1

					$('.btnAddDegree')
							.click(
									function() {
										if ($('.degree').length == 0)
											degrees = 1;
										else
											degrees = degrees + 1;

										$('#accordiondegrees')
												.append(
														'<div class="card degree" id="degree'
																+ degrees
																+ '"><div class="card-header" role="tab" id="heading'
																+ degrees
																+ '"><a data-toggle="collapse" data-parent="#accordion" href="#collapse'
																+ degrees
																+ '" aria-expanded="true" aria-controls="collapse'
																+ degrees
																+ '">Degree '
																+ degrees
																+ '<h5 class="mb-0" style="display:inline;"></h5>  </a><a class="btn btn-danger btn-sm pull-right removeDegree" id="btnRemoveDegree'
																+ degrees
																+ '"><span class="fa fa-trash-o mr-1"></span>Remove</a></div><div id="collapse'
																+ degrees
																+ '" class="collapse" role="tabpanel" aria-labelledby="heading'
																+ degrees
																+ '"><div class="card-block"><div class="form-group row"><label for="degreeDdl'
																+ degrees
																+ '" class="col-3 col-form-label">Degree:</label><div class="col-9"><select class="custom-select form-control" id="degreeDdl'
																+ degrees
																+ '"><option selected>--Select--</option><option value="1">Undergraduate</option><option value="2">Graduate</option></select></div></div><div class="form-group row"><label for="textDegreeTitle'
																+ degrees
																+ '" class="col-3 col-form-label">Degree Title:</label><div class="col-9"><input class="form-control" type="text" value="Master of Applied Computing" id="textDegreeTitle'
																+ degrees
																+ '" placeholder="Enter degree title..."></div></div><div class="form-group row"><label for="textDegreeCGPA'
																+ degrees
																+ '" class="col-3 col-form-label">Degree CGPA:</label><div class="col-9"><input class="form-control" type="text" value="8.5" id="textDegreeCGPA'
																+ degrees
																+ '" placeholder="Enter degree CGPA or %..."></div></div><div class="form-group row"><label for="textDegreeUniv'
																+ degrees
																+ '" class="col-3 col-form-label">University:</label><div class="col-9"><input class="form-control" type="text" value="University of Windsor" id="textDegreeUniv'
																+ degrees
																+ '" placeholder="Enter university name..."></div></div><div class="form-group row"><label for="textDegreeUnivCountry'
																+ degrees
																+ '" class="col-3 col-form-label">University Location (Country):</label><div class="col-9"><input class="form-control" type="text" value="Canada" id="textDegreeUnivCountry'
																+ degrees
																+ '" placeholder="Enter university location (country)..."></div></div></div></div></div>');
									});

					$('.btnAddCert')
							.click(
									function() {
										if ($('.cert').length == 0)
											cert = 1;
										else
											certs = certs + 1;

										$('#accordioncert')
												.append(
														'<div class="card cert" id="cert'
																+ certs
																+ '"><div class="card-header" role="tab" id="headingCert'
																+ certs
																+ '"><a data-toggle="collapse" data-parent="#accordion" href="#collapseCert'
																+ certs
																+ '" aria-expanded="true" aria-controls="collapseCert'
																+ certs
																+ '">Certification '
																+ certs
																+ '<h5 class="mb-0" style="display:inline;"></h5>  </a><a class="btn btn-danger btn-sm pull-right removeCert" id="btnRemoveCert'
																+ certs
																+ '"><span class="fa fa-trash-o mr-1"></span>Remove</a></div><div id="collapseCert'
																+ certs
																+ '" class="collapse" role="tabpanel" aria-labelledby="headingCert'
																+ certs
																+ '"><div class="card-block"><div class="form-group row"><label for="textCertTitle'
																+ certs
																+ '" class="col-3 col-form-label">Certificate Title:</label><div class="col-9"><input class="form-control" type="text" value="CCNA" id="textCertTitle'
																+ certs
																+ '" placeholder="Enter certificate title..."></div></div><div class="form-group row"><label for="textCertBody'
																+ certs
																+ '" class="col-3 col-form-label">Certificate Body:</label><div class="col-9"><input class="form-control" type="text" value="CISCO" id="textCertBody'
																+ certs
																+ '" placeholder="Enter certificate body or certification provider..."></div></div></div></div></div>');
									});

					// Display Company Modal Dynamically
					$(document).on(
							'click',
							'.btnCompanyDetails',
							function(e) {
								// $('.btnCompanyDetails').click( function(e) {
								var temp = this;
								$.ajax({
									type : "GET",
									contentType : "text/html",
									url : "/company/getCompany?companyId="
											+ $(this).data('id'),
									// data: JSON.stringify(search),
									// dataType: 'text/html',
									cache : false,
									timeout : 60000,
									success : function(data) {

										// console.log("SUCCESS : ", data);

										// Remove if exists
										$('#companyDetailModal').remove();

										$('body').append(data);
										// $(this).attr('data-id', '1');
										$('.btnCompanyDetails').attr(
												'data-target', 'modal');
										$('.btnCompanyDetails').attr(
												'data-toggle',
												'#companyDetailModal');
										$('.btnCompanyDetails').attr('id',
												'#btnCompanyDetail');
										// $('.btnCompanyDetails').removeClass('btnCompanyDetails')

										$('#companyDetailModal').modal('show');
										// $('#companyDetailModal').modal('show');
										// $('body').addClass('modal-open');
									},
									error : function(e) {
										console.log("ERROR : ", e);
									}
								});

								// $('#btnCompanyDetail').click();
							})

					// Display Job Modal Dynamically
					$(document).on(
							'click',
							'.btnJobDetails',
							function(e) {
								var temp = this;
								$.ajax({
									type : "GET",
									contentType : "text/html",
									url : "/job/getJob?jobId="
											+ $(this).data('id'),
									// data: JSON.stringify(search),
									// dataType: 'text/html',
									cache : false,
									timeout : 60000,
									success : function(data) {

										// console.log("SUCCESS : ", data);

										// Remove if exists
										$('#jobDetailModal').remove();

										$('body').append(data);
										$('.btnJobDetails').attr('data-target',
												'modal');
										$('.btnJobDetails').attr('data-toggle',
												'#jobDetailModal');
										$('.btnJobDetails').attr('id',
												'#btnJobDetail');

										$('#jobDetailModal').modal('show');
									},
									error : function(e) {
										console.log("ERROR : ", e);
									}
								});
							})

					// Display Company Modal Dynamically
					$(document).on(
							'click',
							'.btnStudentDetails',
							function(e) {
								var temp = this;
								$.ajax({
									type : "GET",
									contentType : "text/html",
									url : "/member/getMember?memberId="
											+ $(this).data('id') + "&type=3",
									// data: JSON.stringify(search),
									// dataType: 'text/html',
									cache : false,
									timeout : 60000,
									success : function(data) {

										// console.log("SUCCESS : ", data);

										// Remove if exists
										$('#studentDetailModal').remove();

										$('body').append(data);
										$('.btnStudentDetails').attr(
												'data-target', 'modal');
										$('.btnStudentDetails').attr(
												'data-toggle',
												'#studentDetailModal');
										$('.btnStudentDetails').attr('id',
												'#btnStudentDetail');

										$('#studentDetailModal').modal('show');
									},
									error : function(e) {
										console.log("ERROR : ", e);
									}
								});
							})
					// Display Company Modal Dynamically
					$(document).on(
							'click',
							'.btnMemberDetails',
							function(e) {
								var temp = this;
								$.ajax({
									type : "GET",
									contentType : "text/html",
									url : "/member/getMember?memberId="
											+ $(this).data('id') + "&type="
											+ $(this).data('type'),
									// data: JSON.stringify(search),
									// dataType: 'text/html',
									cache : false,
									timeout : 60000,
									success : function(data) {

										// console.log("SUCCESS : ", data);

										// Remove if exists
										$('#memberDetailModal').remove();

										$('body').append(data);
										$('.btnMemberDetails').attr(
												'data-target', 'modal');
										$('.btnMemberDetails').attr(
												'data-toggle',
												'#studentDetailModal');
										$('.btnMemberDetails').attr('id',
												'#btnMemberDetail');

										$('#memberDetailModal').modal('show');
									},
									error : function(e) {
										console.log("ERROR : ", e);
									}
								});
							})

					// Open job
					$('#jobStatusDdl').change(
							function() {
								if ($(this).val() == '2') {
									$('.jobAlertPopup').css('height', 'auto');
									$('.jobAlertPopup').css('visibility',
											'visible');
									$('input[name=sendAlert][value=1]').prop(
											'checked', true);
								} else {
									$('.jobAlertPopup').css('visibility',
											'hidden');
									$('input[name=sendAlert]').each(function() {
										$(this).prop('checked', false);
									});
								}
							})

					$('input[name=sendAlert]').change(
							function() {

								if ($('input[name=sendAlert][value=2]').prop(
										'checked') == true) {
									$('.jobAlertStudentList').css('height',
											'auto');
									$('.jobAlertStudentList').css('visibility',
											'visible');
								} else {
									$('.jobAlertStudentList').css('height',
											'0px');
									$('.jobAlertStudentList').css('visibility',
											'hidden');
								}
							})


						    $('.multiselectStudentsJob').multiselect({
						        includeSelectAllOption: false
						    });

						    $('.multiselectStudents').multiselect({
						        includeSelectAllOption: true
						    });

						    $('.multiselect-native-select').css('width', '100%');
						    $('.multiselect-container.dropdown-menu').css('width', '100%');
						    //#report > div:nth-child(1) > div:nth-child(2) > div > span > div > ul


				});

function btnAddJobClick() {
	// $('.btnSubmitJob').click(function(e) {
	//alert('abc');
	$('#hdnIdList').val('');
	$('.multiselect-container.dropdown-menu input:checked').each(
			function() {
				$('#hdnIdList').val(
						$('#hdnIdList').val() + "," + $(this).attr('value'));
			})
	return true;
	// $('#job').submit();
	// })
}