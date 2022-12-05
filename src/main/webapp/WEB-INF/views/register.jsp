<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<body>

	<div class="container col-6">
		<div class="m-3">
			<p class="text-center h1 text-uppercase">Register</p>
		</div>
		<hr>
		<div class="mt-3 mb-3 text-center">
			<span class="text-danger"> <c:if test="true">${registerationError}</c:if>
			</span>
		</div>
		<form:form action="register" method="post" modelAttribute="user"
			enctype="multipart/form-data">
			<div class="form-group row">
				<div class="col">
					<label for="firstName">First name</label>
					<form:input class="form-control" id="firstName" path="firstName" />
					<form:errors path="firstName" cssClass="text-danger" />
				</div>
				<div class="col">
					<label for="lastName">Last name</label>
					<form:input class="form-control" id="lastName" path="lastName" />
					<form:errors path="lastName" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<label for="fatherName">Father's name</label>
				<form:input class="form-control" id="fatherName" path="fatherName" />
				<form:errors path="fatherName" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="dob">Select your DOB</label>
				<form:input type="date" class="form-control" id="dob" path="dob" />
				<form:errors path="dob" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<input class="form-control" id="age" placeholder="Your age" readonly>
			</div>

			<div class="form-group">
				<label class="col-form-label mr-3">Select your gender</label>
				<div class="custom-control custom-radio custom-control-inline">
					<form:radiobutton id="male" path="gender"
						class="custom-control-input" value="male" />
					<label class="custom-control-label" for="male">Male</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<form:radiobutton id="female" path="gender"
						class="custom-control-input" value="female" />
					<label class="custom-control-label" for="female">Female</label>
				</div>
				<form:errors path="gender" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="email">Email address</label>
				<form:input class="form-control" id="email"
					aria-describedby="emailHelp" placeholder="Enter email" path="email" />
				<form:errors path="email" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="password">Password</label>
				<form:input type="password" id="password" class="form-control"
					aria-describedby="passwordDec" path="password" />
				<form:errors path="password" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="confirmPassword">Confirm your password</label>
				<form:input type="password" id="confirmPassword"
					class="form-control" path="confirmPassword" />
				<form:errors path="confirmPassword" cssClass="text-danger" />
				<span class="text-danger"> <c:if test="true">${matchError}</c:if>
				</span>
			</div>

			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="city">City/Village</label>
					<form:input class="form-control" id="city" placeholder="City/Village"
						path="address.cityOrVillage" />
					<form:errors path="address.cityOrVillage" cssClass="text-danger" />
				</div>
				<div class="col-md-3 mb-3">
					<label for="state">State</label>
					<form:input class="form-control" id="state" placeholder="State"
						path="address.state" />
					<form:errors path="address.state" cssClass="text-danger" />
				</div>
				<div class="col-md-3 mb-3">
					<label for="pinCode">Pin code</label>
					<form:input class="form-control" id="pinCode"
						placeholder="Pin code" path="address.pinCode" />
					<form:errors path="address.pinCode" cssClass="text-danger" />
				</div>
			</div>

			<div class="form-group">
				<label for="category">Category</label>
				<form:select class="custom-select" id="category" path="category">
					<form:option value="" label="--Select Please--" />
					<form:option value="general" label="General" />
					<form:option value="SC" label="SC" />
					<form:option value="ST" label="ST" />
					<form:option value="OBC" label="OBC" />
				</form:select>
				<form:errors path="category" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="userImage">Your image</label> <input type="file"
					class="form-control-file" id="userImage" name="userImageFile" /> <span
					class="text-danger"> <c:if test="true">${error}</c:if>
				</span>
			</div>

			<div class="form-group">
				<div class="form-check">
					<form:checkbox class="form-check-input" id="terms"
						path="agreedToTerms" />
					<label class="form-check-label" for="terms">I agree to
						terms and conditions.</label>
				</div>
				<form:errors path="agreedToTerms" cssClass="text-danger" />
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form:form>
		<div class="mt-3 mb-3">
			<a href="<%=request.getContextPath()%>" class="text-primar">Cancel</a>
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