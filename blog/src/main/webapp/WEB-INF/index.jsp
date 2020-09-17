<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" type="text/css" href="/static/css/index.css" />
</head>
<body class="body">
	<div class="container">
		<div class="register">
			<h1 class="header">Register</h1>

			<p>
				<form:errors path="user.*" />
			</p>

			<form:form method="POST" action="/" modelAttribute="user">
				<p>
					<form:input class="form" path="name" placeholder="Name" />
				</p>
				<p>
					<form:input class="form" path="email" placeholder="Email" />
				</p>
				<p>
					<form:input class="form" type="password" path="password" placeholder="Password" />
				</p>
				<p>
					<form:input class="form" type="password" path="passwordConfirmation" placeholder="Password Confirmation" />
				</p>
				<input class="button" type="submit" value="Register" />
			</form:form>
		</div>

		<hr>

		<div class="login">
			<h1>Login</h1>
			<p>
				<c:out value="${errors}" />
			</p>
			<form method="post" action="/login">
				<p>
					<input class="form" type="text" id="email" name="email" placeholder="Email"/>
				</p>
				<p>
					<input class="form" type="password" id="password" name="password" placeholder="Password"/>
				</p>
				<input class="button" type="submit" value="Login" />
			</form>
		</div>
	</div>

</body>
</html>