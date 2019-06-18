<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Join</title>
		<jsp:include page="../head.jsp"/>
		<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
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
									</ul>
								</header>

								<div style="height: 50px;"></div>
								<form action="${path}/member/joinProc" method="post">
									<div class="container">
										<div class="row" style="">
											<div class="col">
												회원가입
												<div style="height: 20px;"></div>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">ID</span>
													</div>
													<input name="id" type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">아이디를 입력하세요</span>
													</div>
												</div>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">PW</span>
													</div>
													<input name="pw" type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">패스워드를 입력하세요</span>
													</div>
												</div>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">NAME</span>
													</div>
													<input name="name" type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">이름을 입력하세요</span>
													</div>
												</div>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">EMAIL</span>
													</div>
													<input name="email" type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">이메일을 입력하세요</span>
													</div>
												</div>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">PHONE</span>
													</div>
													<input name="phone" type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">휴대폰번호를 입력하세요</span>
													</div>
												</div>
											</div>
										</div>
										<div style="height: 40px;"></div>
										<div class="row">
											<div class="col-sm-4"></div>
											<div class="col-sm-1">
												<button class="button primary small">JOIN</button>
											</div>
											<div class="col-sm-7">
												<button type="button" onclick="location.href='${path}';" class="button primary small">CANCLE</button>
											</div>
										</div>
										<div class="row">
											<div class="col">${joininfo}</div>
										</div>
									</div>
								</form>

							<!-- Content -->
<!-- 								<section> -->
<!-- 									<header class="main"> -->
<!-- 										<h1>Generic</h1> -->
<!-- 									</header> -->

<%-- 									<span class="image main"><img src="${path}/resources/images/pic11.jpg" alt="" /></span> --%>

<!-- 									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p> -->
<!-- 									<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p> -->

<!-- 									<hr class="major" /> -->

<!-- 									<h2>Interdum sed dapibus</h2> -->
<!-- 									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p> -->

<!-- 									<hr class="major" /> -->

<!-- 									<h2>Magna etiam veroeros</h2> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p> -->
<!-- 									<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p> -->

<!-- 									<hr class="major" /> -->

<!-- 									<h2>Lorem aliquam bibendum</h2> -->
<!-- 									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p> -->

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
									<header class="major">
										<h2>Get in touch</h2>
									</header>
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
			<script src="${path}/resources/assets/js/jquery.min.js"></script>
			<script src="${path}/resources/assets/js/browser.min.js"></script>
			<script src="${path}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${path}/resources/assets/js/util.js"></script>
			<script src="${path}/resources/assets/js/main.js"></script>

	</body>
</html>