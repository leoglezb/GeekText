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
	<nav class="navbar navbar-expand-md bg-primary navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="<c:url value="browsebooks"/>"><b>
					Browse Books</b></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar2SupportedContent"
				aria-controls="navbar2SupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center justify-content-end"
				id="navbar2SupportedContent">
				<a class="btn navbar-btn ml-2 text-white btn-secondary"><i
					class="fa d-inline fa-lg fa-user-circle-o"></i> Hello
					${userdetails.firstname}</a> <a
					class="btn navbar-btn ml-2 text-white btn-secondary" href="#"><i
					class="fa d-inline fa-lg fa-shopping-cart"></i> Cart</a>
			</div>
		</div>
	</nav>

	<div class="py-5 text-center bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="pb-3 text-secondary">Find Great Books.&nbsp;</h1>
				</div>
			</div>
			<div class="row">
				<div class="text-right col-md-3">
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<div id="GenreDiv">
								<h6 class="text-primary">Genre</h6>
								<c:forEach items="${genreList}" var="genre">
									<label><input type="checkbox" name="${genre.name}"
										value="${genre.genreid}" /> ${genre.name}</label>
									<br />
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Top Seller</h6>

						</div>
					</div>

					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Rating</h6>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 5
									Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 4
									Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 3
									Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 2
									Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 1
									Star
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="text-left col-md-9">
					<div class="row my-5">
						<c:forEach items="${bookList}" var="book">
							<div class="col-10 col-md-4">
								<h4 class="text-primary">
									<a href="<c:url value="bookdetails?bookid=${book.bookid}"/>">
										${book.title} <br>
									</a>
								</h4>
								<p>
									Author: <a
										href="<c:url value="browsebooks?authorid=${book.author.authorid}"/>">
										${book.author.firstname}&nbsp;${book.author.lastname}<br>
									</a>
								</p>
							</div>
							<div class="col-md-4">
								<p>
									${book.price} <br>
								</p>
								<p>
									Link Add to cart <br>
								</p>
							</div>
							<div class="col-md-4">
								<img class="img-fluid d-block"
									src="resources/img/bookcover/${book.bookid}.png">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<div class="container">
		<div class="row">
			<footer>
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; Geektext &middot; <a href="#">Home</a> &middot;
				</p>
			</footer>
		</div>
	</div>
</body>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.custom.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/tag-it.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="resources/js/tag-it-function.js" type="text/javascript"
	charset="utf-8"></script>
<script src="resources/js/jquery.nicescroll.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

var el = document.getElementById("GenreDiv");

//get reference to input elements in toppings container element
var tops = el.getElementsByTagName('input');

//assign function to onclick property of each checkbox
for (var i=0, len=tops.length; i<len; i++) {
 if ( tops[i].type === 'checkbox' ) {
     tops[i].onclick = function() {
    	 alert(this.value);
     }
 }
}
</script>
</html>
