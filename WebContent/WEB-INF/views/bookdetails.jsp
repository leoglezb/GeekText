<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html lang="en">

<head>

<title>Book Details</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-beta.1.css"
	type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/5star.css">

<style>
#commentErr {
	display: none;
	color: red;
}

#ratingErr {
	display: none;
	color: red;
}
</style>
</head>

<body>
	<div class="row site-nav">
		<div class="col-md-12">
			<div class="logo">
				<a href="index"><h1>Geek Books</h1></a>
			</div>
			<ul class="nav-list">
				<li><a class="prettyHover" href="books.html">Browse</a></li>
				<li><a class="prettyHover" href="shoppingCart.html">Cart</a></li>
				<li><div class="dropdown">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="profile.html">Profile</a> <a
								class="dropdown-item" href="logIn.html">Log Out</a>
						</div>
					</div></li>
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
			<a href="author.html"><h3>${book.author.firstname}&nbsp;${book.author.lastname}</h3></a>
			<p>Author Bio: ${book.author.biography}</p>
			<p>Book Description: ${book.description}</p>
			<p>Genre: ${book.genre.name}</p>
			<p>Publisher: ${book.publisher.name}</p>
			<p>Release Date: ${book.releasedate}</p>
			<p>Average Book Rating: ${book.avgrating}</p>
			<a href="<c:url value="addCart?bookId=${book.bookid}"/>"><button type="button"
					class="btn btn-lg">Add to Shopping Cart</button></a>
		</div>
	</div>

	<div class="rowRatingTextbox">
		<input type=hidden id=bookid value="${book.bookid}">

		<div id="ratingErr">*Must add a star rating*</div>
		<input class="star star-5" id="star-5" type="radio" name="star" /> <label
			class="star star-5" for="star-5"></label> <input class="star star-4"
			id="star-4" type="radio" name="star" /> <label class="star star-4"
			for="star-4"></label> <input class="star star-3" id="star-3"
			type="radio" name="star" /> <label class="star star-3" for="star-3"></label>
		<input class="star star-2" id="star-2" type="radio" name="star" /> <label
			class="star star-2" for="star-2"></label> <input class="star star-1"
			id="star-1" type="radio" name="star" /> <label class="star star-1"
			for="star-1"></label>

		<div id="commentErr">*Cannot leave an empty comment*</div>
		<textarea id="commentArea" rows="4" cols="40" maxlength=140></textarea>
		<button type="button" id="sendButton" onclick="sendFunc()">Send</button>

		<c:if test="${!canComment}">
			<script type="text/javascript">
				document.getElementById("commentArea").disabled = true;
				document.getElementById("sendButton").disabled = true;
				document.getElementById("star-1").disabled = true;
				document.getElementById("star-2").disabled = true;
				document.getElementById("star-3").disabled = true;
				document.getElementById("star-4").disabled = true;
				document.getElementById("star-5").disabled = true;
				document.getElementById("reviewHelp").innerHTML = "Please log-in to leave a review";
			</script>
		</c:if>
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
				<li><a href="index.html">Home</a></li>
				<li><a href="books.html">Browse</a></li>
				<li><a href="profile.html">Profile</a></li>
				<li><a href="shoppingCart.html">Cart</a></li>
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
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.custom.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/tag-it.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="resources/js/tag-it-function.js" type="text/javascript"
	charset="utf-8"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendFunc() {
		//sendFunc(); 
		var comment = document.getElementById("commentArea").value;
		var commentErr = document.getElementById("commentErr");
		var textArea = document.getElementById("commentArea");
		var rating; //Where rating score is stored
		var bookid = document.getElementById("bookid").value; //Gets bookid

		//Star vars
		var star1 = document.getElementById("star-1");
		var star2 = document.getElementById("star-2");
		var star3 = document.getElementById("star-3");
		var star4 = document.getElementById("star-4");
		var star5 = document.getElementById("star-5");

		if (!comment.replace(/\s/g, '').length) //Checks for invalid comment
		{
			commentErr.style.display = "block";
			ratingErr.style.display = "none";
		} else if (!star1.checked && !star2.checked && !star3.checked
				&& !star4.checked && !star5.checked) {
			commentErr.style.display = "none";
			ratingErr.style.display = "block";
		} else {
			commentErr.style.display = "none";
			ratingErr.style.display = "none";

			//Gives rating a value based on which radiobutton was clicked
			if (star1.checked) {
				rating = 1;
			}
			if (star2.checked) {
				rating = 2;
			}
			if (star3.checked) {
				rating = 3;
			}
			if (star4.checked) {
				rating = 4;
			}
			if (star5.checked) {
				rating = 5;
			}
			//Send comment, name and rating to server
			var search = {
				bookid : bookid,
				comment : comment,
				rating : rating
			}

			$.ajax({
				type : "POST",
				url : "addRating",
				data : search,
				success : function(result) {
					$('#list').html(result);
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
	}
</script>
</html>
