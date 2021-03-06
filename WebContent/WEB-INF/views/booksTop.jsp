<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Geek Text - Books</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
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

	<div class="row books-details">
		<div class="col-sm-6">
			<div class="col-sm-6">
				<h3>
					<a href="<c:url value="browsebooks"/>" style="color: black;">Browse
						All</a> <a href="<c:url value="topsellers"/>"
						style="color: black; text-decoration: underline;">Top Seller</a>
				</h3>

			</div>
		</div>
	</div>

	<div class="row books-row">
		<div class="col-md-12 books-mainside">
			<div class="row books-book">
				<c:forEach items="${bookList}" var="book">
					<div class="col-sm-3">
						<div class="col-sm">
							<img src="resources/img/bookcover/${book.bookid}.png">
						</div>
					</div>
					<div class="col-sm-3">
						<h3 class="book-information">${book.title}</h3>
						<a href="<c:url value="author?authorid=${book.author.authorid}"/>"><h5
								class="book-information">${book.author.firstname}&nbsp;${book.author.lastname}</h5></a>
					</div>
					<div class="col-sm-3">
						<p class="book-information" style="margin: 15px;">${book.avgrating}</p>
						<p class="book-information" style="margin: 15px;">${book.price}</p>
						<p class="book-information" style="margin: 15px;">${book.releasedate}</p>
						<p class="book-information" style="margin:15px;">Sold: ${book.sold}</p>
					</div>
					<div class="col-sm-3">
						<a href="<c:url value="bookdetails?bookid=${book.bookid}"/>"><p
								class="btn btn-full">See More</p></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>

</html>