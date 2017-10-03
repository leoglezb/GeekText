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
	<link href="resources/css/bootstrap.css" rel="stylesheet">
	<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<!--[if IE 7]>
	    <link rel="stylesheet" href="resources/assets/css/font-awesome-ie7.min.css">
	    <![endif]-->
	<link rel="stylesheet" type="text/css" href="resources/css/montage.css" />
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/ico/z144.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/ico/z114.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/ico/z72.png">
	<link rel="apple-touch-icon-precomposed" href="resources/ico/z57.png">
	<link rel="shortcut icon" href="resources/ico/favicon.png">
  </head>

<body>
	<!-- Facebook Like Code -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
<div id="fb-root"></div>
	<!-- Facebook Like Code -->

	<div class="container-fluid max-1200">
		<!-- header -->
		<div class="row-fluid">
			<div class="span12 notification pull-right">
				<div class="icon">
					<a href="#"><i class="icon-user icon-2x"></i> </a>
					<div class="n-count">10</div>
				</div>
				<div class="icon">
					<a href="#"><i class="icon-envelope icon-2x"></i></a>
					<div class="n-count">999</div>
				</div>
				<div class="icon">
					<a href="."><i class="icon-home icon-2x"></i></a>
				</div>
			</div>
			<!-- /notification -->
			<!-- small blue header start -->
			<div class="small-header">
				<div class="logo-z"><img src="resources/img/logo-z.png" alt=""></div>
				<div class="display-pic"><img class="img-circle" src="resources/profiles/${userdetails.username}-profile.jpg" alt=""> </div>
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
			<div class="page-header">
				<div class="profile-map span8">
					<div id="map_canvas" style="width: 100%; height: 300px"></div>
					<!-- iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=201278562765404678694.0004d2b0b824bd36e4e98&amp;ie=UTF8&amp;ll=25.788969,-80.226439&amp;spn=0,0&amp;t=m&amp;output=embed"></iframe-->
				</div>
				<div class="montage-size2 span4">
					<div class="am-container visible-desktop visible-tablet"
						id="am-container"
						style="width: 100%; height: 290px; overflow: hidden; margin: 0px;">
						<a href="#"><img src="resources/img/montage/1.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/2.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/3.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/4.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/5.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/6.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/7.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/8.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/9.jpg" alt=""></img></a> <a
							href="#"><img src="resources/img/montage/10.jpg" alt=""></img></a>
					</div>
				</div>
			</div>
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
						<div class="number">566</div>
						<p>
							<a href="serviceexchange">service exchange</a>
						</p>
					</div>
					<!-- /result -->
					<div class="result">
						<div class="number">15</div>
						<p>
							<a href="events">Events & updates</a>
						</p>
					</div>
					<!-- /result -->
					<div class="result">
						<div class="number">45</div>
						<p>
							<a href="communityissues">Community Issues</a>
						</p>
					</div>
					<!-- /result -->
					<div class="result">
						<div class="number">23</div>
						<p>
							<a href="business">Business near by</a>
						</p>
					</div>
					<!-- /result -->
					<div class="result">
						<div class="number">04</div>
						<p>
							<a href="communityhero">Community Heros</a>
						</p>
					</div>
					<!-- /result -->
					<div class="result">
						<div class="number">02</div>
						<p>
							<a href="communityservice">Community Services</a>
						</p>
					</div>
					<!-- /result -->
				</div>
				<!-- /dynamic-info -->

				<div class="row-fluid">
					<div class="span8 clear">
						<!-- message area -->
						<strong>Tell something or share a issue you like people
							to know about?</strong>
						<form method="post" action="addNewsFeed" enctype="multipart/form-data">
						<textarea id="descrip" name="descrip" class="span12" rows="4"></textarea>
						<div>
							<select id="title" name="title">
								<option>Message</option>
								<option>Emergency Message</option>
								<option>Service Exchange</option>
								<option>Community Service</option>
								<option>Community Hero</option>
							</select>
							<button type="submit" class="btn btn-primary pull-right">Post</button>
						</div>
						</form>
						<!-- /message area -->
						<!-- /dynamic feeds -->
						<div class="row-fluid">
							<hr>
							<h5>All that is happening in your neighbor hood</h5>
							<p>This area will not have the white gap that you see on the
								right side of the feed image in tablet and mobile layout when we
								feed the actual facebook feeds here and right now the image
								width is small to cover it</p>
							<!-- div class="fb-like-box" data-href="https://www.facebook.com/ZooWaa" data-width="500" data-height="700" data-show-faces="true" data-stream="true" data-show-border="false" data-header="false"></div-->
							<!-- img src="resources/img/feeds.jpg"-->
						     <div class="thumb-list">
							<c:forEach items="${list.list}" var="row">
								<div class="thumb">
						            <div class="pic" style="width:auto!important"><img src="resources/profiles/${row.userdetails.username}-ico.jpg" onError="this.src='resources/ico/favicon.png';"></div>
									<div class="username">
										<a href="#"> ${row.title}</a>
									</div>
									<div class="status">
										${row.descrip}
									</div>
									<div class="hours">by: ${row.userdetails.name} ${row.userdetails.lastname} | ${row.date_add}</div>
								</div>
							</c:forEach>
						   </div>
							<div id="pagination" class="pagination">
							  	<c:if test="${list.pageNext !=null}">
							    <a id="urlnext" href="homepag"/></a>
							    <a id="pagenext" href="${list.pageNext}"></a>
							    </c:if>
							</div>							
						</div>
						<!-- /dynamic feeds -->

					</div>
					<!-- announcements widget area -->
					<div class="span4">



						<!--announcement-widget-->

						<div class="well announcement-widget">
							<strong>Community Issues </strong>
					    	<c:forEach items="${listIssues.list}" var="row">
							<div class="feed-option">
								<div class="titled">${row.title}</div>
								<a href="#" class="links">read more</a>
								<div class="hours">by: ${row.userdetails.name} ${row.userdetails.lastname} | ${row.date_add}</div>
							</div>
					        </c:forEach>  
						</div>
						<!--announcement-widget-->

						<br>

						<!--announcement-widget-->

						<div
							class="well announcement-widget visible-phone visible-desktop">
							<strong>Upcoming Events </strong>
					    	<c:forEach items="${listEvents.list}" var="row">
							<div class="feed-option">
								<div class="titled">${row.title}</div>
								<a href="#" class="links">read more</a>
								<div class="hours">by: ${row.userdetails.name} ${row.userdetails.lastname} | ${row.date_add}</div>
							</div>
					        </c:forEach>  
						</div>
						<!--announcement-widget-->
					</div>
					<!-- announcements widget area -->
				</div>

			</div>
			<!-- /content area -->
			<!-- Sidebar -->
			<div class="span4 pull-right">
				<div class="well">

					<h2>Verify your phone number</h2>
					<hr>
					<p>Enter your phone number below (US Only)</p>
					<div class="input-append">
						<input class="span7" id="appendedInputButton" type="text">
						<button class="btn" type="button">Verify</button>
					</div>
				</div>
				<!-- /well -->

				<!-- invite friends -->

				<h2>Invite friends to join</h2>
				<hr>
				<img src="resources/img/fb-invite.jpg" alt=""> <br> <br>
				<h2>Zoowaa buddies in your area</h2>
				<hr>
				<p>found 14 neighboors within 2 mile radius use the slider to
					modify the range of you neighboorhood.</p>
				<input class="span3" type="text" data-slider="true">
				<!--div id="map_canvas1" style="width: 100%; height: 250px"></div-->
				<!-- iframe width="100%" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=201278562765404678694.0004d2b0b824bd36e4e98&amp;ie=UTF8&amp;ll=25.788969,-80.226439&amp;spn=0,0&amp;t=m&amp;output=embed"></iframe-->
				<br />
				<div class="thumb-list">
					<c:forEach items="${listZoowaaUsers}" var="row">
						<div class="thumb">
							<div class="pic" style="width:auto!important">
								<img src="resources/profiles/${row.username}-ico.jpg" onError="this.src='resources/ico/favicon.png';">
							</div>
							<div class="username">
								<a href="#">${row.name} ${row.lastname}</a>
							</div>
							<div class="status">${row.ocupation}.</div>
						</div>
					</c:forEach>
					<a class="btn-mini pull-right">View More suggestions</a>
				</div>
			</div>
			<div class="media">
				<h2>Recommend your experience</h2>
				<hr>
				<a class="pull-right" href="#"> <img class="media-object"
					data-src="resources/img/btn-arrow-right.jpg"
					src="resources/img/btn-arrow-right.jpg" alt="">
				</a>
				<div class="media-body">
					<p>Let the neighborhood know if you had a good or bad
						experience with a business near you.</p>
				</div>
			</div>
			<!-- /Sidebar -->

		</div>
		<!-- /Content -->


		<!--announcement-widget-->

		<div class="well announcement-widget visible-tablet">

			<strong>Upcoming Events </strong>
			<div class="feed-option">
				<div class="titled">Community problems is a way of thinking
					carefully about a problem</div>
				<a href="#" class="links">read more</a>
				<div class="hours">by:Dan Saffer | 18 hours ago</div>
			</div>
			<div class="feed-option">
				<div class="titled">This is basically a list of things that
					need to be fixed</div>
				<a href="#" class="links">read more</a>
				<div class="hours">by:Marry Anne 03 Nov 2012</div>
			</div>
			<div class="feed-option">
				<div class="titled">Our new nest.</div>
				<a href="#" class="links">read more</a>
				<div class="hours">by:John Deo | 28 Oct 2012</div>
			</div>
			<div class="feed-option">
				<div class="titled">Community Issues. So far we have discussed
					some of the worst mistakes</div>
				<a href="#" class="links">read more</a>
				<div class="hours">by:Dan Saffer | 7 June 2012</div>
			</div>
		</div>
		<!--announcement-widget-->


		<!-- FOOTER -->
		<hr>
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2013 Zoowaa.com &middot; <a href=".">Home</a> &middot; <a
					href="#">About</a>&middot; <a href="#">Contact us</a> &middot;<a
					href="#">Privacy</a> &middot; <a href="#">Terms</a>
			</p>
		</footer>

	</div>
	<!-- /container -->

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
	<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
	<script src="resources/js/maps/error-replace.js"></script>
	<!--script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script-->
	<script type="text/javascript" src="resources/js/jquery.montage.min.js"></script>
	<script src="resources/js/simple-slider.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD4SGJSgVm4BaQGj8Hwtc6eezGm0SuZ3zE&sensor=true&libraries=places&language=en-US"></script>
	<script src="resources/js/maps/google-maps.js"></script>
	<script>
		$(document).ready(function() {
			$("[data-slider]").each(
					function() {
						var input = $(this);
						$("<span>").addClass("output")
								.insertAfter($(this));
					}).bind(
					"slider:ready slider:changed",
					function(event, data) {
						$(this).nextAll(".output:first").html(
								data.value.toFixed(3));
					});
			$(function() {
				/* 
				 * just for this demo:
				 */
				$('#showcode').toggle(
						function() {
							$(this).addClass('up').removeClass(
									'down').next().slideDown();
						},
						function() {
							$(this).addClass('down')
									.removeClass('up').next()
									.slideUp();
						});
				$('#panel').toggle(
						function() {
							$(this).addClass('show')
									.removeClass('hide');
							$('#overlay').stop().animate(
									{
										left : -$('#overlay')
												.width()
												+ 20 + 'px'
									}, 300);
						},
						function() {
							$(this).addClass('hide')
									.removeClass('show');
							$('#overlay').stop().animate({
								left : '0px'
							}, 300);
						});
	
				var $container = $('#am-container'), $imgs = $container
						.find('img').hide(), totalImgs = $imgs.length, cnt = 0;
	
				$imgs.each(function(i) {
					var $img = $(this);
					$('<img/>').load(function() {
						++cnt;
						if (cnt === totalImgs) {
							$imgs.show();
							$container.montage({
								fixedHeight : 150
							});
	
							/* 
							 * just for this demo:
							 */
							$('#overlay').fadeIn(500);
						}
					}).attr('src', $img.attr('src'));
				});
			});
			initialize();
		});
		
	</script>
</body>
</html>
