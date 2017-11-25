<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
	<c:set var="pageListHolder" value="${bookList}" />
	<c:forEach items="${pageListHolder.pageList}" var="book">
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
		</div>
		<div class="col-sm-3">
			<a href="<c:url value="bookdetails?bookid=${book.bookid}"/>"><p
					class="btn btn-full">See More</p></a>
		</div>

	</c:forEach>

	<div class="row page-index" id="PageDiv">

		<div class="col-md-12" style="margin-left: 500px;">
			<nav aria-label="Page navigation example text-xs-center">
				<ul class="pagination">
					<!--  <li class="page-item" id="Prev"><a class="page-link" onClick="getPage('prev')"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>-->
					<c:forEach begin="0" end="${pageListHolder.pageCount-1}"
						varStatus="loop">
						<li class="page-item" value="${loop.index}"><a
							class="page-link" onClick="getPage(${loop.index})">${loop.index+1}</a></li>
					</c:forEach>
					<!--<li class="page-item" id="Next"><a class="page-link" onClick="getPage('next')"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>-->
				</ul>
			</nav>
		</div>

	</div>
</body>
</html>
