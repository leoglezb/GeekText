<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
 <div id="lista" class="thumb-list">
	<c:forEach items="${list.list}" var="row">
		<div class="thumb">
            <div class="pic"><img src="http://placehold.it/150x150"></div>
			<div class="username">
				<a href="#"> ${row.title}</a>
			</div>
			<div class="status">
				${row.descrip} <a href="#">read more</a>
			</div>
			<div class="status">${row.location}</div>
		</div>
	</c:forEach>
 </div>
<div id="pagination" class="pagination">
	<c:if test="${list.pageNext !=null}">
	<a id="urlnxt" href="communityheropag"/></a>
	<a id="pagenxt" href="${list.pageNext}"></a>
	</c:if>
</div>
