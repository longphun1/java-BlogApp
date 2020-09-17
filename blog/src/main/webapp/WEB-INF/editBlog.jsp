<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/static/css/edit.css" />
</head>
<body class="body">
	<div class="container">
		<h3 class="postedBy">
			posted by
			<c:out value="${blog.user.name}" />
		</h3>
		<form:form action="/delete/${blog.id}" method="post">
			<input class="delete-button" type="submit" value="DELETE IDEA" />
		</form:form>
		<div class="content">
			<form:form action="/blogs/${blog.id}/edit" method="post"
				modelAttribute="blog">
				<div class="subject-image-container">
					<h1>
						<form:label value="${blog.subject}" path="subject"></form:label>
						<form:input class="subject-form" path="subject" />
						<form:errors path="subject" />
					</h1>

					<p>
						<form:label path="image">Image Url:</form:label>
						<form:input class="image-form" path="image" />
						<form:errors path="image" />
					</p>
				</div>
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
						<form:label value="${blog.content}" path="content"></form:label>
						<form:textarea class="textarea-form" path="content" />
						<form:errors path="content" />
					</h2>
				</div>
				<h2>Comment Section</h2>
				<div class="messages-container">
					<div class="comment-section">
						<c:forEach items="${messages}" var="m">
							<c:choose>
								<c:when test="${m.blog.id == blog.id }">
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
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<a class="cancel" href="/blogs/${blog.id}">Cancel</a>
				<form:hidden path="user" value="${sessionScope.userId}" />
				<input class="update-button" type="submit" value="Update" />
			</form:form>
		</div>
	</div>
</body>
</html>