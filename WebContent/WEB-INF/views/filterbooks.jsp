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
	<c:forEach items="${bookList}" var="book">
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
</body>
</html>
