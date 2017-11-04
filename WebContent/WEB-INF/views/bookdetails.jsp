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
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center display-3 text-primary">${book.title}</h1>
					<p class="">${book.description}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6">
							<p>
								Price: &#36;${book.price} <br>
							</p>
							<p>
								Paperback:
								<c:choose>
									<c:when test="${book.paperback=='1'}">
        									Yes 
								</c:when>
									<c:otherwise>
       									No
								</c:otherwise>
								</c:choose>
								<br>
							</p>
							<p>
								Genre: ${book.genre.name} <br>
							</p>
							<p>
								Publisher: ${book.publisher.name} <br>
							</p>
							<p>
								Release Date: ${book.releasedate} <br>
							</p>
							<p>
								Author: <a
									href="<c:url value="browsebooks?authorid=${book.author.authorid}"/>">
									${book.author.firstname}&nbsp;${book.author.lastname}<br>
								</a>
							</p>
							<p>
								Author Bio: ${book.author.biography}<br>
							</p>
							<p id = "reviewHelp">
								Leave a review!<br>
							</p>
							<div id="list">
								<c:forEach items="${ratingList}" var="rating">
									<h4>Rating: ${rating.rating} Comment: ${rating.comment}</h4>
									<br />
								</c:forEach>
							</div>
							<br />
							
							<input type = hidden id = bookid value="${book.bookid}">
							
							<div id="ratingErr">*Must add a star rating*</div>
							<input class="star star-5" id="star-5" type="radio" name="star" />
							<label class="star star-5" for="star-5"></label> <input
								class="star star-4" id="star-4" type="radio" name="star" /> <label
								class="star star-4" for="star-4"></label> <input
								class="star star-3" id="star-3" type="radio" name="star" /> <label
								class="star star-3" for="star-3"></label> <input
								class="star star-2" id="star-2" type="radio" name="star" /> <label
								class="star star-2" for="star-2"></label> <input
								class="star star-1" id="star-1" type="radio" name="star" /> <label
								class="star star-1" for="star-1"></label>

							<div>Comment</div>
							<div id="commentErr">*Cannot leave an empty comment*</div>
							<textarea id="commentArea" rows="4" cols="40" maxlength=140></textarea>
							<button type="button" id="sendButton" onclick="sendFunc()">Send</button>

							<c:if test="${empty userdetails.username}">
								<script type="text/javascript">
									document.getElementById("commentArea").disabled = true;
									document.getElementById("sendButton").disabled = true;
									document.getElementById("star-1").disabled = true;
									document.getElementById("star-2").disabled = true;
									document.getElementById("star-3").disabled = true;
									document.getElementById("star-4").disabled = true;
									document.getElementById("star-5").disabled = true;
									document.getElementById("reviewHelp").innerHTML = "Please log-in to leave a review" ;
								</script>
							</c:if>
						</div>
						<div class="col-md-6">
							<img class="img-fluid d-block w-100 mb-3 rounded"
								src="resources/img/bookcover/${book.bookid}.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			var bookid = document.getElementById("bookid").value ; //Gets bookid
			
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