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
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel = "stylesheet" href="resources/css/5star.css">
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
								Author:	
								<a href="<c:url value="browsebooks?authorid=${book.author.authorid}"/>"> ${book.author.firstname}&nbsp;${book.author.lastname}<br> </a>
							</p>
							<p>
								Author Bio: ${book.author.biography}<br>
							</p>
							<p>
							    Leave a review!
							</p>
							<div class="stars">
  								<form action="">
    								<input class="star star-5" id="star-5" type="radio" name="star"/>
    								<label class="star star-5" for="star-5"></label>
    								<input class="star star-4" id="star-4" type="radio" name="star"/>
    								<label class="star star-4" for="star-4"></label>
    								<input class="star star-3" id="star-3" type="radio" name="star"/>
    								<label class="star star-3" for="star-3"></label>
    								<input class="star star-2" id="star-2" type="radio" name="star"/>
   								 	<label class="star star-2" for="star-2"></label>
    								<input class="star star-1" id="star-1" type="radio" name="star"/>
    								<label class="star star-1" for="star-1"></label>
  								</form>
							</div>
							
							<div>Name (leave blank to stay anonymous)</div>
							<input type="text" id="reviewerName">
							<div>Comment</div>
							<textarea id="commentArea" rows="4" cols="40" maxlength=140></textarea>
							<button onclick = "sendFunc()">Send</button>
							<script>
								function sendFunc()
							    {
									var name = document.getElementById("reviewerName").value ;
									var comment = document.getElementById("commentArea").value ;
									
									if(!name.replace(/\s/g, '').length) //Checks if name is either empty or only spaces
									{
										name = "anonymous" ;
									}
									if(!comment.replace(/\s/g, '').length) //Checks for invalid comment
									{
										alert("Cannot leave an empty comment") ;
									}
									else
									{
										//Send comment and name to server
									}	
							    }
							</script>    
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>

</html>