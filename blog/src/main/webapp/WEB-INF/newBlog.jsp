<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="/static/css/new.css" />
</head>
<body class="body">
	<div class="container">
	<h1 class="header">CREATE A NEW IDEA</h1>
		<div class="box">
			<form:form action="/blogs" method="post" modelAttribute="blog">
				<p>
					<form:input class="form" path="subject"
						placeholder="Enter a title *required" />
					<form:errors path="subject" />
				</p>
				<p>
					<form:input class="form" path="image"
						placeholder="Enter a image url" />
					<form:errors path="image" />
				</p>
				<p>
					<form:textarea class="form-textarea" path="content"
						placeholder="Enter a description *required" />
					<form:errors path="content" />
				</p>
				<form:hidden path="createdAt"/>
				<a class="homepage" href="/blogs">Cancel</a>
				<input class="button" type="submit" value="SUBMIT NEW POST" />
				<form:hidden path="user" value="${sessionScope.userId}" />
			</form:form>
		</div>
	</div>
</body>
</html>