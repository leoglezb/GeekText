<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Zoowaa service exchange</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<style>
[class^=slider] {
display: inline-block;
margin-bottom: 30px;
}
.output {
	color: #888;
	font-size: 14px;
	padding-top: 1px;
	margin-left: 5px;
	vertical-align: top;
}
</style>
<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<!--[if IE 7]>
    <link rel="stylesheet" href="assets/resources/css/font-awesome-ie7.min.css">
    <![endif]-->
<!--- Tag it Styles -->
    <link href="resources/css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <link href="resources/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
    
<!-- Fav and touch icons -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png">
<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
<link rel="shortcut icon" href="resources/ico/favicon.png">
</head>

<body>
<!-- Facebook Like Code -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script> 
<!-- Facebook Like Code -->

<div class="container-fluid max-1200"> 
  <!-- header -->
  <div class="row-fluid">
    <div class="span12 notification pull-right">
      <div class="icon"> <a href="#"><i class="icon-user icon-2x"></i> </a>
        <div class="n-count"> 10</div>
      </div>
      <div class="icon"> <a href="#"><i class="icon-envelope icon-2x"></i></a>
        <div class="n-count"> 999</div>
      </div>
      <div class="icon"> <a href="."><i class="icon-home icon-2x"></i></a> </div>
    </div>
    <!-- /notification --> 
    <!-- small blue header start -->
    <div class="small-header">
      <div class="logo-z"> <img src="resources/img/logo-z.png"> </div>
      <div class="display-pic"> <img class="img-circle" src="resources/profiles/${userdetails.username}-profile.jpg" alt=""> </div>
      <ul class="nav pull-left">
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <h4> Hello ${userdetails.name} &nbsp;<i class="icon-caret-down"> </i></h4>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">My Profile</a></li>
            <li><a href="#">Account Settings</a></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /small blue header end --> 
  </div>
  <!-- /header --> 
  <!-- slider -->
  <div class="row-fluid">
    <div class="span12 profile-slider"> <img src="resources/img/barter-slide.jpg"> </div>
  </div>
  <!-- /slider --> 
  
  <!-- Content -->
  <div class="row-fluid">
    <div class="span8 pull-left"> 
      <!-- dynamic info -->
      <h2>We  found the below items you can barter near your area:</h2>
      <hr>
      <p>Found total 124 barter deals within 2 mile radius that you can trade with people near you. Use the slider to modify the distance.</p>
      
      <input class="span3" type="text" data-slider="true">
   
      
      <form>
            <p>Click the tag's below to see related result.</p>
            <ul id="readOnlyTags">
                <li>Tag1</li>
                <li>Tag2</li>
            </ul>
        </form>
      <!-- /dynamic-Tags -->
     <hr>
    
    
    <div class="thumb-list">
   	<c:forEach items="${list.list}" var="row">
        <div class="thumb">
          <div class="pic"><img src="resources/photos/${row.id}-thumb.jpg"></div>
          <div class="username"><a href="#"> ${row.title}</a> </div>
          <div class="status">${row.descrip} <a href="#">read more</a> <br><a class="btn btn-mini">Make Offer </a></div> </div>
    </c:forEach>  
    </div>
   
      
 <div class="pagination">
  <ul>
  <c:if test="${list.pageCount > 1}">
  	<c:if test="${list.pagePrev !=null}">
    <li><a href="serviceexchange?page=${list.pagePrev}">Prev</a></li>
     </c:if>
  	<c:forEach begin="${list.pageStart}" end="${list.pageEnd}" var="pag">
    <li <c:if test="${list.page==pag}">class="active"</c:if>><a href="serviceexchange?page=${pag}">${pag + 1}</a></li>
    </c:forEach>
  	<c:if test="${list.pageNext !=null}">
    <li><a href="serviceexchange?page=${list.pageNext}">Next</a></li>
     </c:if>
  </c:if>
  </ul>
