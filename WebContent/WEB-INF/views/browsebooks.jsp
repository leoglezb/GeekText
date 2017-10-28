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
					class="btn navbar-btn ml-2 text-white btn-secondary" href="<c:url value="cart.jsp"/>"><i
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
						</div>
					</div>
					
					
				</div>
				<div class="text-left col-md-9">
					<div class="row my-5" id="test">
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
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	var sortProperty = "";
	var sortOrder = "";
	
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
	
	var el = document.getElementById("GenreDiv");

	//get reference to input elements in toppings container element
	var tops = el.getElementsByTagName('input');

	var selected = [0];

	//assign function to onclick property of each checkbox
	for (var i = 0, len = tops.length; i < len; i++) {
		if (tops[i].type === 'checkbox') {
			tops[i].onclick = doWork;
		}
	}

	function doWork() {
		for (var j = 0, l = tops.length; j < l; j++) {
			if (tops[j].checked)
				selected.push(tops[j].value);
		}
		
		var search = {
				genres : selected,
				sortBy: sortProperty,
				order: sortOrder
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
		selected = [0];
		sortProperty = "";
		sortOrder = "";
	}
</script>
</html>
