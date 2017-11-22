<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>GeekText user registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="max-1200 container-fluid">
				<div class="row-fluid">
					<div class="span4">
						<a class="brand" href="#"> <img
							src="resources/img/books-logo.png">
						</a>
					</div>
					<div class="span8">
						<p class="masthead">Great Books, for Geeks &amp; for All!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<legend>Address</legend>
			<form class="form-horizontal" id="registerHere">
				<fieldset>
					
					<div class="span6" id="Address">
						<div class="control-group">
							<label class="control-label" for="input01">Address 1</label>
							<div class="controls">
								<input type="text" id="address1" name="address1">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Address 2</label>
							<div class="controls">
								<input type="text" id="address2"
									name="address2">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">City</label>
							<div class="controls">
								<input type="text" id="city"
									name="city">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">State</label>
							<div class="controls">
								<input type="text" id="state"
									name="state">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Country</label>
							<div class="controls">
								<input type="text" id="country" name="country">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Zip</label>
							<div class="controls">
								<input type="text" id="zipCode" name="zipCode">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01"></label>
							<div class="controls">
								<div class="btn-group">
									<button type="submit" class="btn btn-primary"  onClick="addAddress()">Submit</button>
								</div>
								<div class="btn-group">
									<button id="cancel" type="button" class="btn btn-primary" title="first tooltip">Back to home</button>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
			<form id="formCancel" method='GET' action='.'></form>
		</div>
	</div>
	<hr>

	<footer>
		<div class="container"></div>
	</footer>

	<!--/.fluid-container-->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.js"></script>
	<script	src="resources/js/bootstrap-transition.js"></script>
	<script	src="resources/js/bootstrap-alert.js"></script>
	<script	src="resources/js/bootstrap-modal.js"></script>
	<script	src="resources/js/bootstrap-dropdown.js"></script>
	<script	src="resources/js/bootstrap-scrollspy.js"></script>
	<script	src="resources/js/bootstrap-tab.js"></script>
	<script	src="resources/js/bootstrap-tooltip.js"></script>
	<script	src="resources/js/bootstrap-popover.js"></script>
	<script src="resources/js/bootstrap-fileupload.js"></script>
	<script type="text/javascript"	src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>
	<script type="text/javascript">
	function addAddress() {
		//DO FORMS
		
		//var address1 = document.getElementById("address1").value;
		//var address2 = document.getElementById("address2").value;
		//var city = document.getElementById("city").value;
	//	var state = document.getElementById("state").value;
		//var country = document.getElementById("country").value;
		//var zip = document.getElementById("zip").value;
			
		var param = {
			address1 : "asfgsdf",
			address2 : "sdgfsdfgsfd",
			city : "asdgggggggg",
			state : "as" ,
			country : "aaff",
			zip : 10012
		}
		alert("we made it");
		$.ajax({
			type : "POST",
			url : "addAddress",
			data : param,
			success : function(result) {
				alert("It worked!");

			},
			error : function(jqXHR, exception) {
				var msg = '';
				if (jqXHR.status === 0) {
					msg = 'Not connect.\n Verify Network.';
				} else if (jqXHR.status == 404) {
					msg = 'Requested page not found. [404]';
				} else if (jqXHR.status == 500) {
					msg = 'Internal Server Error [500].';
				} else if (exception === 'parsererror') {
					msg = 'Requested JSON parse failed.';
				} else if (exception === 'timeout') {
					msg = 'Time out error.';
				} else if (exception === 'abort') {
					msg = 'Ajax request aborted.';
				} else {
					msg = 'Uncaught Error.\n' + jqXHR.responseText;
				}
				alert("Error " + msg);
			}
		});
		address1 = [ 0 ];
		sortProperty = "";
		sortOrder = "";
	}
	</script>
	<!-- script type="text/javascript">
		$(document).ready(function() {
			jQuery.validator.addMethod("accept", function(value, element, param) {
				if(value==null || value==""){
					return true;
				}
				var validator =new RegExp(param);
				var result = validator.test(value.toLowerCase());
				return result;
			});	
			$("#registerHere").validate({
				rules : {
					address1 : {
						required : true,
						minlength: 3, 
						maxlength : 45
					},
					address2 : {
						required : false,
						maxlength : 45
					},
					city: {
						required : true,
						minlength: 3, 
						maxlength : 45
					},
					state : {
						required : true,
						minlength : 2,
						maxlength : 2
					},
					country: {
						required : true,
						minlength : 3,
						maxlength : 45
					},
					zipCode : {
						required : true,
						minlength : 5,
						maxlength : 5
					},					
				},
				messages : {
					address1 : {
						address1: "Enter your address",
						required : "Address 1 Field is required",
						minlength : "Minimum length is 3 characters",
						maxlength : "Maximum length is 45 characters"
					},
					address2 : {
						address2: "Enter your address",
						required : "Address 2 Field is not required",
						maxlength : "Maximum length is 45 characters"
					},
					city : {
						city: "City is required",
						required : "City is required",
						minlength : "Minimum length is 3 characters",
						maxlength : "Maximum length is 45 characters"
					},
					state : {
						state: "State is required",
						required : "State is required",
						minlength : "Minimum length is 2 characters",
						maxlenth: "Maximum length is 2 characters"
					},
					country : {
						country: "Country is required",
						required : "Country is required",
						minlength : "Minimum length is 3 characters",
						maxlength : "Maximum length is 45 characters"
					},
					zipCode : {
						zipCode: "Zip code is required",
						required : "Zip code is required",
						minlength : "Zip code must be 5 characters",
						maxlength : "Maximum length is 5 characters"
					},
				},
			    errorClass: "error",
			    validClass: "checked",
			    errorPlacement: function(error, element) {
			    	var wrapedError = wrapError(error,element,'leftarrow')
			        wrapedError.insertAfter(element);
			    	var img = $("<div class='errorImage'></div>");
			    	img.insertBefore(wrapedError);
			        wrapedError.css('left',element.offset().left + element.width() + 47);
			        wrapedError.css("top", element.offset().top);
			    },
			    success: function(element) {
			    	$(element).addClass("checked");
			    },
			    highlight: function (element, errorClass, validClass) {
	                $(element).addClass(errorClass).removeClass(validClass);
		        },
		        unhighlight: function (element, errorClass, validClass) {
		                $(element).removeClass(errorClass).addClass(validClass);
		        }		    
			});
			$('#cancel').click(function() {
				$('#formCancel').submit();
			});
		});
	</script> -->
</body>
</html>

	