</div>
      
      
     
    </div>
    <!-- /content area --> 
    <!-- Sidebar -->
    <div class="span4 pull-right">
     <div class="well">    
   
      <h2> Upload your deal</h2>
      <hr>
     <form method="post" action="addExchange" enctype="multipart/form-data">
<div class="input-append">
  <label>Upload Image</label>
<div class="fileupload fileupload-new" data-provides="fileupload">
<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="resources/img/marco.gif" /></div>
<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
<div>
<span class="btn btn-file"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file" name="file"/></span>
<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
</div>
</div>
</div>
  <fieldset>
    <label>Title of your deal</label>
    <input class="span10" type="text" placeholder="Type something" id="title" name="title">
    <label>Enter the description</label>
<textarea class="span10" rows="3" id="descrip" name="descrip"></textarea>
<p>
                Enter tag's to easily find your deal <br>ex:electronic, Service exchange
               
            </p>
           <div class="border">
            <ul id="myTags"> </ul>
            </div>
            <br>
      <label class="checkbox">
      <input type="checkbox"> I agree to <a href="#">Terms &amp; Condition</a>
    </label>
 <button type="submit" class="btn">Submit</button>
  </fieldset>
</form>
     
</div><!-- /well -->      
     
    
     <h2>Your Uploaded Deals</h2>
      <hr>
           
        <div class="thumb-list">
    	<c:forEach items="${myList.list}" var="row">
	        <div class="thumb">
	          <div class="pic"><img src="resources/photos/${row.id}-thumb.jpg"></div>
	          <div class="username"><a href="#"> ${row.title}</a> </div>
	        </div>
        </c:forEach>
          
         <a class="btn-mini pull-left">Edit Deals  </a>
         <a class="btn-mini pull-right">View More </a> </div>
            
   </div>
     
  </div>
    <!-- /Sidebar --> 
  <!-- FOOTER --><hr>
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2013 Zoowaa.com &middot; <a href=".">Home</a> &middot; <a href="#">About</a>&middot; <a href="#">Contact us</a>  &middot;<a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
  
 </div>
<!-- /Content --> 

<!-- Le javascript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- range slider --> 
<!-- /range slider --> 
<!-- Tag it --> 
<!-- Tag it -->
<!-- jQuery and jQuery UI are required dependencies. -->
<!-- Although we use jQuery 1.4 here, it's tested with the latest too (1.8.3 as of writing this.) -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.custom.js"></script>
<script src="resources/js/jquery-ui.custom.min.js"></script>
<script src="resources/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/tag-it.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/tag-it-function.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/bootstrap-transition.js"></script> 
<script src="resources/js/bootstrap-alert.js"></script> 
<script src="resources/js/bootstrap-modal.js"></script> 
<script src="resources/js/bootstrap-dropdown.js"></script> 
<script src="resources/js/bootstrap-scrollspy.js"></script> 
<script src="resources/js/bootstrap-tab.js"></script> 
<script src="resources/js/bootstrap-tooltip.js"></script> 
<script src="resources/js/bootstrap-popover.js"></script> 
<script src="resources/js/bootstrap-button.js"></script> 
<script src="resources/js/bootstrap-collapse.js"></script> 
<script src="resources/js/bootstrap-carousel.js"></script> 
<script src="resources/js/bootstrap-typeahead.js"></script>
<script src="resources/js/bootstrap-fileupload.js"></script>
<script src="resources/js/simple-slider.js"></script>
<script>
  $("[data-slider]")
    .each(function () {
      var input = $(this);
      $("<span>")
        .addClass("output")
        .insertAfter($(this));
    })
    .bind("slider:ready slider:changed", function (event, data) {
      $(this)
        .nextAll(".output:first")
          .html(data.value.toFixed(3));
    });
	$('#img-exchange').click(function() {
		$('#target')[0].setAttribute('action', '<c:url value="/signin/facebook"/>');			
		$('#target').submit();
	});
</script> 
<script type="text/javascript">
    $(document).ready(function() {
        $("#myTags").tagit();
    });
</script>
</body>
</html>
