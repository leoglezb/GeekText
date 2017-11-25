<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/leandro prototype.css"
	type="text/css">
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
								<label class="control-label" for="input01">Home Address</label>
								<div class="controls">
									<select id="HomeId" name="addresss">
										<c:forEach items="${userdetails.addresses}" var="address">
											<c:if
												test="${userdetails.homeAddress.addressId == address.addressId}">
												<option value="${address.addressId}" selected="selected">${address.address1} &#44; ${address.city} &nbsp; ${address.state}  &nbsp; ${address.country}</option>
											</c:if>
											<c:if
												test="${userdetails.homeAddress.addressId != address.addressId}">
												<option value="${address.addressId}">${address.address1} &#44; ${address.city} &nbsp; ${address.state}  &nbsp; ${address.country}</option>
											</c:if>
										</c:forEach>
									</select>
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
											onclick="window.location='http://localhost:8080/GeekText/profilemanagement';return false;">Back
											to Profile</button>
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

</body>
</html>
