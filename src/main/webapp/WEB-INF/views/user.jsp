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
<title>user info page</title>
</head>
<body>

	<div class="container mt-5">
		<div class="media">
			<div class="mr-3 text-center w-25">
				<img class="img-thumbnail"
					src="<c:url value='resources/images/${user.profile}' />"
					alt="user profile image">
				<form action="logout" method="get" class="mt-3">
					<input type="submit" value="logout"
						class="btn btn-primary text-capitalize">
				</form>
			</div>
			<div class="media-body">
				<h4 class="mt-0 text-capitalize">
					<c:out value="${user.firstName} ${user.lastName}" />
				</h4>
				<hr>

				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">user id</h6>
					</div>
					<div class="col">
						<h6 class="text-primary">
							<c:out value="${user.userId}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">name</h6>
					</div>
					<div class="col">
						<h6 class="text-primary text-capitalize">
							<c:out value="${user.firstName} ${user.lastName}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize text-capitalize">father's name</h6>
					</div>
					<div class="col">
						<h6 class="text-primary text-capitalize">
							<c:out value="${user.fatherName}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">date of birth</h6>
					</div>
					<div class="col">
						<h6 class="text-primary">
							<c:out value="${user.dob}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">gender</h6>
					</div>
					<div class="col">
						<h6 class="text-primary text-capitalize">
							<c:out value="${user.gender}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">email</h6>
					</div>
					<div class="col">
						<h6 class="text-primary">
							<c:out value="${user.email}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">password</h6>
					</div>
					<div class="col">
						<h6 class="text-primary">
							<c:out value="${user.password}" />
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">address</h6>
					</div>
					<div class="col">
						<div class="row">
							<div class="col">
								<h6 class="text-capitalize">city/village</h6>
							</div>
							<div class="col">
								<h6 class="text-primary text-capitalize">
									<c:out value="${user.address.cityOrVillage}" />
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<h6 class="text-capitalize">state</h6>
							</div>
							<div class="col">
								<h6 class="text-primary text-capitalize">
									<c:out value="${user.address.state}" />
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<h6 class="text-capitalize">pin code</h6>
							</div>
							<div class="col">
								<h6 class="text-primary">
									<c:out value="${user.address.pinCode}" />
								</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6 class="text-capitalize">category</h6>
					</div>
					<div class="col">
						<h6 class="text-primary text-capitalize">
							<c:out value="${user.category}" />
						</h6>
					</div>
				</div>

			</div>
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