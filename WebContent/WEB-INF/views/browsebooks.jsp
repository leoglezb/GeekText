<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
<title>Geek Text - Books</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">

</head>

<body>
	<div class="row site-nav">
		<div class="col-md-12">
			<div class="logo">
				<a href="/GeekText"><h1>Geek Books</h1></a>
			</div>
			<ul class="nav-list">
				<li><a href="<c:url value="/browsebooks"/>">Browse</a></li>
				<li><a href="<c:url value="/cart.jsp"/>">Cart</a></li>

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
		<div class="col-sm-4">
			<div class="radio col-sm-6" style="display: inline;">
				<h3 style="display: inline;">
					<input type="radio" name="optradio" checked="checked">Browse
					All
				</h3>
			</div>
			<div class="radio col-sm-6" style="display: inline;">
				<h3 style="display: inline;">
					<input type="radio" name="optradio">Top Seller
				</h3>
			</div>
		</div>
		<div class="col-sm-2">
			<label>View</label> <select id="PageSize" onChange="doWork()">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
			</select>
		</div>
		<div class="col-sm-2 sort-button">
			<div class="dropdown">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" id="TitleASC">Title Asc.</a> <a
						class="dropdown-item" id="TitleDESC">Title Desc.</a> <a
						class="dropdown-item" id="AuthorASC">Author Asc.</a> <a
						class="dropdown-item" id="AuthorDESC">Author Desc.</a> <a
						class="dropdown-item" id="PriceASC">Price Asc.</a> <a
						class="dropdown-item" id="PriceDESC">Price Desc.</a> <a
						class="dropdown-item" id="RatingASC">Rating Asc.</a> <a
						class="dropdown-item" id="RatingDESC">Rating Desc.</a> <a
						class="dropdown-item" id="ReleaseDtASC">Release Date Asc.</a> <a
						class="dropdown-item" id="ReleaseDtDESC">Release Date Desc</a>

				</div>
			</div>
		</div>
		<div class="col-sm-4">

			<form class="navbar-form" role="search">
				<div class="input-group">
					<input type="text" class="form-control" name="srch-term"
						id="srch-term">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">Search</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<div class="row books-row">
		<div class="col-md-2 books-sidebar">

			<div class="col-md-12 books-sidewidget" id="GenreDiv">
				<h3>Genre</h3>
				<c:forEach items="${genreList}" var="genre">
					<label><input type="checkbox" name="genres[]"
						value="${genre.genreid}" /> ${genre.name}</label>
					<br />
				</c:forEach>
			</div>

			<div class="col-md-12 books-sidewidget" id="RatingDiv">
				<h3>Rating</h3>
				<div class="radio">
					<label><input type="radio" name="optradio" id="Rating4">4
						and Up</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="optradio" id="Rating3">3
						and Up</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="optradio" id="Rating2">2
						and Up</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="optradio" id="Rating1">1
						and Up</label>
				</div>
				<div>
					<small id="ClearRating">Clear</small>
				</div>
			</div>
		</div>

		<div class="col-md-10 books-mainside">


			<div class="row books-book" id="Books">
				<c:set var="pageListHolder" value="${bookList}" />
				<c:forEach items="${pageListHolder.pageList}" var="book">
					<div class="col-sm-3">
						<div class="col-sm">
							<img src="resources/img/bookcover/${book.bookid}.png">
						</div>
					</div>
					<div class="col-sm-3">
						<h3 class="book-information">${book.title}</h3>
						<a
							href="<c:url value="browsebooks?authorid=${book.author.authorid}"/>"><h5
								class="book-information">${book.author.firstname}&nbsp;${book.author.lastname}</h5></a>
					</div>
					<div class="col-sm-3">
						<p class="book-information" style="margin: 15px;">${book.avgrating}</p>
						<p class="book-information" style="margin: 15px;">${book.price}</p>
						<p class="book-information" style="margin: 15px;">${book.releasedate}</p>
					</div>
					<div class="col-sm-3">
						<a href="<c:url value="bookdetails?bookid=${book.bookid}"/>"><p
								class="btn btn-full">See More</p></a>
					</div>

				</c:forEach>
				
				<div class="row page-index" id="PageDiv">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="margin-left: 50px;">
					<nav aria-label="Page navigation example text-xs-center">
						<ul class="pagination">
							<!--  <li class="page-item" id="Prev"><a class="page-link" onClick="getPage('prev')"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>-->
							<c:forEach begin="0" end="${pageListHolder.pageCount-1}"
								varStatus="loop">
								<li class="page-item" value="${loop.index}"><a class="page-link" onClick="getPage(${loop.index})">${loop.index+1}</a></li>
							</c:forEach>
							<!--<li class="page-item" id="Next"><a class="page-link" onClick="getPage('next')"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>-->
						</ul>
					</nav>
				</div>
				<div class="col-md-4"></div>

			</div>
			</div>
			

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
	var ratingInput = ratingDiv.getElementsByTagName('input');

	var selectedGenre = [ 0 ];

	//assign function to onclick property of each checkbox
	for (var i = 0, len = genreInput.length; i < len; i++) {
		if (genreInput[i].type === 'checkbox') {
			genreInput[i].onclick = doWork;
		}
	}

	$('#ClearRating').click(function(e) {
		minRating = 0;

		//for (var i = 0, len = ratingInput.length; i < len; i++) {
		//	if (ratingInput[i].type === 'radio') {
		//		ratingInput[i].checked = false;
		//	}
		//}

		$('input:radio').parent().removeClass("active");
		doWork();
	});

	function doWork() {
		for (var j = 0, l = genreInput.length; j < l; j++) {
			if (genreInput[j].checked)
				selectedGenre.push(genreInput[j].value);
		}

		var pageSize = document.getElementById("PageSize").value;
		
		var search = {
			genres : selectedGenre,
			minRating : minRating,
			sortBy : sortProperty,
			order : sortOrder ,
			pageSize : pageSize 
		}
		$.ajax({
			type : "GET",
			url : "filterbooks",
			data : search,//JSON.stringify(search), // Note it is important
			success : function(result) {
				$('#Books').html(result);
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
		sortProperty = "";
		sortOrder = "";
	}
	
	function getPage(page){
		for (var j = 0, l = genreInput.length; j < l; j++) {
			if (genreInput[j].checked)
				selectedGenre.push(genreInput[j].value);
		}

		var pageSize = document.getElementById("PageSize").value;
		
		var search = {
			genres : selectedGenre,
			minRating : minRating,
			sortBy : sortProperty,
			order : sortOrder,
			page : page,
			pageSize : pageSize 
		}
		$.ajax({
			type : "GET",
			url : "page",
			data : search,//JSON.stringify(search), // Note it is important
			success : function(result) {
				$('#Books').html(result);
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
		sortProperty = "";
		sortOrder = "";
		
	}
</script>

</html>
