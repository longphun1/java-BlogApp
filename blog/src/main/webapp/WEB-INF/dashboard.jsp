<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="/static/css/dashboard.css" />
</head>
<body class="body">
	<div class="header">
		<h1 class="title">Dojo Blog</h1>
		<h3>Hello <c:out value="${user.name}"/></h3>
		<a class="newPost" href="/blog/new">ADD A NEW POST</a>
		<a class="logout" href="/logout">Logout</a>
	</div>
	<div class="box">
		<div class="container">
			<c:forEach items="${blogs}" var="b">
				<div class="posts">
					<div >
						<c:choose>
							<c:when test="${b.image.length() > 6}">
								<img class="image" src="<c:out value="${b.image}"/>" width="100%" height="50%">
							</c:when>
						</c:choose>
					</div>
					<div class="subject">
						<h1>
							<c:out value="${b.subject}" />
						</h1>
					</div>
					<h3 class="author">
						Posted by
						<c:out value="${b.user.name}" />
						| <a class="link" href="/blogs/${b.id}">View Blog</a>
					</h3>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
