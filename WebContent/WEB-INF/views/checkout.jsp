<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html lang="en">

<head>

<title>Confirm Order</title>

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
								<a class="dropdown-item" href="<c:url value="/profilemanagement"/>">Profile</a> <a
									class="dropdown-item" href="<c:url value="/signout"/>">Log
									Out</a>
							</div>
						</div></li>
				</c:if>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<h1 style="text-align: center;">Checkout</h1>
			<h3 style="text-align: left;">Books</h3>
		</div>
	</div>

	<div class="row books-book">
		<c:forEach items="${inCart}" var="item">
			<div class="col-sm-3">
				<div class="imageContainer">
					<img src="resources/img/bookcover/${item.book.bookid}.png"
						class="img-fluid" height="150" width="300" />
				</div>
			</div>
			<div class="col-sm-3">
				<a href="bookdetails?bookid=${item.book.bookid}"><h3
						class="book-information">${item.book.title}</h3></a> <a
					href="author?authorid=${item.book.author.authorid}"><h5
						class="book-information">${item.book.author.firstname}&nbsp;${item.book.author.lastname}</h5></a>
			</div>
			<div class="col-sm-3">
				<p class="book-information" style="margin: 15px;">${item.book.avgrating}</p>
				<p class="book-information" style="margin: 15px;">${item.book.price}</p>
				<p class="book-information" style="margin: 15px;">${item.book.releasedate}</p>
			</div>
			<div class="col-sm-3">
				<div class="row">
					<div class="col-sm">
						<p>Quantity: ${item.quantity}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="row">
		<div class="col-md-12">
			<h3 style="text-align: left;">Account Confirmation</h3>
		</div>
	</div>

	<div class="row" style="margin-left: 30px;">
		<div class="col-sm">
			<p>
				<span style="font-weight: bold;">Full Name:</span>
				${userdetails.firstname} &nbsp; ${userdetails.lastname}
			</p>
			<p>
				<span style="font-weight: bold;">Nick Name:</span>
				${userdetails.nickname}
			</p>
			<p>
				<span style="font-weight: bold;">Email:</span> ${userdetails.email}
			</p>
			
			<p>
				<span style="font-weight: bold;">Shipping Address:</span> <select
					name="addresss">
					<c:forEach items="${userdetails.addresses}" var="address">
						<option value="card1">${address.address1} &#44; ${address.city} &nbsp; ${address.state}  &nbsp; ${address.country}</option>
					</c:forEach>
				</select>
			</p>
			
			<p>
				<span style="font-weight: bold;">Credit Card:</span> <select
					name="cards">
					<c:forEach items="${userdetails.cards}" var="card">
						<option value="card1">${card.description}</option>
					</c:forEach>
				</select>
			</p>
			
			
			<h3 style="text-align: right;">
				Total:<span>${total}</span>
			</h3>
			<a href="<c:url value="/profilemanagement"/>" style="float: left;" class="btn btn-full">Select
				Different Info</a> <a href="<c:url value="/confirmorder"/>" style="float: right;"
				class="btn btn-full">Confirm</a>
		</div>
	</div>

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
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


</html>
