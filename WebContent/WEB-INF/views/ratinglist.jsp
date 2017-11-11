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
	<c:forEach items="${ratingList}" var="rating">
		<p>
			<c:choose>
				<c:when test="${rating.user.anonymous == 1}">
					Name: Anonymous<br />
				</c:when>
				<c:otherwise>
					Name: ${rating.user.nickname}<br />
				</c:otherwise>
			</c:choose>
			Rating: ${rating.rating} <br /> Comment: ${rating.comment}
		</p>
		<br />
	</c:forEach>
</body>
</html>
