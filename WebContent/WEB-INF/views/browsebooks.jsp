<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse Books</title>
</head>
<body>
<table border=1>
        <thead>
            <tr>
                <th>Title</th>
                <th>Price</th>
                <th>Paperback</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${bookList}" var="book">
                <tr>
                    <td><c:out value="${book.getTitle}" /></td>
                    <td><c:out value="${book.getPrice}" /></td>
                    <td><c:out value="${book.getPaperback}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>