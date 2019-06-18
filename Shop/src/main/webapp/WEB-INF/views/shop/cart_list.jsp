<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Shopping Basket</title>
	<jsp:include page="../head.jsp"/>
	<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
	<script>
	$(function(){
		$("#btnList").click(function(){
			location.href="${path}/shop/product/list.do";
		});
		$("#btnDelete").click(function(){
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href="${path}/shop/cart/deleteAll.do";
			}
		});
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
									</ul>
								</header>

								<div style="height: 50px;"></div>
								<h2 style="font-family:monospace;">장바구니</h2>
								<c:choose>
									<c:when test="${ map.count == 0 }">
										장바구니가 비었습니다.<br><br>
										<button type="button" id="btnList">상품목록</button>
									</c:when>
									<c:otherwise>
										<form id="form1" name="form1" method="post" action="${path}/shop/cart/update.do">
											<table border="1" width="400px">
												<tr>
													<th>상품명</th>
													<th>단가</th>
													<th>수량</th>
													<th>금액</th>
													<th>&nbsp;</th>
												</tr>
											<c:forEach var="row" items="${map.list}">
												<tr>
													<td>${row.product_name}</td>
													<td><fmt:formatNumber value="${row.price}"
														pattern="#,###,###" /></td>
													<td><input type="number" name="amount" style="width:30px;"
														value="<fmt:formatNumber value="${row.amount}"
														pattern="#,###,###" />"></td>													
													<td><fmt:formatNumber value="${row.money}"
														pattern="#,###,###" />
														<input type="hidden" name="cart_id" value="${row.cart_id}">
													</td>
													<td><a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
													</td>
												</tr>
											</c:forEach>
												<tr>
													<td colspan="5" align="right">
														장바구니 금액 합계 : 
														<fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###" /><br>
														배송료 : ${map.fee}<br>
														총합계 : <fmt:formatNumber value="${map.sum}" pattern="#,###,###" />
													</td>
												</tr>	
											</table>
											<button id="btnUpdate">수정</button>
											<button type="button" id="btnDelete">장바구니 비우기</button>
											<span style="float: right;"><button type="button" id="btnList">상품목록</button></span>
										</form>
									</c:otherwise>
								</c:choose>
							
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
<%-- 			<script src="${path}/resources/assets/js/jquery.min.js"></script> --%>
			<script src="${path}/resources/assets/js/browser.min.js"></script>
			<script src="${path}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${path}/resources/assets/js/util.js"></script>
			<script src="${path}/resources/assets/js/main.js"></script>

	</body>
</html>