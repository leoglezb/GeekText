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
				<li><a href="<c:url value="browsebooks"/>">Browse</a></li>
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
				<h1>${userdetails.firstname}Account</h1>
				<form class="form-horizontal" id="registerHere">
					<fieldset>

						<div class="span6" id="ProfileManagement">

							<div class="col-10 col-md-10">
								<p>
									<span style="font-weight: bold;">First Name: </span>${userdetails.firstname}</p>
								<p>
									<span style="font-weight: bold;">Last Name: </span>${userdetails.lastname}</p>
								<p>
									<span style="font-weight: bold;">Nick Name: </span>${userdetails.nickname}</p>
								<p>
									<span style="font-weight: bold;">Email: </span>${userdetails.username}</p>
								<p>
									<span style="font-weight: bold;">Addresses on file:</span> <select
										name="addresss">
										<c:forEach items="${userdetails.addresses}" var="address">
											<option value="card1">${address.address1} &#44; ${address.city} &nbsp; ${address.state}  &nbsp; ${address.country}</option>
										</c:forEach>
									</select>
								</p>

								<p>
									<span style="font-weight: bold;">Credit Cards on file:</span> <select
										name="cards">
										<c:forEach items="${userdetails.cards}" var="card">
											<option value="card1">${card.description}</option>
										</c:forEach>
									</select>
								</p>


								<div class="button-awesome row">
									<div class="col-md-3" style="margin: 0px; padding: 0px;">
										<a href="<c:url value="editprofile"/>" class="btn btn-full">Edit
											Profile</a>
									</div>
									<div class="col-md-3" style="margin: 0px; padding: 0px;">
										<a href="<c:url value="editpassword"/>" class="btn btn-full">Edit
											Password</a>
									</div>
									<div class="col-md-3" style="margin: 0px; padding: 0px;">
										<a href="<c:url value="address"/>" class="btn btn-full">Add
											Address</a>
									</div>
									<div class="col-md-3" style="margin: 0px; padding: 0px;">
										<a href="<c:url value="creditcard"/>" class="btn btn-full">Add
											Credit Card</a>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<hr>

	<div class="row footer">
		<div class="col-md footer-left">
			<ul class="footer-list">
				<li><a href="/GeekText">Home</a></li>
				<li><a href="<c:url value="browsebooks"/>">Browse</a></li>
				<li><a href="<c:url value="topsellers"/>">Top Sellers</a></li>
				<li><a href="<c:url value="shoppingcart"/>">Cart</a></li>
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

</body>
</html>