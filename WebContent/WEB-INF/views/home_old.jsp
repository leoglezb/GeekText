<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
<!-- Fav and touch icons -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png">
<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
<link rel="shortcut icon" href="resources/ico/favicon.png">
</head>
<script>
if (window.location.href.indexOf('#_=_') > 0) {
    window.location = window.location.href.replace(/#.*/, '');
}	
</script>
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
      <div class="display-pic"> <img class="img-circle" src="resources/img/wil.jpg"> </div>
      <ul class="nav pull-left">
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <h4> Hello ${loggedInUserName} &nbsp;<i class="icon-caret-down"> </i></h4>
          </a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="profilepage"/>">My Profile</a></li>
			<li><a href="<c:url value="myaccount"/>">Account Settings</a></li>
            <li><a href="<c:url value="/signout" />">Logout</a></li>
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
      <h2>Based on your interest in miami area we found:</h2>
      <hr>
      <div class="dynamic-info">
        <div class="result">
          <div class="number"> 566</div>
          <p><a href="serviceexchange">service exchange</a></p>
        </div>
        <!-- /result -->
        <div class="result">
          <div class="number"> 15</div>
          <p><a href="events">Events &amp; updates</a></p>
        </div>
        <!-- /result -->
        <div class="result">
          <div class="number"> 45</div>
          <p><a href="communityissues">Community Issues</a></p>
        </div>
        <!-- /result -->
        <div class="result">
          <div class="number"> 23</div>
          <p><a href="business">Recommended business</a></p>
        </div>
        <!-- /result -->
        <div class="result">
          <div class="number"> 04</div>
          <p> <a href="communityhero">Community Heros</a></p>
        </div>
        <!-- /result -->
        <div class="result">
          <div class="number"> 02</div>
          <p><a href="communityservice">Community Services</a></p>
        </div>
        <!-- /result --> 
      </div>
      <!-- /dynamic-info -->
      
      <div class="row-fluid">
        <div class="span8 clear"> 
          <!-- message area --> 
          <strong>Tell something or share a issue you like people to know about?</strong>
          
          <textarea class="span12" rows="4"></textarea>
          <div>
            <select>
              <option>Message</option>
              <option>Emergency Message</option>
              <option>Service Exchange</option>
              <option>Community Service</option>
              <option>Community Hero</option>
            </select>
            <button type="submit" class="btn btn-primary pull-right">Post</button>
          </div>
          <!-- /message area --> 
          <!-- /dynamic feeds -->
          <div class="row-fluid">
            <hr>
            <h5>All that is happening in your neighbor hood</h5>
            <p> This area will not have the white gap that you see on the right side of the feed image in tablet and mobile layout when we feed the actual facebook feeds here and right now the image width is small to cover it</p>
            <img src="resources/img/feeds.jpg"> </div>
          <!-- /dynamic feeds --> 
          
        </div>
        <!-- announcements widget area -->
        <div class="span4"> 
       
         
         
          <!--announcement-widget-->
    
            <div class="well announcement-widget"><strong>Community Issues </strong>
              <div class="feed-option">
                <div class="titled">Community problems is a way of thinking carefully about a problem</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 18 hours ago</div>
              </div>
              <div class="feed-option">
                <div class="titled">This is basically a list of things that need to be fixed </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Marry Anne 03 Nov 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Our new nest.</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:John Deo | 28 Oct 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Community Issues. So far we have discussed some of the worst mistakes </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 7 June 2012</div>
              </div>
            </div><!--announcement-widget--> 
         
         <br>
         
         <!--announcement-widget-->
    
            <div class="well announcement-widget visible-phone visible-desktop"><strong>Upcoming Events </strong>
              <div class="feed-option">
                <div class="titled">Community problems is a way of thinking carefully about a problem</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 18 hours ago</div>
              </div>
              <div class="feed-option">
                <div class="titled">This is basically a list of things that need to be fixed </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Marry Anne 03 Nov 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Our new nest.</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:John Deo | 28 Oct 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Community Issues. So far we have discussed some of the worst mistakes </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 7 June 2012</div>
              </div>
            </div><!--announcement-widget-->
         
         
         
         
         
         
         
         
         
        </div><!-- announcements widget area -->
     </div>
     
    </div>
    <!-- /content area --> 
    <!-- Sidebar -->
    <div class="span4 pull-right">
     <div class="well">    
   
      <h2> Verify your phone number</h2>
      <hr>
      <p> Enter your phone number below (US Only) </p>
      <div class="input-append">
        <input class="span7" id="appendedInputButton" type="text">
        <button class="btn" type="button">Verify</button>
      </div> </div><!-- /well -->      

      <!-- invite friends -->
      
      <h2> Invite friends to join</h2>
      <hr>
      <img src="resources/img/fb-invite.jpg"> <br>
      <br>
      <h2> Zoowaa buddies in your area</h2>
      <hr>
      <p>found 14 neighboors within 2 mile radius use the slider to modify the range of you neighboorhood.</p>
      <input class="span3" type="text" data-slider="true">
      <iframe width="100%" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=201278562765404678694.0004d2b0b824bd36e4e98&amp;ie=UTF8&amp;ll=25.788969,-80.226439&amp;spn=0,0&amp;t=m&amp;output=embed"></iframe>
      <br />
      <div class="thumb-list">
        <div class="thumb">
          <div class="pic"><img src="http://placehold.it/50x50"></div>
          <div class="username"><a href="#"> Dan Saffer</a> </div>
          <div class="status">Looking for a plumber. </div>
        </div>
        <div class="thumb">
          <div class="pic"><img src="http://placehold.it/50x50"></div>
          <div class="username"><a href="#"> John Deo </a> </div>
          <div class="status">Which is the best school for my kids?</div>
        </div>
        <div class="thumb">
          <div class="pic"><img src="http://placehold.it/50x50"></div>
          <div class="username"><a href="#"> Marry Anne</a> </div>
          <div class="status">Need a electrition. </div>
        </div>
        <div class="thumb">
          <div class="pic"><img src="http://placehold.it/50x50"></div>
          <div class="username"><a href="#"> Dan Saffer</a> </div>
          <div class="status">Looking for a plumber. </div>
        </div>
        <div class="thumb">
          <div class="pic"><img src="http://placehold.it/50x50"></div>
          <div class="username"><a href="#"> Dan Saffer</a> </div>
          <div class="status">Looking for a plumber. </div>
        </div>
        <a class="btn-mini pull-right">View More suggestions</a> </div>
    </div>
    <div class="media">
      <h2> Recommend your experience</h2>
      <hr>
      <a class="pull-right" href="#"> <img class="media-object" data-src="resources/img/btn-arrow-right.jpg" src="resources/img/btn-arrow-right.jpg"> </a>
      <div class="media-body">
        <p> Let the neighborhood know if you had a good or bad experience with a business near you.</p>
      </div>
    </div>
    <!-- /Sidebar --> 
    
  </div>
  <!-- /Content --> 
 
 
  <!--announcement-widget-->
    
            <div class="well announcement-widget visible-tablet">
            
            <strong>Upcoming Events </strong>
              <div class="feed-option">
                <div class="titled">Community problems is a way of thinking carefully about a problem</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 18 hours ago</div>
              </div>
              <div class="feed-option">
                <div class="titled">This is basically a list of things that need to be fixed </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Marry Anne 03 Nov 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Our new nest.</div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:John Deo | 28 Oct 2012</div>
              </div>
              <div class="feed-option">
                <div class="titled">Community Issues. So far we have discussed some of the worst mistakes </div>
                <a href ="#" class="links">read more</a>
                <div class="hours">by:Dan Saffer | 7 June 2012</div>
              </div>
            </div><!--announcement-widget-->
 
 
  <!-- FOOTER --><hr>
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2013 Zoowaa.com &middot; <a href=".">Home</a> &middot; <a href="#">About</a>&middot; <a href="#">Contact us</a>  &middot;<a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
  
</div>
<!-- /container --> 

<!-- Le javascript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- range slider --> 
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
  </script> 
<script src="resources/js/simple-slider.js"></script> 
<!-- /range slider --> 

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
<form id="2" action="<c:url value="/signout" />" method="POST">
    <button type="submit">Sign out</button>
</form>

</body>
</html>
