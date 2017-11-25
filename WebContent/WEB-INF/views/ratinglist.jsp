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
								<a class="dropdown-item" href="<c:url value="/profilemanagement"/>">Profile</a> <a
									class="dropdown-item" href="<c:url value="/signout"/>">Log
									Out</a>
							</div>
						</div></li>
				</c:if>
			</ul>
		</div>
	</div>

	<div class="row book-details">
		<div class="col-md-3 book-details-left">
			<div class="imageContainer">
				<img src="resources/img/bookcover/${book.bookid}.png"
					class="img-fluid" style="margin-left: 15px;" 100" width="200" " />
			</div>
		</div>
		<div class="col-md-9  book-details-right">

			<h1>${book.title}</h1>
			<a href="<c:url value="author?authorid=${book.author.authorid}"/>"><h3>${book.author.firstname}&nbsp;${book.author.lastname}</h3></a>
			<p>Author Bio: ${book.author.biography}</p>
			<p>Book Description: ${book.description}</p>
			<p>Genre: ${book.genre.name}</p>
			<p>Publisher: ${book.publisher.name}</p>
			<p>Release Date: ${book.releasedate}</p>
			<p id="avg">Average Book Rating: ${book.avgrating}</p>
			<a href="<c:url value="addCart?bookId=${book.bookid}"/>"><button
					type="button" class="btn btn-lg">Add to Shopping Cart</button></a>
		</div>
	</div>
	<div class="col-md-12">
		<div class="rowRating" style="margin-right: 100px">
			<input type=hidden id=bookid value="${book.bookid}">

			<div id="ratingErr">*Must add a star rating*</div>
			<input class="star star-5" id="star-5" type="radio" name="star" /> 
	        <label class="star star-5" for="star-5"></label> 
	        <input class="star star-4" id="star-4" type="radio" name="star" /> 
	        <label class="star star-4" for="star-4"></label>
	        <input class="star star-3" id="star-3" type="radio" name="star" /> 
	        <label class="star star-3" for="star-3"></label>
			<input class="star star-2" id="star-2" type="radio" name="star" /> 
			<label class="star star-2" for="star-2"></label> 
			<input class="star star-1" id="star-1" type="radio" name="star" /> 
			<label class="star star-1"for="star-1"></label>
		</div>
	</div>

	<div class="rowTextbox" style="margin-left: 30px">
		<div id="commentErr">*Cannot leave an empty comment*</div>
		<textarea id="commentArea" rows="4" cols="40" maxlength=140></textarea>
		<c:if test="${!canComment}">
			<script type="text/javascript">
				function winLoad() {
					document.getElementById("commentArea").disabled = true;
					document.getElementById("sendButton").disabled = true;
					document.getElementById("star-1").disabled = true;
					document.getElementById("star-2").disabled = true;
					document.getElementById("star-3").disabled = true;
					document.getElementById("star-4").disabled = true;
					document.getElementById("star-5").disabled = true;
				}
				window.onload = winLoad;
			</script>
		</c:if>
	</div>
	<div>
		<button type="button" id="sendButton" onclick="sendFunc()"
			style="margin-left: 30px">Send</button>
	</div>


	<div class="row comments">
		<div class="col-md">
			<h3 style="font-weight: bold;">Comments</h3>
			<div class="user-comment" id="list">
				<c:forEach items="${ratingList}" var="rating">
					<h5>
						<c:choose>
							<c:when test="${rating.user.anonymous == 1}">
							Name: Anonymous<br />
							</c:when>
							<c:otherwise>
							Name: ${rating.user.nickname}<br />
							</c:otherwise>
						</c:choose>
					</h5>
					<p style="margin: 0px;">${rating.comment}</p>
					<p style="margin: 0px;">Rating: ${rating.rating}</p>
				</c:forEach>
			</div>
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
</html>
