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
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="row site-nav">
		<div class="col-md-12">
			<div class="logo">
				<a href="/GeekText"><h1>Geek Books</h1></a>
			</div>
			<ul class="nav-list">
				<li><a href="<c:url value="/browsebooks"/>">Browse</a></li>
				<li><a href="<c:url value="/shoppingcart"/>">Cart</a></li>

				<c:if test="${empty userdetails}">
					<li><a href="<c:url value="/logIn"/>">Sign In</a></li>
				</c:if>
				<c:if test="${not empty userdetails}">
					<li><div class="dropdown">
							<button type="button" class="btn dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Hello ${userdetails.firstname}</button>
							<div class="dropdown-menu">
								<a class="dropdown-item"
									href="<c:url value="/profilemanagement"/>">Profile</a> <a
									class="dropdown-item" href="<c:url value="/signout"/>">Log
									Out</a>
							</div>
						</div></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="margin-left: 30px;">
				<h1>${userdetails.firstname}'sAccount</h1>
				<form class="form-horizontal" id="updateuser">
					<fieldset>
						<div class="span6">
							<div class="control-group">
								<label class="control-label" for="input01">First name</label>
								<div class="controls">
									<input type="text" id="user_firstname" required
										name="user_firstname" value="${userdetails.firstname}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">Last name</label>
								<div class="controls">
									<input type="text" id="user_lastname" required
										name="user_lastname" value="${userdetails.lastname}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">Nickname</label>
								<div class="controls">
									<input type="text" id="user_nickname" required
										name="user_nickname" value="${userdetails.nickname}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01"></label>
								<div class="controls">
									<div class="btn-group">
										<button type="submit" class="btn btn-full"
											onClick="addNewInfo()">Update</button>
									</div>
									<div class="btn-group">
										<button type="cancel" class="btn btn-full"
											onclick="window.location='http://localhost:8080/GeekText/profilemanagement';return false;">Back to Profile</button>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
				<form id="formCancel" method='GET' action='.'></form>
			</div>
		</div>
	</div>
	<hr>

	<footer>
		<div class="container"></div>
		<div class="row footer">
			<div class="col-md footer-left">
				<ul class="footer-list">
					<li><a href="/GeekText">Home</a></li>
					<li><a href="<c:url value="/browsebooks"/>">Browse</a></li>
					<li><a href="<c:url value="/profilemanagement"/>">Profile</a></li>
					<li><a href="<c:url value="/shoppingcart"/>">Cart</a></li>
				</ul>
			</div>
			<div class="col-md footer-right">
				<h5>Team Marvelous</h5>
				<p>
					Software Engineering 1<br>Professor Alex Roque<br>Fall
					2017
				</p>
			</div>
		</div>
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
		function addNewInfo() {
			var user_firstname = document.getElementById("user_firstname").value;
			var user_lastname = document.getElementById("user_lastname").value;
			var user_nickname = document.getElementById("user_nickname").value;
			var param = {
				user_firstname : user_firstname,
				user_lastname : user_lastname,
				user_nickname : user_nickname
			}
			$.ajax({
				type : "POST",
				url : "updateuser",
				data : param,
				success : function(result) {
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
			user_firstname = [ 0 ];
			sortProperty = "";
			sortOrder = "";
		}
	</script>
</body>
</html>

