<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>GeekText</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<!-- HTML5 shim, for IE support of HTML5 elements -->
<!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resources/ico/z144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resources/ico/z114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resources/ico/z72.png">
<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
<link rel="shortcut icon" href="resources/ico/favicon.png">
</head>

<body>
	<!-- Header START -->
	<!-- Nav START -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="max-1200 container-fluid">
				<div class="row-fluid">
					<div class="span4">
						<a class="brand" href="#"> <img
							src="resources/img/logo-zoowaa.png" alt="">
						</a>
					</div>
					<div class="span8">
						<p class="masthead">Great Books, for Geeks &amp; for All!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Nav END -->
	<!-- Header END -->
	<!-- Container START -->
	<div class="container">
		<div class="row">
			<div class="span8">
				<h2>Actions:</h2>
				<hr>
				<!-- Dynamic Info START -->
				<div class="dynamic-info">
					<div class="result">
						<div class="number">566</div>
						<p>
							<a href="serviceexchange">Service exchange</a>
						</p>
					</div>
				</div>
				<!-- Dynamic Info END -->
				<!-- Search input START -->
				<!-- Search input END -->
			</div>
			<!-- Sidebar START -->
			<div class="span4">
				<!-- TAB START -->
				<div class="bs-docs-example">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#connect" data-toggle="tab"><strong>Connect
									to GeekText</strong></a></li>
						<li class=""><a href="#login" data-toggle="tab"><strong>Login</strong></a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<p>Signup with your email</p>
						<div class="input-append">
							<form id="registerHere" name="registerHere" action="registeruser"
								method="GET">
								<input placeholder="Enter your email" type="text"
									name="user_email" id="user_email">
								<button id="regHereBtn" class="btn" type="submit">Signup</button>
							</form>
						</div>
					</div>
					<div class="tab-pane fade" id="login"
						style="position: relative; overflow: hidden">
						<div class="input-append">
							<form id="loginform" name="loginform"
								action="j_spring_security_check" method="POST">
								<input type="text" placeholder="Enter your email"
									name="j_username" id="j_username"><br> <br> <input
									type="password" placeholder="Password" name="j_password"
									id="j_password">
								<div class="control-group">
									<div class="controls">
										<label class="checkbox"> <input type="checkbox"
											name="_spring_security_remember_me"
											id="_spring_security_remember_me" value="1"> Remember
											me
										</label>
										<button type="submit" class="btn">Sign in</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- TAB END -->
		</div>
		<!-- Sidebar END -->
	</div>


	<!-- FOOTER -->
	<div class="container">
		<div class="row">
			<footer>
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; Geektext &middot; <a href="#">Home</a> &middot; 
				</p>
			</footer>
		</div>
	</div>

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
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
		$(document)
				.ready(
						function() {
							$('input, textarea').placeholder();
							$('form *')
									.keypress(
											function(e) {
												if ((e.which && e.which == 13)
														|| (e.keyCode && e.keyCode == 13)) {
													e.preventDefault();
													$(this)
															.parents('form')
															.find(
																	'[type=button]')
															.eq(0).focusin()
															.click();
													$(this)
															.parents('form')
															.find(
																	'[type=submit]')
															.eq(0).focusin()
															.click();
													return false;
												}
											});
							$('#pass').on('click', function(e) {
								codeAddress();
								return false;
							});
							$('#myModal')
									.on(
										'show',
											function() {
												$("#2")
														.attr(
																"src",
																"http://www.youtube.com/embed/zMmHAdstBeo?feature=player_embedded&controls=0&rel=0&showinfo=0&autohide=1&autoplay=1");
											})
							$('#myModal').on('hidden', function() {
								$("#2").attr("src", "");
							})
							$("#registerHere")
									.validate(
											{
												rules : {
													user_email : {
														required : true,
														email : true
													}
												},
												messages : {
													user_email : {
														required : "Enter your email address",
														email : "Enter valid email address"
													}
												},
												errorClass : "error",
												validClass : "checked",
												errorPlacement : function(
														error, element) {
													var wrapedError = wrapError(
															error, element,
															'rightarrow')
													wrapedError
															.insertAfter($("#regHereBtn"));
													$(
															"<div class='errorImage'></div>")
															.insertBefore(
																	wrapedError);
													wrapedError
															.css(
																	'right',
																	$(window)
																			.width()
																			- element
																					.offset().left
																			- element
																					.width()
																			- 75);
													wrapedError
															.css(
																	"top",
																	element
																			.offset().top - 5);
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
												},
												success : function(element) {
													$(element).addClass(
															"checked");
												}
											});
							$("#loginform")
									.validate(
											{
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
												errorPlacement : function(
														error, element) {
													var wrapedError = wrapError(
															error, element,
															'rightarrow')
													wrapedError
															.insertAfter(element);
													var img = $("<div class='errorImage'></div>");
													img
															.insertBefore(wrapedError);
													wrapedError
															.css(
																	'right',
																	element
																			.getOffsets({
																				directions : [ 'right' ]
																			})
																			- 50
																			+ 'px');
													wrapedError
															.css(
																	"top",
																	element
																			.position().top);

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
							initialize();
						});
	</script>
</body>
</html>
