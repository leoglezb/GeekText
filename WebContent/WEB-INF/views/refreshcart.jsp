<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html lang="en">

<head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
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
				<h3 style="text-align: right; padding-right: 15px;">
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
</body>


</html>
