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
    <!-- Le styles -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
	<!-- HTML5 shim, for IE support of HTML5 elements -->
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png">
    <link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
    <link rel="shortcut icon" href="resources/ico/favicon.png">
  	<script type="text/javascript">
		var lat = ${location.getLatitude()}
		var lng = ${location.getLongitude()}
		var mybonds = 0.05;
	</script>
  </head>

  <body>
<!-- Header START -->
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
<!-- Nav START -->
      <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="max-1200 container-fluid">
            <div class="row-fluid">
              <div class="span4">
                <a class="brand" href="#">
                  <img src="resources/img/logo-zoowaa.png" alt=""> 
                </a>
              </div>
              <div class="span8">
                <p class="masthead">Know your neighbors just like the old days but in a simple &amp; modern way!</p> 
                <div class="fb-like pull-center" data-href="https://www.facebook.com/ZooWaa" data-send="false" data-width="320" data-show-faces="true" data-font="arial"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
<!-- Nav END -->
<!-- Header END -->
<!-- Container START -->
<div class="container">
  <div class="row">
    <div class="span8">
    <h2>In miami area we  found:</h2>
    <hr>
<!-- Dynamic Info START -->
    <div class="dynamic-info">
      <div class="result"> 
      <div class="number"> 566</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="serviceexchange">Service exchange</a>
		      </c:when>
		      <c:otherwise>
		      	Service exchange
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
      <div class="result"> 
      <div class="number"> 15</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="events">Events &amp; updates</a>
		      </c:when>
		      <c:otherwise>
		      	Events &amp; updates
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
      <div class="result"> 
      <div class="number"> 45</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="communityissues">Community Issues</a>
		      </c:when>
		      <c:otherwise>
		      	Community Issues
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
      <div class="result"> 
      <div class="number"> 23</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="editrecommendations">Recommended business</a>
		      </c:when>
		      <c:otherwise>
		      	Recommended business
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
      <div class="result"> 
      <div class="number"> 04</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="communityhero">Community Heros</a>
		      </c:when>
		      <c:otherwise>
		      	Community Heros
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
      <div class="result"> 
      <div class="number"> 02</div>
      <p>
		<c:choose>
		      <c:when test="${userdetails!='ZooWaaUserNotLoggedIn'}">
		      	<a href="communityservice">Community Services</a>
		      </c:when>
		      <c:otherwise>
		      	Community Services
		      </c:otherwise>
		</c:choose>							
      </p>      
      </div><!-- /result -->
    </div>
<!-- Dynamic Info END -->
<!-- Search input START -->
      <div class="span4"><h2>What's up with your neighborhood?</h2>
      		<form id="prueba" name="prueba">      
            <div class="input-append">
            <input id="home_adress" placeholder="Enter your address" type="text"> 
            <button class="btn btn-primary" type="button" id ="pass">Check it out!</button>
            </div>
            </form>
      </div>
      
      <div class="span3">
        <a href="#myModal" data-toggle="modal"><img src="resources/img/btn-video.jpg" alt=""></a>
      </div>
	  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="myModalLabel">Zoowaa is live!!!</h3>
			</div>
			<div class="modal-body">
				<iframe id="2" name="2" width="500" height="278"  frameborder="0"></iframe>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
	  </div>	  
<!-- Search input END -->
    </div>    
<!-- Sidebar START -->
      <div class="span4">
<!-- TAB START -->
    <div class="bs-docs-example">
      <ul id="myTab" class="nav nav-tabs">
        <li class="active"><a href="#connect" data-toggle="tab"><strong>Connect to Zoowaa</strong></a></li>
        <li class=""><a href="#login" data-toggle="tab"><strong>Login</strong></a></li>
      </ul>
      <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="connect">
		<form id="target" action="<c:url value="/signin/facebook"/>" method="POST">
			<input type="hidden" name="scope" value="email,publish_stream,offline_access" />		    
			<input type="hidden" name="j_username" value="guest" />
			<input type="hidden" name="j_password" value="" />
		</form>
          <div> <a href="#" id="fb-connect"><img src="resources/img/fb-connect.png" alt=""></a> 
          </div><br>
          <div> <a href="#" id="tw-connect"><img src="resources/img/tw-connect.png" alt=""></a>
          </div><br>
          <p>Or signup with your email </p>
          <div class="input-append">
          	<form id="registerHere" name="registerHere" action="registeruser" method="GET">
				<input placeholder="Enter your email" type="text" name="user_email" id="user_email">
	            <button id="regHereBtn" class="btn" type="submit">Signup</button>
	        </form>
          </div>
        </div>
        <div class="tab-pane fade" id="login" style="position:relative;overflow:hidden">
			<div class="input-append">
			<form id="loginform" name="loginform" action="j_spring_security_check" method="POST">
		       	<input type="text" placeholder="Enter your email" name="j_username" id="j_username"><br><br>
		       	<input type="password" placeholder="Password" name="j_password" id="j_password">
		       	<div class="control-group">
				<div class="controls">
		              <label class="checkbox">
		                <input type="checkbox" name="_spring_security_remember_me" id="_spring_security_remember_me" value="1"> Remember me
		              </label>
		              <button type="submit" class="btn">Sign in</button>
		            </div>
		   	     </div>
		    </form>
			</div>
        </div>
      </div>
    </div>
