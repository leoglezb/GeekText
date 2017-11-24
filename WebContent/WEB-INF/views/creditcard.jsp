<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Credit-Card-Edit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="row site-nav">
		<div class="col-md-12">
			<div class="logo">
				<a href="/GeekText"><h1>Geek Books</h1></a>
			</div>
			<ul class="nav-list">
				<li><a href="<c:url value="/browsebooks"/>">Browse</a></li>
				<li><a href="<c:url value="/shoppingcart"/>">Cart</a></li>
				
				<c:if test="${empty userdetails}">
					<li><a href="<c:url value="/logIn"/>">Sign In</a></li>
				</c:if>
				<c:if test="${not empty userdetails}">
					<li><div class="dropdown">
							<button type="button" class="btn dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Hello ${userdetails.firstname}</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value="/profilemanagement"/>">Profile</a> <a
									class="dropdown-item" href="<c:url value="/signout"/>">Log
									Out</a>
							</div>
						</div></li>
				</c:if>

			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<div class="col-sm-12" style="margin-left:30px;">
			<h1>${userdetails.firstname} Account</h1>
			<form class="form-horizontal" id="registerHere" >
				<fieldset>
					
					<div class="span6" id="PaymentMethod">
						<div class="control-group">
							<label class="control-label" for="input01">CardHolder Name</label>
							<div class="controls">
								<input type="text" id="cardHolderName" name="cardHolderName" required minlength = "2" maxlength = "45">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Card Number</label>
							<div class="controls">
								<input type="text" id="cardnumber"
									name="cardnumber" required minlength = "1" maxlength = "16"> <!--  FIX MIN LENGTH -->
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">CVV</label>
							<div class="controls">
								<input type="text" id="cvv"
									name="cvv" required minlength = "3" maxlength = "3" numeric>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Expiration Month</label>
							<div class="controls">
								<input type="text" id="expirationMonth"
									name="expirationMonth" required minlength = "2" maxlength = "2"  numeric>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Expiration Year</label>
							<div class="controls">
								<input type="text" id="expirationYear" name="expirationYear" required minlength = "2" maxlength = "2" numeric>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01"></label>
							<div class="controls">
								<div class="btn-group">
									<button type="submit" class="btn btn-primary"  onClick="addCreditCard()">Submit</button>
								</div>
								<div class="btn-group">
									<button type="cancel" class="btn btn-primary" onclick="window.location='http://localhost:8080/GeekText/profilemanagement';return false;">Back to home</button>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
			<form id="formCancel" method='GET' action='/profilemanagement'></form>
		</div>
	</div>
	</div>
	<hr>

	<footer>
		<div class="container"></div>
	</footer>

	<!--/.fluid-container-->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	function addCreditCard() {
		
		var cardHolderName = document.getElementById("cardHolderName").value;
		var cardnumber = document.getElementById("cardnumber").value;
		var cvv = document.getElementById("cvv").value;
		var expirationMonth = document.getElementById("expirationMonth").value;
		var expirationYear = document.getElementById("expirationYear").value;
		
		var param = {
			cardHolderName : cardHolderName,
			cardnumber : cardnumber,
			cvv : cvv,
			expirationMonth : expirationMonth,
			expirationYear : expirationYear
		}
		$.ajax({
			type : "POST",
			url : "addCreditCard",
			data : param,
			success : function(result) {
			},
			error : function(jqXHR, exception) {
				var msg = '';
				if (jqXHR.status === 0) {
					msg = 'Not connect.\n Verify Network.';
				} else if (jqXHR.status == 404) {
					msg = 'Requested page not found. [404]';
				} else if (jqXHR.status == 500) {
					msg = 'Internal Server Error [500].';
				} else if (exception === 'parsererror') {
					msg = 'Requested JSON parse failed.';
				} else if (exception === 'timeout') {
					msg = 'Time out error.';
				} else if (exception === 'abort') {
					msg = 'Ajax request aborted.';
				} else {
					msg = 'Uncaught Error.\n' + jqXHR.responseText;
				}
				alert("Error " + msg);
			}
		});
		cardHolderName = [ 0 ];
		sortProperty = "";
		sortOrder = "";
	}
	</script>
	<div class="row footer">
			<div class="col-md footer-left">
				<ul class="footer-list">
					<li><a href="/GeekText">Home</a></li>
					<li><a href="<c:url value="/browsebooks"/>">Browse</a></li>
					<li><a href="<c:url value="/profilemanagement"/>">Profile</a></li>
					<li><a href="<c:url value="/shoppingcart"/>">Cart</a></li>
				</ul>
			</div>
			<div class="col-md footer-right">
				<h5>Team Marvelous</h5>
				<p>Software Engineering 1<br>Professor Alex Roque<br>Fall 2017</p>
			</div>
		</div>
	
</body>
</html>

	