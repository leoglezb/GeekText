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
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
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
			<legend>Registration</legend>
			<form class="form-horizontal" id="registerHere" method='post' action='createuser' enctype="multipart/form-data">
				<fieldset>
					<c:if test="${registered==1}">
						<div class="alert alert-success">Well done!
							Congratulations, you are registered!</div>
					</c:if>
					<c:if test="${registered==0}">
						<div class="alert alert-success">Sorry, this username has
							already been taken.</div>
					</c:if>

					<div class="span6">
						<div class="control-group">
							<label class="control-label" for="input01">Email</label>
							<div class="controls">
								<input type="text" id="user_email" name="user" value="${user_email}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">First name</label>
							<div class="controls">
								<input type="text" id="user_firstname"
									name="user_firstname">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Last name</label>
							<div class="controls">
								<input type="text" id="user_lastname"
									name="user_lastname">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Password</label>
							<div class="controls">
								<input type="password" id="password" name="password">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Confirm Password</label>
							<div class="controls">
								<input type="password" id="cpwd" name="cpwd">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01"></label>
							<div class="controls">
								<div class="btn-group">
									<button type="submit" class="btn btn-primary" title="first tooltip">Create account</button>
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
					user : {
						required : true,
						email : true
					},
					user_firstname : {
						required : true
					},
					password : {
						required : true,
						minlength : 3
					},
					cpwd : {
						required : true,
						equalTo : "#password"
					},
					photo:{
						accept:'^.*\.(jpg|jpeg|png|gif)$' 
					}					
				},
				messages : {
					user : {
						required : "Email address is required",
						email : "Enter valid email address"
					},
					user_firstname: "Enter your first and last name",
					password : {
						required : "Enter your password",
						minlength : "Password must be minimum 6 characters"
					},
					cpwd : {
						required : "Enter confirm password",
						equalTo : "Password and Confirm Password must match"
					},
					photo:{
						accept: "Only image type jpg/png/jpeg/gif is allowed"
					}
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
	</script>
</body>
</html>

