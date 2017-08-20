$(document).ready(function(){
    var nextreq = 1;
    $(".add-more-req").click(function(e){
        e.preventDefault();
        var addto = "#reqfield" + nextreq;
        var addRemove = "#reqfield" + (nextreq);
        nextreq = nextreq + 1;
        var newIn = '<input autocomplete="off" class="input form-control col-10 jobreqs" id="reqfield' + nextreq + '" name="reqfield' + nextreq + '" type="text" placeholder="Requirement Description...">';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (nextreq - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="reqfield">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#reqfield" + nextreq).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(nextreq);  
        
        $('.remove-me').click(function(e){
            e.preventDefault();
            var fieldNum = this.id.charAt(this.id.length-1);
            var fieldID = "#reqfield" + fieldNum;
            $(this).remove();
            $(fieldID).remove();
        });
    }); 
});
$(document).ready(function(){
    var next = 1;
    $(".add-more-role").click(function(e){
        e.preventDefault();
        var addto = "#rolefield" + next;
        var addRemove = "#rolefield" + (next);
        next = next + 1;
        var newIn = '<input autocomplete="off" class="input form-control col-10 jobreqs" id="rolefield' + next + '" name="rolefield' + next + '" type="text" placeholder="Role & Responsibility Description...">';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="rolefield">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#rolefield" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);  
        
        $('.remove-me').click(function(e){
            e.preventDefault();
            var fieldNum = this.id.charAt(this.id.length-1);
            var fieldID = "#rolefield" + fieldNum;
            $(this).remove();
            $(fieldID).remove();
        });
    });

    //Form validations
    $('#addMember').validate();
        
    //Move to Top
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
    
    $('#back-to-top').tooltip('show');


    $(document).on('click', '.removeDegree', function(e) {
        e.preventDefault();
        var fieldNum = this.id.charAt(this.id.length-1);
        var fieldID = "#degree" + fieldNum;
        $(fieldID).remove();
    });

    $(document).on('click', '.removeCert', function(e) {
        e.preventDefault();
        var fieldNum = this.id.charAt(this.id.length-1);
        var fieldID = "#cert" + fieldNum;
        $(fieldID).remove();
    });

    degrees = 1
    certs = 1

    $('.btnAddDegree').click(function(){
        if ($('.degree').length == 0)
            degrees = 1;
        else
            degrees = degrees + 1;
        
        $('#accordiondegrees').append('<div class="card degree" id="degree'+ degrees +'"><div class="card-header" role="tab" id="heading'+ degrees +'"><a data-toggle="collapse" data-parent="#accordion" href="#collapse'+ degrees +'" aria-expanded="true" aria-controls="collapse'+ degrees +'">Degree '+ degrees +'<h5 class="mb-0" style="display:inline;"></h5>  </a><a class="btn btn-danger btn-sm pull-right removeDegree" id="btnRemoveDegree'+ degrees +'"><span class="fa fa-trash-o mr-1"></span>Remove</a></div><div id="collapse'+ degrees +'" class="collapse" role="tabpanel" aria-labelledby="heading'+ degrees +'"><div class="card-block"><div class="form-group row"><label for="degreeDdl'+ degrees +'" class="col-3 col-form-label">Degree:</label><div class="col-9"><select class="custom-select form-control" id="degreeDdl'+ degrees +'"><option selected>--Select--</option><option value="1">Undergraduate</option><option value="2">Graduate</option></select></div></div><div class="form-group row"><label for="textDegreeTitle'+ degrees +'" class="col-3 col-form-label">Degree Title:</label><div class="col-9"><input class="form-control" type="text" value="Master of Applied Computing" id="textDegreeTitle'+ degrees +'" placeholder="Enter degree title..."></div></div><div class="form-group row"><label for="textDegreeCGPA'+ degrees +'" class="col-3 col-form-label">Degree CGPA:</label><div class="col-9"><input class="form-control" type="text" value="8.5" id="textDegreeCGPA'+ degrees +'" placeholder="Enter degree CGPA or %..."></div></div><div class="form-group row"><label for="textDegreeUniv'+ degrees +'" class="col-3 col-form-label">University:</label><div class="col-9"><input class="form-control" type="text" value="University of Windsor" id="textDegreeUniv'+ degrees +'" placeholder="Enter university name..."></div></div><div class="form-group row"><label for="textDegreeUnivCountry'+ degrees +'" class="col-3 col-form-label">University Location (Country):</label><div class="col-9"><input class="form-control" type="text" value="Canada" id="textDegreeUnivCountry'+ degrees +'" placeholder="Enter university location (country)..."></div></div></div></div></div>');
    });
    
    $('.btnAddCert').click(function(){
        if ($('.cert').length == 0)
            cert = 1;
        else
            certs = certs + 1;
        
        $('#accordioncert').append('<div class="card cert" id="cert'+ certs +'"><div class="card-header" role="tab" id="headingCert'+ certs +'"><a data-toggle="collapse" data-parent="#accordion" href="#collapseCert'+ certs +'" aria-expanded="true" aria-controls="collapseCert'+ certs +'">Certification '+ certs +'<h5 class="mb-0" style="display:inline;"></h5>  </a><a class="btn btn-danger btn-sm pull-right removeCert" id="btnRemoveCert'+ certs +'"><span class="fa fa-trash-o mr-1"></span>Remove</a></div><div id="collapseCert'+ certs +'" class="collapse" role="tabpanel" aria-labelledby="headingCert'+ certs +'"><div class="card-block"><div class="form-group row"><label for="textCertTitle'+ certs +'" class="col-3 col-form-label">Certificate Title:</label><div class="col-9"><input class="form-control" type="text" value="CCNA" id="textCertTitle'+ certs +'" placeholder="Enter certificate title..."></div></div><div class="form-group row"><label for="textCertBody'+ certs +'" class="col-3 col-form-label">Certificate Body:</label><div class="col-9"><input class="form-control" type="text" value="CISCO" id="textCertBody'+ certs +'" placeholder="Enter certificate body or certification provider..."></div></div></div></div></div>');
    });
});