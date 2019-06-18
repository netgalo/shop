<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Guestbook</title>
		<jsp:include page="../head.jsp"/>
		<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
		<script type="text/javascript">
			$(document).ready(function(){
				$('#btnshow').click(function(){
					$('#guestbookModal').modal('show');
				});
				$('#btnmodalclose').click(function(){
					$('#guestbookModal').modal('hide');
				});
				$('#btnsaveclose').click(function(){
					var textArea = $('#myTextArea').val();
					$.ajax({
						url:"${path}/guestbook/save",
						type: "post",
						data: {"content": textArea,"var":"test"},
						success : function(result){
							result = $.trim(result);
							if(result =='success'){
								$('#saveinfo').text('방명록을 작성을 완료하였습니다.');
								$('#saveCompleted').modal('show');		
							}else{
								$('#saveinfo').text('방명록을 작성에 실패하였습니다.');
								$('#saveCompleted').modal('show');
							}
						},
						error: function(e){
							alert(e.status);
							alert(e.responseText);
						}
					});
					$('#guestbookModal').modal('hide');
				});
				
				$('#btnsaveCompleted').click(function(){
					$('#saveCompleted').modal('hide');	
					location.href='${path}/guestbook';
				});
				
				
				$('.deleteModalshow').click(function(){
		// 			e.preventdefault();
					$('#idx').val($(this).attr('idx'));
					$('#deleteModal').modal('show');
				});
				
				$('#cancelbtn').click(function(){
					$('#deleteModal').modal('hide');
				});
				
				$('#deletebtn').click(function(){
					var selectIdx = $('#idx').val();
					$.ajax({
						url: "${path}/guestbook/delete",
						type:"post",
						data : { "idx" : selectIdx },
						success : function(){
							$('#deleteModal').modal('hide');
							$('#saveinfo').text('방명록을 삭제를 완료하였습니다.');
							$('#saveCompleted').modal('show');				
						},
						error : function(){
							$('#deleteModal').modal('hide');
							$('#saveinfo').text('방명록을 삭제를 실패하였습니다.');
							$('#saveCompleted').modal('show');	
						}
					});
				});
				
				$('#btncloseupdate').click(function(){
		// 			alert('연결되냐');
					var idx = $('#idx').val();
					var content = $('#myTextAreaupdate').val();
					$.ajax({
						url :"${path}/guestbook/update",
						data : { "idx": idx , "content":content},
						type: "post",
						success:function(){
							$('#guestbookModalupdate').modal('hide');
							$('#saveinfo').text('방명록을 수정을 완료하였습니다.');
							$('#saveCompleted').modal('show');	
						}
					});
				});
				
		// 		if( $('button').attr('data-dismiss') ='modal'){
		// 			$('#guestbookModal').modal('hide');
		// 		}
			});
			
			function updateModal(idx,content){
				$('#myTextAreaupdate').val(content);
				$('#idx').val(idx);
				$('#guestbookModalupdate').modal('show');
		// 		alert("idx = "+idx);
		// 		alert("content = "+content);
			}
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
								<input id="idx" type="hidden" name="idx"/>
									<!-- Modal -->
									<div class="modal fade" id="guestbookModal">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">방명록 글쓰기</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<textarea id="myTextArea" class="form-control" rows="10"></textarea>
												</div>
												<div class="modal-footer">
													<button id="btnmodalclose" type="button" class="button primary small">
													닫기
													</button>
													<button id="btnsaveclose" type="button" class="button primary small">
													저장
													</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal fade" id="guestbookModalupdate">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">방명록 글수정</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<textarea id="myTextAreaupdate" class="form-control" rows="10"></textarea>
												</div>
												<div class="modal-footer">
													<button id="btnmodalcloseupdate" type="button" class="button primary small">
													닫기
													</button>
													<button id="btncloseupdate" type="button" class="button primary small">
													수정
													</button>
												</div>
											</div>
										</div>
									</div>
									
									<!-- Modal -->
									<div class="modal fade" id="saveCompleted">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">안내문구</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" id="saveinfo">
													정상적으로 방명록을 작성하였습니다.
												</div>
												<div class="modal-footer">
													<button id="btnsaveCompleted" type="button" class="button primary small">
													닫기
													</button>
												</div>
											</div>
										</div>
									</div>
									
									<!-- Modal -->
									<div class="modal fade" id="deleteModal">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">안내문구</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" id="saveinfo">
													삭제 하시겠습니까?
												</div>
												<div class="modal-footer">
													<button id="cancelbtn" type="button" class="button primary small">
													취소
													</button>
													<button id="deletebtn" type="button" class="button primary small">
													확인
													</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="container">
										<div class="row">
											<div class="col">
												<div class="jumbotron">
													<h1 class="display-4" style="font-family:monospace;">방명록</h1>
													<p class="lead">bootstrap modal 라이브러리를 호출해서 구현했습니다.</p>
													<hr class="my-4">
													<p>글쓰기 버튼을 클릭시 modal창이 생성됩니다.</p>
													<p class="lead">
														<button id="btnshow" class="button primary" style="font-family:monospace;">
														 글쓰기
														</button>
													</p>
												</div>
											</div>
										</div>
										<c:forEach items="${list}" var="dto">
										<div class="row">
											<div class="col-sm-3">
												<img src="${path}/resources/images/hu.jpg"/>
											</div>
											<div class="col-sm-8">
												<div class="row">
													<div class="col">
														${dto.content}
													</div>
												</div>
												<div class="row">
													<div class="col">
														${dto.reg_date}
													</div>
												</div>
												<div class="row">
													<div class="col text-right">
														<button onclick="updateModal('${dto.idx}','${dto.content}');" class="button primary small" style="font-family:monospace;">수정</button>
														<button idx="${dto.idx}" class="button primary small" style="font-family:monospace;">삭제</button>
													</div>
												</div>
											</div>
											<div class="col-sm-1"></div>
										</div>
										</c:forEach>
									</div>
									<div style="height:300px;">
									
									</div>	

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