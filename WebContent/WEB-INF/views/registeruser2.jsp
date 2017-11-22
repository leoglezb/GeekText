<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%><!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet"
     href="css/bootstrap.min.css" rel="stylesheet" 
     type="text/css">
<link rel="stylesheet" 
    href="css/style.css" 
    rel="stylesheet" 
    type="text/css">

<style>
#commentErr {
	display: none;
	color: red;
}

#ratingErr {
	display: none;
	color: red;
}
</style>

</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" 
	type="text/css" href="resources/css/custom.css">



  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Please sign up</h2>
        <label for="inputFirstName" class="sr-only">First Name</label>
        <input type="FirstName" id="FirstName" class="form-control" placeholder="First Name" required>
        <label for="inputLastName" class="sr-only">Last Name</label>
        <input type="LastName" id="inputLastName" class="form-control" placeholder="Last Name" required>
        <label for="inputNickName" class="sr-only">Nick Name</label>
        <input type="nickname" id="inputNickName" class="form-control" placeholder="Nick Name" required>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email Address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <label for="inputConfirmPassword" class="sr-only">Confirm Password</label>
        <input type="confirmPassword" id="inputConfirmPassword" class="form-control" placeholder="Confirm Password" required>
        <div class="col-md-12 books-sidewidget">
          <div class="checkbox">
            <label><input type="checkbox" value="">Want to Remain Anonymous?</label>
          </div>
        </div>
        


        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
      </form>

    </div> <!-- /container -->
  </body>
</html>
