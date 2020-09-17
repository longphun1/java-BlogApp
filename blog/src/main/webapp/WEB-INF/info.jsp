<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/static/css/info.css" />
</head>
<body class="body">
	<div class="container">
		<a class="dashboard" href="/blogs"><img
			src="https://vectorified.com/images/homepage-icon-27.jpg"
			width="35px" height="35px" /></a>
		<c:choose>
			<c:when test="${blog.user.id == sessionScope.userId}">
				<form:form action="/blogs/${blog.id}/edit" method="GET">
					<input class="edit-button" type="submit" value="EDIT IDEA" />
				</form:form>
			</c:when>
		</c:choose>
		<h3 class="postedBy">
			posted by
			<c:out value="${blog.user.name}" />
		</h3>
		<div class="content">
			<h1>
				<c:out value="${blog.subject}" />
			</h1>
			<c:choose>
				<c:when test="${blog.image.length() > 6}">
					<img src="<c:out value="${blog.image}"/>" width="80%" height="40%">
				</c:when>
			</c:choose>
			<div class="content-text">
				<c:choose>
					<c:when test="${blog.user.id == sessionScope.userId}">
						<h3>You said -</h3>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${blog.user.id != sessionScope.userId}">
						<h3>
							<c:out value="${blog.user.name}" />
							said -
						</h3>
					</c:when>
				</c:choose>
				<h2>
					<c:out value="${blog.content}" />
				</h2>
				<hr>
			</div>
		</div>
		<h2>Comment Section</h2>
		<div class="messages-container">
			<div class="message-form">
				<form:form action="/messages" method="post" modelAttribute="message">
					<p>
						<form:textarea class="form" path="content"
							placeholder="Message must be at least 1 character long" />
					</p>
					<form:input type="hidden" path="blog" value="${blog.id}" />
					<form:input type="hidden" path="user"
						value="${sessionScope.userId}" />
					<input class="submit" type="submit" value="Submit Message" />
				</form:form>
			</div>
			<div class="comment-section">
				<c:forEach items="${messages}" var="m">
					<c:choose>
						<c:when test="${m.blog.id == blog.id }">
							<c:choose>
								<c:when test="${m.user.id == sessionScope.userId}">
									<h4>You commented:</h4>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${m.user.id != sessionScope.userId}">
									<h4>
										<c:out value="${m.user.name}" />
										commented:
									</h4>
								</c:when>
							</c:choose>
							<h3>
								<c:out value="${m.content}" />
							</h3>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>