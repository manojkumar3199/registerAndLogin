<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Login page</title>
</head>
<body>

	<div class="container col-6">
		<div class="m-3">
			<p class="text-center h1 text-uppercase">Log in</p>
		</div>
		<hr>
		<div class="mt-3 mb-3">
			<span class="text-danger"> <c:if test="true">${loginError}</c:if>
			</span>
		</div>
		<form action="<%=request.getContextPath()%>/v1/login" method="post">
			<div class="form-group">
				<input class="form-control" placeholder="Enter email" name="email" />
				<span class="text-danger"><c:if test="true">${emailError}</c:if>
				</span>
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="Enter password" name="password"> <span
					class="text-danger"><c:if test="true">${passwordError}</c:if></span>
			</div>
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1"
					name="checkbox"> <label class="form-check-label"
					for="exampleCheck1">I'm not a robot.</label> <span
					class="text-danger"> <c:if test="true">${checkboxError}</c:if>
				</span>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
		<div class="mt-3 mb-3">
			<label>Not a member?</label> <a
				href="<%=request.getContextPath()%>/v1/registerPage"
				class="text-primar">Register</a>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>