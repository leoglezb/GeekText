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
</body>
</html>
