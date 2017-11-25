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


<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">

<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="resources/css/custom.css">

</head>
<body>
	<div class="container">
		<div class="row">
			<form class="form-signin" id="registerHere" method='post'
				action='createuser' enctype="multipart/form-data">

				<h2 class="form-signin-heading">Please sign up</h2>
				<fieldset>
					<c:if test="${registered==1}">
						<div class="alert alert-success">Well done! Congratulations,
							you are registered!</div>
					</c:if>
					<c:if test="${registered==0}">
						<div class="alert alert-success">Sorry, this email has
							already been taken.</div>
					</c:if>

					<div class="span6">
						<div class="control-group">
							<label class="sr-only" for="input01">Email</label>
							<div class="controls">
								<input type="email" id="user_email" class="form-control"
									placeholder="Email" required name="user" value="${user_email}">
							</div>
						</div>
						<div class="control-group">
							<label class="sr-only" for="input01">First name</label>
							<div class="controls">
								<input type="text" id="user_firstname" class="form-control"
									placeholder="First Name" required name="user_firstname">
							</div>
						</div>
						<div class="control-group">
							<label class="sr-only" for="input01">Last name</label>
							<div class="controls">
								<input type="text" id="user_lastname" class="form-control"
									placeholder="Last Name" required name="user_lastname">
							</div>
						</div>
						<div class="control-group">
							<label class="sr-only" for="input01">Nickname</label>
							<div class="controls">
								<input type="text" id="user_nickname" class="form-control"
									placeholder="Nick Name" required name="user_nickname">
							</div>
						</div>
						<div class="control-group">
							<label class="sr-only" for="input01">Password</label>
							<div class="controls">
								<input type="password" id="password" class="form-control"
									placeholder="Password" required name="password">
							</div>
						</div>
						<div class="control-group">
							<label class="sr-only" for="input01">Confirm Password</label>
							<div class="controls">
								<input type="password" id="cpwd" class="form-control"
									placeholder="Confirm Password" required name="cpwd">
							</div>
						</div>					
						<div class="control-group">
							<label class="sr-only" for="input01"></label>
							<div class="controls">
								<div class="btn-group">
									<button type="submit" class="btn btn-lg btn-primary btn-block">Sign
										Up</button>
								</div>
								<div class="btn-group">
									<button type="cancel" class="btn btn-lg btn-primary btn-block"
										onclick="window.location='http://localhost:8080/GeekText';return false;">Home</button>
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap-transition.js"></script>
	<script src="resources/js/bootstrap-alert.js"></script>
	<script src="resources/js/bootstrap-modal.js"></script>
	<script src="resources/js/bootstrap-dropdown.js"></script>
	<script src="resources/js/bootstrap-scrollspy.js"></script>
	<script src="resources/js/bootstrap-tab.js"></script>
	<script src="resources/js/bootstrap-tooltip.js"></script>
	<script src="resources/js/bootstrap-popover.js"></script>
	<script src="resources/js/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							jQuery.validator.addMethod("accept", function(
									value, element, param) {
								if (value == null || value == "") {
									return true;
								}
								var validator = new RegExp(param);
								var result = validator
										.test(value.toLowerCase());
								return result;
							});
							$("#registerHere")
									.validate(
											{
												rules : {
													user : {
														required : true,
														email : true
													},
													user_firstname : {
														required : true
													},
													user_lastname : {
														required : true
													},
													user_nickname : {
														required : true
													},
													password : {
														required : true,
														minlength : 8
													},
													cpwd : {
														required : true,
														equalTo : "#password"
													}
												},
												messages : {
													user : {
														required : "Email address is required",
														email : "Enter valid email address"
													},
													user_firstname : "Enter your first name",
													user_lastname : "Enter your last name",
													user_nickname : "Enter your nickname",
													password : {
														user_password : "Enter your password",
														required : "Password must be 8 characters in length, contain 1 Numerical Value, 1 Uppercase and 1 Lowercase letter",
														minlength : "Password must be minimum 8 characters"
													},
													cpwd : {
														required : "Enter confirm password",
														equalTo : "Password and Confirm Password must match"
													}
												},
												errorClass : "error",
												validClass : "checked",
												errorPlacement : function(
														error, element) {
													var wrapedError = wrapError(
															error, element,
															'leftarrow')
													wrapedError
															.insertAfter(element);
													var img = $("<div class='errorImage'></div>");
													img
															.insertBefore(wrapedError);
													wrapedError
															.css(
																	'left',
																	element
																			.offset().left
																			+ element
																					.width()
																			+ 47);
													wrapedError
															.css(
																	"top",
																	element
																			.offset().top);
												},
												success : function(element) {
													$(element).addClass(
															"checked");
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element).addClass(
															errorClass)
															.removeClass(
																	validClass);
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element).removeClass(
															errorClass)
															.addClass(
																	validClass);
												}
											});
							$('#cancel').click(function() {
								$('#formCancel').submit();
							});
						});
	</script>
</body>
</html>

