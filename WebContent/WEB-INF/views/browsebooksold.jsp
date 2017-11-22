<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					class="btn navbar-btn ml-2 text-white btn-secondary"
					href="<c:url value="cart.jsp"/>"><i
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
									<label><input type="checkbox" name="genres[]"
										value="${genre.genreid}" /> ${genre.name}</label>
									<br />
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">See Top Sellers</h6>
						</div>
					</div>

					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12"
							id="RatingDiv">
							<h5 class="text-primary">Rating</h5>
							<h6 class="text-primary" id="Rating4">4 & Up</h6>
							<h6 class="text-primary" id="Rating3">3 & Up</h6>
							<h6 class="text-primary" id="Rating2">2 & Up</h6>
							<h6 class="text-primary" id="Rating1">1 & Up</h6>
						</div>
					</div>


					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Sort</h6>
							<h6 class="text-primary" id="TitleDESC">Title DESC</h6>
							<h6 class="text-primary" id="TitleASC">Title ASC</h6>
							<h6 class="text-primary" id="PriceDESC">Price DESC</h6>
							<h6 class="text-primary" id="PriceASC">Price ASC</h6>
							<h6 class="text-primary" id="ReleaseDtDESC">ReleaseDt DESC</h6>
							<h6 class="text-primary" id="ReleaseDtASC">ReleaseDt ASC</h6>
							<h6 class="text-primary" id="AuthorDESC">Author DESC</h6>
							<h6 class="text-primary" id="AuthorASC">Author ASC</h6>
							<h6 class="text-primary" id="RatingDESC">Rating DESC</h6>
							<h6 class="text-primary" id="RatingASC">Rating ASC</h6>
						</div>
					</div>


				</div>
				<div class="text-left col-md-9">
					<c:set var="pageListHolder" value="${bookList}" />
					<div class="row my-5" id="test">
						<c:forEach items="${pageListHolder.pageList}" var="book">
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
				<div>
					<span style="float: left;"> <c:choose>
							<c:when test="${pageListHolder.firstPage}">Prev</c:when>
							<c:otherwise>
								<a id="prev" href="browsebooks?page=prev">Prev</a>
							</c:otherwise>
						</c:choose>
					</span> <span> <c:forEach begin="0"
							end="${pageListHolder.pageCount-1}" varStatus="loop">
						    &nbsp;&nbsp;
						    <c:choose>
								<c:when test="${loop.index == pageListHolder.page}">${loop.index+1}</c:when>
								<c:otherwise>
									<a id="Page${loop.index}" href="browsebooks?page=${loop.index}">${loop.index+1}</a>
								</c:otherwise>
							</c:choose>
    &nbsp;&nbsp;
    </c:forEach>
					</span> <span> <c:choose>
							<c:when test="${pageListHolder.lastPage}">Next</c:when>
							<c:otherwise>
								<a href="browsebooks?page=next">Next</a>
							</c:otherwise>
						</c:choose>
					</span>
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
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	var sortProperty = "";
	var sortOrder = "";
	var minRating = 0;

	$('#TitleDESC').click(function(e) {
		sortProperty = "title";
		sortOrder = "DESC";

		doWork();
	});

	$('#TitleASC').click(function(e) {
		sortProperty = "title";
		sortOrder = "ASC";

		doWork();
	});

	$('#PriceDESC').click(function(e) {
		sortProperty = "price";
		sortOrder = "DESC";

		doWork();
	});

	$('#PriceASC').click(function(e) {
		sortProperty = "price";
		sortOrder = "ASC";

		doWork();
	});

	$('#ReleaseDtDESC').click(function(e) {
		sortProperty = "releasedate";
		sortOrder = "DESC";

		doWork();
	});

	$('#ReleaseDtASC').click(function(e) {
		sortProperty = "releasedate";
		sortOrder = "ASC";

		doWork();
	});

	$('#AuthorDESC').click(function(e) {
		sortProperty = "firstname";
		sortOrder = "DESC";

		doWork();
	});

	$('#AuthorASC').click(function(e) {
		sortProperty = "firstname";
		sortOrder = "ASC";

		doWork();
	});

	$('#RatingDESC').click(function(e) {
		sortProperty = "avgrating";
		sortOrder = "DESC";

		doWork();
	});

	$('#RatingASC').click(function(e) {
		sortProperty = "avgrating";
		sortOrder = "ASC";

		doWork();
	});

	$('#Rating4').click(function(e) {
		minRating = 4;

		doWork();
	});

	$('#Rating3').click(function(e) {
		minRating = 3;

		doWork();
	});

	$('#Rating2').click(function(e) {
		minRating = 2;

		doWork();
	});

	$('#Rating1').click(function(e) {
		minRating = 1;

		doWork();
	});

	var genreDiv = document.getElementById("GenreDiv");
	var ratingDiv = document.getElementById("RatingDiv");

	//get reference to input elements in toppings container element
	var genreInput = genreDiv.getElementsByTagName('input');

	var selectedGenre = [ 0 ];

	//assign function to onclick property of each checkbox
	for (var i = 0, len = genreInput.length; i < len; i++) {
		if (genreInput[i].type === 'checkbox') {
			genreInput[i].onclick = doWork;
		}
	}

	function doWork() {
		for (var j = 0, l = genreInput.length; j < l; j++) {
			if (genreInput[j].checked)
				selectedGenre.push(genreInput[j].value);
		}

		var search = {
			genres : selectedGenre,
			minRating : minRating,
			sortBy : sortProperty,
			order : sortOrder
		}
		$.ajax({
			type : "GET",
			url : "filterbooks",
			data : search,//JSON.stringify(search), // Note it is important
			success : function(result) {
				$('#test').html(result);
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
		selectedGenre = [ 0 ];
		minRating = 0;
		sortProperty = "";
		sortOrder = "";
	}
</script>
</html>