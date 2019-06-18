<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Member</title>
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
								<div class="row">
									<div class="col">
										<table class="table">
											<tr>
												<th>#</th>
												<th>아이디</th>
												<th>이름</th>
												<th>이메일</th>
												<th>휴대폰번호</th>
											</tr>
											<c:forEach items="${memberListPage}" var="dto">
											<!-- c:forEach 는 html 태그로 사용하는 for문 이다. -->
											<!-- items는 리스트가 받아올 배열이름, var는 for문 안에서 사용할 변수명 -->
												<tr>
													<td>${dto.idx}</td>
													<td>${dto.id}</td>
													<td>${dto.name}</td>
													<td>${dto.email}</td>
													<td>${dto.phone}</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<nav aria-label="memberPage">
											<ul class="pagination">
												<c:if test="${ page == 1 }">
												<li class="page-item disabled">
													<a class="page-link" href="${path}/member/${pre}">Previous</a>
												</li>
												</c:if>
												<c:if test="${ page != 1 }">
													<li class="page-item">
													<a class="page-link" href="${path}/member/${pre}">Previous</a>
												</li>
												</c:if>
												<c:forEach begin="1" end="${memberListCount}" varStatus="i">
													<li class="page-item">
														<a class="page-link" href="${path}/member/${i.index}">${i.index}</a>
											<!-- i.index는 하나로 묶인 페이지에 1부터 번호를 매겨 index에 넣어준다. 따로 변수 선언을 하지 않는다. -->
													</li>
												</c:forEach>
												<c:if test="${ page == memberListCount }">
													<li class="page-item disabled">
														<a class="page-link" href="${path}/member/${next}">Next</a>
													</li>
												</c:if>
												<c:if test="${ page != memberListCount }">
													<li class="page-item">
														<a class="page-link" href="${path}/member/${next}">Next</a>
													</li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>

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