<!-- TAB END -->
      </div>
<!-- Sidebar END -->
    </div>
  </div>
<!-- Container END -->
<!--MAP START -->

<div class="container">
	<hr>
	<div id="map_canvas" style="width:100%; height:450px"></div>
</div>
<hr>
<!--MAP END -->
<!-- FOOTER -->
    <div class="container"> 
      <div class="row"> 
      <footer>
             <p class="pull-right"><a href="#">Back to top</a></p>
             <p>&copy; 2013 Zoowaa.com &middot; <a href="#">Home</a> &middot; <a href="#">About</a>&middot; <a href="#">Contact us</a>  &middot;<a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
    </div>
    </div>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
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
	<script type="text/javascript"	src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD4SGJSgVm4BaQGj8Hwtc6eezGm0SuZ3zE&sensor=true&libraries=places&language=en-US"></script>
    <script src="resources/js/maps/google-maps.js"></script>
    <script type="text/javascript" src="resources/js/getOffsets.1.0.js"></script>
    <script type="text/javascript" src="resources/js/jquery.placeholder.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('input, textarea').placeholder();
		$('form *').keypress(function(e) {
			if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
				e.preventDefault();
				$(this).parents('form').find('[type=button]').eq(0).focusin().click();
				$(this).parents('form').find('[type=submit]').eq(0).focusin().click();
				return false;
			}
		});
		$('#pass').on('click', function(e) {
			codeAddress();
			return false;
		});
		$('#fb-connect').click(function() {
			$('#target')[0].setAttribute('action', '<c:url value="/signin/facebook"/>');			
			$('#target').submit();
		});
		$('#tw-connect').click(function() {
			$('#target')[0].setAttribute('action', '<c:url value="/signin/twitter"/>');
			$('#target').submit();
		});
		$('#myModal').on('show', function () {
			$("#2").attr("src","http://www.youtube.com/embed/zMmHAdstBeo?feature=player_embedded&controls=0&rel=0&showinfo=0&autohide=1&autoplay=1");
		})
		$('#myModal').on('hidden', function () {
			$("#2").attr("src","");
		})
		var autocomplete = new google.maps.places.Autocomplete($("#home_adress")[0], {});
        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
        });
		$("#registerHere").validate({
			rules : {
				user_email : {
					required : true,
					email : true
				}
			},
			messages : {
				user_email : {
					required : "Enter your email address",
					email : "Enter valid email address"
				}
			},
		    errorClass: "error",
		    validClass: "checked",
		    errorPlacement: function(error, element) {
		    	var wrapedError = wrapError(error,element,'rightarrow')
		        wrapedError.insertAfter($("#regHereBtn"));
		        $("<div class='errorImage'></div>").insertBefore(wrapedError);
		    	wrapedError.css('right',$(window).width()-element.offset().left-element.width()-75);
		        wrapedError.css("top", element.offset().top-5);
		    },
		    highlight: function (element, errorClass, validClass) {
                $(element).addClass(errorClass).removeClass(validClass);
	        },
	        unhighlight: function (element, errorClass, validClass) {
	                $(element).removeClass(errorClass).addClass(validClass);
	        },		    
		    success: function(element) {
		    	$(element).addClass("checked");
		    }
		});
		$("#loginform").validate({
			rules : {
		       	j_username : {
					required : true,
					email : true
				},
				j_password : {
					required : true,
				}			
			},
			messages : {
				j_username : {
					required : "Email address is required",
					email : "Enter valid email address"
				},
				j_password : {
					required : "Password is required",
				}
			},
		    errorClass: "error",
		    validClass: "checked",
		    errorPlacement: function(error, element) {
		    	var wrapedError = wrapError(error,element,'rightarrow')
		        wrapedError.insertAfter(element);
		    	var img = $("<div class='errorImage'></div>");
		    	img.insertBefore(wrapedError);
		        wrapedError.css('right',element.getOffsets({directions : ['right']})-50+'px');
		        wrapedError.css("top", element.position().top);

		    },
		    success: function(element) {
		    	$(element).addClass("checked");
		    },
		    highlight: function (element, errorClass, validClass) {
	                $(element).addClass(errorClass).removeClass(validClass);
	        },
	        unhighlight: function (element, errorClass, validClass) {
	                $(element).removeClass(errorClass).addClass(validClass);
	        }		    
		});
		initialize();
	});
			
	</script>
  </body>
</html>
