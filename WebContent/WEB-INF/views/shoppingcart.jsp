<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html lang="en">

<head>

<title>Shopping Cart</title>

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

	<div id="CartInfo">
		<div class="row" style="border-bottom: solid;">
			<div class="col-sm">
				<h1 style="text-align: center;">Shopping Cart</h1>
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
							<label>Quantity:</label> <input id="Item${item.cartItemId}"
								type="number" name="quantity" value="${item.quantity}" min="1"
								onkeydown="return false"
								onChange="updateQty(${item.cartItemId})" />
						</div>
						<div class="col-sm">
							<a style="color: black" onClick="saveForLater(${item.cartItemId})">Save for Later</a>
							<br/><a style="color: black" onClick="removeFromCart(${item.cartItemId})">Remove from cart</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row">
			<div class="col-sm">
				<h3 style="text-align: right;">
					Total:<span>${total}</span>
				</h3>
				<c:if test="${fn:length(inCart) gt 0}">
				<a href="<c:url value="/checkout"/>" style="float: right;" class="btn btn-full">Check
					Out</a>
				</c:if>
			</div>
		</div>
		<c:if test="${fn:length(saved) gt 0}">
			<div class="row" style="border-bottom: solid; border-top: solid;">
				<div class="col-sm">
					<h2 style="text-align: center;">Saved for Later</h2>
				</div>
			</div>

			<div class="row books-book">

				<c:forEach items="${saved}" var="item">
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
								<!--  <label>Quantity:</label> <input id="Item${item.cartItemId}" type="number"
							name="quantity" value="${item.quantity}" min="1" onkeydown="return false" onChange="updateQty(${item.cartItemId})"/>
						-->
							</div>
							<div class="col-sm">
								<a style="color: black;" onClick="backToCart(${item.cartItemId})">Move Back to Cart</a>
								<br/><a style="color: black" onClick="removeFromCart(${item.cartItemId})">Remove from cart</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</c:if>

	</div>
	<div class="row footer">
		<div class="col-sm-6 footer-left">
			<ul class="footer-list">
				<li><a href="index">Home</a></li>
				<li><a href="books.html">Browse</a></li>
				<li><a href="profile.html">Profile</a></li>
				<li><a href="shoppingCart.html">Cart</a></li>
			</ul>
		</div>
		<div class="col-sm-6 footer-right">
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

<script type="text/javascript">
function updateQty(itemId) {
	var qty = document.getElementById("Item" + itemId).value;
	var search = {
			itemId : itemId,
			qty : qty 
		}
	$.ajax({
		type : "GET",
		url : "updateQty",
		data : search,
		success : function(result) {
			$('#CartInfo').html(result);
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
	
}

function saveForLater(itemId) {
	var search = {
			itemId : itemId
		}
	$.ajax({
		type : "GET",
		url : "saveForLater",
		data : search,
		success : function(result) {
			$('#CartInfo').html(result);
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
	
}

function backToCart(itemId) {
	var search = {
			itemId : itemId
		}
	$.ajax({
		type : "GET",
		url : "backToCart",
		data : search,
		success : function(result) {
			$('#CartInfo').html(result);
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
	
}

function removeFromCart(itemId) {
	var search = {
			itemId : itemId
		}
	$.ajax({
		type : "GET",
		url : "removeFromCart",
		data : search,
		success : function(result) {
			$('#CartInfo').html(result);
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
	
}
</script>

</html>
