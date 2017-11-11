<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>GeekText</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="max-1200 container-fluid">
				<div class="row-fluid">
					<div class="span4">
						<a class="brand" href="#"> <img
							src="resources/img/books-logo.png" alt="">
						</a>
					</div>
					<div class="span8">
						<p class="masthead">Great Books, for Geeks &amp; for All!</p>
					</div>
					<!-- >div class="display-pic">
						<img class="img-circle"
							src="resources/profiles/${userdetails.username}-profile.jpg"
							alt="">
					</div-->
					<ul class="nav pull-left">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">
								<h4>
									Hello ${userdetails.firstname} &nbsp;<i class="icon-caret-down"></i>
								</h4>
						</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="profilepage"/>">My Profile</a></li>
								<li><a href="<c:url value="/signout"/>">Logout</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<h1>Profile Management</h1>
							<div class="col-10 col-md-4">
								<p>
									First Name: ${userdetails.firstname}<br/>
								</p>
								<p>
									Last name: ${userdetails.lastname}<br/>
								</p>
								<p>
									Nickname: ${userdetails.nickname}<br/>
								</p>
								<p>
									Email: ${userdetails.username}<br/>
								</p>
						
							</div>
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
	<script type="text/javascript" src="resources/js/jquery.montage.min.js"></script>
	<script src="resources/js/simple-slider.js"></script>
	<script type="text/javascript"
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD4SGJSgVm4BaQGj8Hwtc6eezGm0SuZ3zE&sensor=true&libraries=places&language=en-US"></script>
	<script src="resources/js/maps/google-maps.js"></script>
							
					</body>
</html>