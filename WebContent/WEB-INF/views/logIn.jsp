<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>

<title>Geek Text</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>

<body>

	<div class="container">

		<form id="loginform" class="form-signin" action="j_spring_security_check"
			method="POST">
			<h2 class="form-signin-heading">Please Log in</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" class="form-control" name="j_username" id="j_username"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" name="j_password" id="j_password"
				class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<div class="checkbox">
				<a href="#" style="text-decoration: none; color: black;"><small>
						New User? Click Here</small> </a>
			</div>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Log
				in</button>
		</form>

	</div>
	<!-- /container -->
</body>
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
	<script src="resources/js/bootstrap-button.js"></script>
	<script src="resources/js/bootstrap-collapse.js"></script>
	<script src="resources/js/bootstrap-carousel.js"></script>
	<script src="resources/js/bootstrap-typeahead.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>
	<script type="text/javascript" src="resources/js/getOffsets.1.0.js"></script>
	<script type="text/javascript" src="resources/js/jquery.placeholder.js"></script>

<script type="text/javascript">
	$("#loginform").validate({
		rules : {
			j_username : {
				required : true,
				email : true
			},
			j_password : {
				required : true,
			}
		},
		messages : {
			j_username : {
				required : "Email address is required",
				email : "Enter valid email address"
			},
			j_password : {
				required : "Password is required",
			}
		},
		errorClass : "error",
		validClass : "checked",
		errorPlacement : function(error, element) {
			var wrapedError = wrapError(error, element, 'rightarrow')
			wrapedError.insertAfter(element);
			var img = $("<div class='errorImage'></div>");
			img.insertBefore(wrapedError);
			wrapedError.css('right', element.getOffsets({
				directions : [ 'right' ]
			}) - 50 + 'px');
			wrapedError.css("top", element.position().top);

		},
		success : function(element) {
			$(element).addClass("checked");
		},
		highlight : function(element, errorClass, validClass) {
			$(element).addClass(errorClass).removeClass(validClass);
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).removeClass(errorClass).addClass(validClass);
		}
	});
</script>
</html>
