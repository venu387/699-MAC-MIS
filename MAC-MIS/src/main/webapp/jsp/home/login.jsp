<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>MAC - MIS</title>

<jsp:include page="../shared/styles.jsp" />
</head>
<body>
	<jsp:include page="../shared/navbar.jsp" />
	<div class="container">
		<div id="login-wraper">
			<form:form commandName="login" method="POST" action="/home/login"
				class="form login-form">
				<legend>
					Sign in to <span class="blue">MAC-MIS</span>
				</legend>
				<div class="body">
					<label>Username</label>
					<form:input path="username" type="text" class="form-control"
						style="width: 80%; margin: 0 auto;" />
					<label>Password</label>
					<form:input path="password" type="password" class="form-control"
						style="width: 80%; margin: 0 auto;" />
				</div>
				<div class="footer">
					<label class="checkbox inline"> <input type="checkbox"
						id="inlineCheckbox1" value="option1"> Remember me
					</label>
					<button type="submit" class="btn btn-success">Login</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>