<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
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

	<div class="containe">
		<div class="container-flui">
			<!--Carousel Start-->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/assets/img/uwin6.jpg"
							alt="First slide">
						<div class="carousel-caption d-none d-md-block customCaptions">
							<h3>Welcome to the University of Windsor</h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/assets/img/uwin5.jpg"
							alt="Second slide">
						<div class="carousel-caption d-none d-md-block">
							<h3>Department of Computer Science</h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/assets/img/uwin4.jpg"
							alt="Third slide">
						<div class="carousel-caption d-none d-md-block">
							<h3>Centre for Executive and Professional Education</h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/assets/img/uwin7.jpg"
							alt="Fourth slide">
						<div class="carousel-caption d-none d-md-block">
							<h3>Master of Applied Computing</h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/assets/img/uwin8.jpg"
							alt="Fifth slide">
						<div class="carousel-caption d-none d-md-block">
							<h3></h3>
							<p></p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<!--Carousel End-->
		</div>
	</div>
</body>
<jsp:include page="../shared/scripts.jsp" />
</html>