<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/leandro prototype.css" type="text/css">
</head>

<body>
	<nav class="navbar navbar-expand-md bg-primary navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="#"><i
				class="fa d-inline fa-lg fa-cloud"></i><b> Brand</b></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar2SupportedContent"
				aria-controls="navbar2SupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center justify-content-end"
				id="navbar2SupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fa d-inline fa-lg fa-bookmark-o"></i> Bookmarks</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fa d-inline fa-lg fa-envelope-o"></i> Contacts</a></li>
				</ul>
				<a class="btn navbar-btn ml-2 text-white btn-secondary"><i
					class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
			</div>
		</div>
	</nav>
	<div class="py-5 text-center bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="pb-3 text-secondary">Find Great Books.&nbsp;</h1>
				</div>
			</div>
			<div class="row">
				<div class="text-right col-md-3">
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Genre</h6>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									Fiction
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									Horror
								</label>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Rating</h6>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									5 Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									4 Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									3 Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									2 Stars
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value="">
									1 Star
								</label>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 text-lg-right text-left order-lg-1 col-md-12">
							<h6 class="text-primary">Connect</h6>
							<p>
								In-app chat panel 24/7 active. <br>The support you need,
								right there.
							</p>
						</div>
					</div>
				</div>
				<div class="text-left col-md-9">
					<div class="row my-5">
						<div class="col-10 col-md-4">
							<h4 class="text-primary">
								Card -1 <br>
							</h4>
							<p>
								El principe y el mendigo <br>
							</p>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<img class="img-fluid d-block"
								src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 col-md-4">
							<h4 class="text-primary">
								Card -1 <br>
							</h4>
							<p>
								El principe y el mendigo <br>
							</p>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<img class="img-fluid d-block"
								src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 col-md-4">
							<h4 class="text-primary">
								Card -2 <br>
							</h4>
							<p>
								Romeo y Julieta <br>
							</p>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<img class="img-fluid d-block"
								src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
						</div>
					</div>
					<div class="row my-5">
						<div class="col-10 col-md-4">
							<h4 class="text-primary">
								Card -3 <br>
							</h4>
							<p>
								Por seguir tus huellas, me cague las patas <br>
							</p>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<img class="img-fluid d-block"
								src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-dark text-white">
		<div class="container">
			<div class="row">
				<div class="p-4 col-md-3">
					<h4 class="mb-4 text-secondary">Pingendo</h4>
					<p class="text-white">A company for whatever you may need, from
						website prototyping to publishing</p>
				</div>
				<div class="p-4 col-md-3">
					<h4 class="mb-4 text-secondary">Mapsite</h4>
					<ul class="list-unstyled">
						<a href="#" class="text-white">Home</a>
						<br>
						<a href="#" class="text-white">About us</a>
						<br>
						<a href="#" class="text-white">Our services</a>
						<br>
						<a href="#" class="text-white">Stories</a>
					</ul>
				</div>
				<div class="p-4 col-md-3">
					<h4 class="mb-4">Contact</h4>
					<p>
						<a href="tel:+246 - 542 550 5462" class="text-white"><i
							class="fa d-inline mr-3 text-secondary fa-phone"></i>+246 - 542
							550 5462</a>
					</p>
					<p>
						<a href="mailto:info@pingendo.com" class="text-white"><i
							class="fa d-inline mr-3 text-secondary fa-envelope-o"></i>info@pingendo.com</a>
					</p>
					<p>
						<a href="https://goo.gl/maps/AUq7b9W7yYJ2" class="text-white"
							target="_blank"><i
							class="fa d-inline mr-3 fa-map-marker text-secondary"></i>365
							Park Street, NY</a>
					</p>
				</div>
				<div class="p-4 col-md-3">
					<h4 class="mb-4 text-light">Subscribe</h4>
					<form>
						<fieldset class="form-group text-white">
							<label for="exampleInputEmail1">Get our newsletter</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								placeholder="Enter email">
						</fieldset>
						<button type="submit" class="btn btn-outline-secondary">Submit</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 mt-3">
					<p class="text-center text-white">© Copyright 2017 Pingendo -
						All rights reserved.</p>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>

</html>