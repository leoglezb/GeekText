<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
 <div id="lista" class="thumb-list">
	<c:forEach items="${list.list}" var="row">
	    <div class="thumb">
	      <div class="pic" ><img src="${photosFolder}${row.id}-thumb.jpg" alt="" onError="this.src='resources/img/marco.gif';"></div>
	      <jsp:element name="div">
			<jsp:attribute name="style">
				<c:choose><c:when test="${row.pic_height==null}">height:120px;</c:when><c:otherwise>height:${row.pic_height}px;</c:otherwise></c:choose>
			</jsp:attribute>
			<jsp:attribute name="class">details</jsp:attribute>
			<jsp:body>
				<div class="details">
				<div class="username"><a href="#"> ${row.title}</a> </div>
				<div class="status">${row.descrip}&#160;<a href="#">read more</a></div>
				<div class="separator"></div>
		         <div class="status">${row.date_f} </div>
		         <div class="status">${row.location}</div>
			</div>
			</jsp:body>
		  </jsp:element>
	    </div>
	</c:forEach>  
 </div>
<div id="pagination" class="pagination">
	<c:if test="${list.pageNext !=null}">
	<a id="urlnxt" href="communityissuespag"/></a>
	<a id="pagenxt" href="${list.pageNext}"></a>
	</c:if>
</div>
