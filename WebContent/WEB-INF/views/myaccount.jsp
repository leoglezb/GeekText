<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Pragma" content="no-cache">
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
<script type="text/javascript">
	var lat = ${userdetails.latitude} ;
	var lng = ${userdetails.longitude} ;
	var mybonds = 0.0005;
</script>
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
      <div class="display-pic"> <img class="img-circle" src="resources/profiles/${userdetails.username}-profile.jpg?v=${currentTimestamp}" alt=""> </div>
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
  
  
  <!-- Content -->
  <div class="row-fluid">
    <div class="span8 pull-left"> 
      <!-- dynamic info -->
      <h2>About ${userdetails.name}&#160;${userdetails.lastname}</h2>
      <hr>
		<form id="target" class="form-horizontal" method="post" action="updateMyaccount" enctype="multipart/form-data">
		<fieldset>
			<div class="span3">
				<label>Add a photo of yourself:</label>
				<div class="fileupload fileupload-new" data-provides="fileupload" id="photofrm" name="photofrm">
					<div class="thumbnail">
						<img class="zoowaaimg" id="zoowaaframe" name="zoowaaframe" src="resources/profiles/${userdetails.username}-profile.jpg?v=${currentTimestamp}" onError="this.src='resources/img/placeholder-100x100.png';" />
					</div>
					<label>Will be scaled to 100x100</label>
					<div>
						<a href="photoprofile" class="btn" style="margin-left:10px;">Select Image</a>
					</div>
				</div>
			</div>
			<div class="span8">
				<div class="control-group">
					<label class="control-label" for="name">First name:</label>
					<div class="controls">
						<input class="span12" type="text" placeholder="Occupation" value="${userdetails.name}" name="name" id="name">
					</div>
				</div>
				<div class="control-group">
				    <label class="control-label">Last name:</label>
					<div class="controls">
					    <input class="span12" type="text" placeholder="Occupation" value="${userdetails.lastname}" name="lastname" id="lastname">
					</div>
			    </div>
			    <div class="control-group">
				    <label class="control-label">Email:</label>
				    <div class="controls">
				    	<input class="span12" type="text" placeholder="Email" value="${userdetails.email}" name="email" id="email">
				    </div>	
			    </div>
			    <div class="control-group">
				    <label class="control-label">Occupation:</label>
				    <div class="controls">
				    	<input class="span12" type="text" placeholder="Occupation" value="${userdetails.ocupation}" name="ocupation" id="ocupation">
				    </div>
			    </div>
			    <div class="control-group">
				    <label class="control-label">Phone:</label>
				    <div class="controls">
				    	<input class="span12" type="text" placeholder="Phone" value="${userdetails.phone}" name="phone" id="phone">
				    </div>	
			    </div>
			    <div class="control-group">
				    <label class="control-label">Fax:</label>
				    <div class="controls">
				    	<input class="span12" type="text" placeholder="Phone" value="${userdetails.phone}" name="fax" id="fax">
				    </div>	
			    </div>
		    </div>
		    <div class="span11" style="margin-left:0px;">
			    <div class="control-group">
				    <label>Address:</label>
				    <input class="span12" type="text" placeholder="Address" value="${userdetails.home_adress}" name="home_adress" id="home_adress">
				    <input type="hidden" name="latitude" id="latitude"/>
				    <input type="hidden" name="longitude" id="longitude"/>
			    </div>
			    <div class="control-group">
				    <label>Enter the description:</label>
					<textarea class="span12" rows="3" name="descrip" id="descrip">${userdetails.descrip}</textarea>
				</div>
				<label>
					<input type="checkbox"> I agree to <a href="#">Terms &amp; Condition</a>
				</label>
				<div class="well well-small">
					<Strong> Select the option visible to only friends</strong><br>
					<input type="checkbox"> Occupation<br>
					<input type="checkbox"> Email<br>
					<input type="checkbox"> Phone <br>
				</div>
				 <button type="button" class="btn" id="sbmaccount" name="sbmaccount">Submit</button>
			</div>	
      <!-- /dynamic-Tags -->
    	 <br>
		  </fieldset>
		</form>
    	 
    </div>

    <!-- /content area --> 
    <!-- Sidebar -->
    
    <div class="span4 pull-right">
      <div class="well">
      <h2>Recommend ${userdetails.name}&#160;${userdetails.lastname}</h2>
      <hr>
     <form>

  <fieldset>
    <label>Describe your experience </label>
	<textarea class="span10" rows="3"></textarea>
  <button type="submit" class="btn">Submit</button>
  </fieldset>
</form>

 </div><!-- /well -->
 			<div class="well" id="map_canvas" style=" height: 150px"></div>
			<input id="lat" type="hidden" disabled="disabled" name="lat" value="${userdetails.latitude}">
			<input id="long" type="hidden" disabled="disabled" name="lng" value="${userdetails.longitude}">
 			
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
<!-- Placed at the end of the document so the pages load faster --> 
<!-- range slider --> 
<!-- script src="resources/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script-->
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
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD4SGJSgVm4BaQGj8Hwtc6eezGm0SuZ3zE&sensor=true&libraries=places&language=en-US"></script>
<script src="resources/js/maps/google-maps.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
		$('form *').keypress(function(e) {
			if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
				e.preventDefault();
				//$(this).parents('form').find('[type=button]').eq(0).focusin().click();
				//$(this).parents('form').find('[type=submit]').eq(0).focusin().click();
				return false;
			}
		});
        $("#myTags").tagit();
		var autocomplete = new google.maps.places.Autocomplete($("#home_adress")[0], {});
        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
        });
		$('#home_adress').keyup (function(event) {
			 if (event.which == 13) {
				 codeAddress();
			 }			
		});
		$('#home_adress').blur (function(event) {
			 codeAddress();
		});
		$('#sbmaccount').on('click', function(e) {
			$('#latitude').val($('#lat').val());
			$('#longitude').val($('#long').val());
			$('#target').submit();
			return false;
		});
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
        initialize();
    });
</script>

</body>
</html>
