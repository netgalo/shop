<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
	<head>
		<title>HOME</title>
		<jsp:include page="head.jsp"/>
		<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
		<script type="text/javascript">
		$(document).ready(function(){
			$('#join').click(function(){
				location.href='${path}/member/join';
			});
			$('.slider').bxSlider();
		});
		</script>
	</head>
	<body class="is-preload">
		
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="${path}" class="logo"><strong>NKT</strong> Shop</a>
									<ul class="icons">
										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
<!-- 										https://www.facebook.com/kyutaek.nam -->
									</ul>
								</header>

							<!-- Banner -->
								<div style="height: 50px;"></div>
									<div class="row">
										<div class="col-sm-1">
										</div>
										<div class="col-sm-6">
											<div class="slider">
												<img src="${path}/resources/images/strawberry.jpg" style="width: 100%;"/>
												<img src="${path}/resources/images/banana.jpg" style="width: 100%;"/>
												<img src="${path}/resources/images/apple.jpg" style="width: 100%;"/>
												<img src="${path}/resources/images/watermelon.jpg" style="width: 100%;"/>
											</div>
										</div>
										<div class="col-sm-1">
										</div>
										<div class="col-sm-3">
											<c:if test="${ empty sessionScope.db_md }">
												<form action="${path}/member/login" method="post">
													<div style="height: 30px;"></div>
													<div class="form-group">
														<label for="exampleInputEmail1">Email address</label>
														<input name="id" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
<!-- 														<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1">Password</label>
														<input name="pw" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
													</div>
													<div class="form-check">
														<input name="emailsave" type="checkbox" class="form-check-input" id="exampleCheck1">
														<label class="form-check-label" for="exampleCheck1">Check me out</label>
													</div>
													<div style="height: 20px;"></div>
													<div class="row">
<!-- 														<div class="col-sm-1"></div> -->
														<div class="col-sm-5">
															<button type="submit" class="button primary small">Login</button>
														</div>
														<div class="col-sm-6">
															<button id="join" type="button" class="button primary small">Join</button>
														</div>
													</div>
													<br/>
													${logininfo}
												</form>
											</c:if>
											<c:if test="${ not empty sessionScope.db_md }">
												<div style="height: 30px;"></div>
												${ sessionScope.db_md.name } 님 환영 합니다 어서오세요.</br></br>
												<button onclick="location.href='${path}/member/logout'" type="button" class="button primary small">logout</button>
											</c:if>
										</div>
										<div class="col-sm-1">
										</div>
									</div>
								
<!-- 								<section id="banner"> -->
<!-- 									<div class="content"> -->
<!-- 										<header> -->
<!-- 											<h1>안녕 이놈들아~<br /> -->
<!-- 											잘 지내니?</h1> -->
<!-- 											<p>A free and fully responsive site template</p> -->
<!-- 										</header> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button big">Learn More</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 									<span class="image object"> -->
<%-- 										<img src="${path}/resources/images/pic10.jpg" alt="" /> --%>
<!-- 									</span> -->
<!-- 								</section> -->

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Erat lacinia</h2> -->
<!-- 									</header> -->
<!-- 									<div class="features"> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-diamond"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Portitor ullamcorper</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-paper-plane"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Sapien veroeros</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-rocket"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Quam lorem ipsum</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon fa-signal"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>Sed magna finibus</h3> -->
<!-- 												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 									</div> -->
<!-- 								</section> -->

							<!-- Section -->
<!-- 								<section> -->
<!-- 									<header class="major"> -->
<!-- 										<h2>Ipsum sed dolor</h2> -->
<!-- 									</header> -->
<!-- 									<div class="posts"> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic01.jpg" alt="" /></a> --%>
<!-- 											<h3>Interdum aenean</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic02.jpg" alt="" /></a> --%>
<!-- 											<h3>Nulla amet dolore</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic03.jpg" alt="" /></a> --%>
<!-- 											<h3>Tempus ullamcorper</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic04.jpg" alt="" /></a> --%>
<!-- 											<h3>Sed etiam facilis</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic05.jpg" alt="" /></a> --%>
<!-- 											<h3>Feugiat lorem aenean</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 										<article> -->
<%-- 											<a href="#" class="image"><img src="${path}/resources/images/pic06.jpg" alt="" /></a> --%>
<!-- 											<h3>Amet varius aliquam</h3> -->
<!-- 											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 											<ul class="actions"> -->
<!-- 												<li><a href="#" class="button">More</a></li> -->
<!-- 											</ul> -->
<!-- 										</article> -->
<!-- 									</div> -->
<!-- 								</section> -->

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="${path}">HOME</a></li>
										<li><a href="${path}/member/1">MEMBER</a></li>
										<li><a href="${path}/shop/product/list.do">SHOPPING</a></li>
										<li><a href="${path}/shop/cart/list.do">SHOPPING BASKET</a></li>
										<li><a href="${path}/guestbook">GUESTBOOK</a></li>
<%-- 										<li><a href="${path}/ele">Elements</a></li> --%>
<%-- 										<li><a href="${path}/upload/uploadForm">UPLOAD</a></li> --%>
<!-- 										<li> -->
<!-- 											<span class="opener">Another Submenu</span> -->
<!-- 											<ul> -->
<!-- 												<li><a href="#">Lorem Dolor</a></li> -->
<!-- 												<li><a href="#">Ipsum Adipiscing</a></li> -->
<!-- 												<li><a href="#">Tempus Magna</a></li> -->
<!-- 												<li><a href="#">Feugiat Veroeros</a></li> -->
<!-- 											</ul> -->
<!-- 										</li> -->
									</ul>
								</nav>

							<!-- Section -->
								<section>
<!-- 									<header class="major"> -->
<!-- 										<h2>Get in touch</h2> -->
<!-- 									</header> -->
									
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">netgalo@naver.com</a></li>
										<li class="fa-phone">(010) 2314-6639</li>
										<li class="fa-home">15, Naegok-ro, Buk-gu, Daegu, Republic of Korea</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
<%-- 			<script src="${path}/resources/assets/js/jquery.min.js"></script> --%>
			<script src="${path}/resources/assets/js/browser.min.js"></script>
			<script src="${path}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${path}/resources/assets/js/util.js"></script>
			<script src="${path}/resources/assets/js/main.js"></script>

	</body>
</html>