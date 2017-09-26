<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Zoowaa</title>
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
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<h4>Hello ${userdetails.name} &nbsp;<i class="icon-caret-down"></i></h4></a>
				<ul class="dropdown-menu">
					<li><a href="<c:url value="profilepage"/>">My Profile</a></li>
					<li><a href="<c:url value="myaccount"/>">Account Settings</a></li>
					<li><a href="<c:url value="/signout"/>">Logout</a></li>
				</ul>
			</li>
		</ul> 
	 </div>
    <!-- /small blue header end --> 
  </div>
  <!-- /header --> 
  <!-- slider -->
  <div class="row-fluid">
    <div class="span12 profile-slider"> <img src="resources/img/profile-slider.jpg"> </div>
  </div>
  <!-- /slider --> 
  
  <!-- Content -->
  <div class="row-fluid">
    <div class="span8 pull-left"> 
      <!-- dynamic info -->
      <h2>About Wil Reguera</h2>
      <hr>
      
      <p>Occupation : Loan Officer</p>
      <p>Contact : 305-520-9457</p>
      <p> Description text simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
      <!-- /dynamic-Tags -->
     
     <br>

     <h2>By Wil Reguera</h2>
     
     <hr>
    
    
    <div class="thumb-list">
        <div class="thumb">
            <div class="pic"><img src="http://placehold.it/150x150"></div>
          <div class="username"><a href="#"> Person Name  </a> </div>
          <div class="status">Description A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is found in a retail store <a href="#">read more</a></div> 
         <div class="status"> Miami, FL</div>
          </div>
          
          
           <div class="thumb">
           <div class="pic"><img src="http://placehold.it/150x150"></div>
          <div class="username"><a href="#">Business Name</a> </div>
          <div class="status">undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is found in a retail store <a href="#">read more</a> </div> 
         <div class="status"> Miami, FL</div>
          </div>
          
           <div class="thumb">
           <div class="pic"><img src="http://placehold.it/150x150"></div>
          <div class="username"><a href="#"> Community issues</a> </div>
          <div class="status">New: A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). same as what is found in a retail store <a href="#">read more</a> </div> 
        <div class="status"> Miami, FL</div>
          </div>
          
          
           <div class="thumb">
         <div class="pic"><img src="http://placehold.it/150x150"></div>
          <div class="username"><a href="#"> Person Name</a> </div>
          <div class="status">Packaging should be the same as what is found in a retail store <a href="#">read more</a> </div> 
        <div class="status"> Miami, FL</div>
          </div>
          
         <div class="thumb">
       <div class="pic"><img src="http://placehold.it/150x150"></div>
          <div class="username"><a href="#"> Person Name </a> </div>
          <div class="status"> Packaging should be the same as what is found in a retail store <a href="#">read more</a></div> 
           <div class="status"> Miami, FL</div>
          </div>
            
   </div>
   
      
 <div class="pagination">
  <ul>
    <li><a href="#">Prev</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">Next</a></li>
  </ul>
</div>
      
      
     
    </div>
    <!-- /content area --> 
    <!-- Sidebar -->
    <div class="span4 pull-right">
      <div class="well">
      <h2>Recommend Wil Reguera</h2>
      <hr>
     <form>

  <fieldset>
 
   
    <label>Describe your experience </label>
<textarea class="span10" rows="3"></textarea>
 </label>
 <button type="submit" class="btn">Submit</button>
  </fieldset>
</form>
 </div><!-- /well -->    

  
          
         
         <!--announcement-widget-->
    
            <div class="well announcement-widget"><strong>What other say about Wil Reguera</strong>
              <div class="feed-option">
                <div class="titled">Description text simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 18 hours ago</div>
              </div>
              <div class="feed-option">
                <div class="titled">Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Marry Anne 03 Nov 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">He is the BEST!</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:John Deo | 28 Oct 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 7 June 2012</div>
              </div>
            </div><!--announcement-widget--> 
         
         <br>
         
         <!--announcement-widget-->
         
         
          
          
           
            
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
	<script src="resources/js/jquery.js"></script>
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
	<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>
	<script src="resources/js/simple-slider.js"></script>

<script>
	$(document).ready(function() {
        $("#myTags").tagit();
		$("[data-slider]")
		  .each(function () {
		    var input = $(this);
		    $("<span>")
		      .addClass("output")
		      .insertAfter($(this));
		  })
		  .bind("slider:ready slider:changed", function (event, data) {
		    $(this).nextAll(".output:first").html(data.value.toFixed(3));
		});
		
	});
</script>
		

</body>
</html>
