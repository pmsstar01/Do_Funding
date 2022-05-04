`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<style>
.top-banner-wrap {  /* 실제 배너가 주어지면 수정 가능 */
	background: url(<%=request.getContextPath()%>/resources/images/banner.png) no-repeat;
}
</style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

	<title>두펀딩</title>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/product.css">
	<script src="<%=request.getContextPath() %>/resources/common_tb.js"></script>
</head>
<body>
	<br><br>
	<div id="top-wrap">
		<header class="top-inner">		
			<c:if test="${sessionScope.loginInfo.id == null}">
				<ul class="subMenu">
					<li>
						&nbsp;<a href="login.mem">로그인</a>
						&nbsp;<a href="insert.mem">회원가입</a>
						&nbsp;<a href="findid.mem">아이디/비밀번호 찾기</a>
					</li>
				</ul>

			</c:if>

			<c:if test="${sessionScope.loginInfo.id  != null}">
				<ul class="subMenu">
					<li>
						<c:if test="${loginInfo.admin == 0}">
						&nbsp;<a href="main.ad">관리자 페이지</a>
						</c:if>
						&nbsp;<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
						&nbsp;<a href="memberInfo.mem">회원정보</a>
						&nbsp;<a href="list.like?">찜목록</a>
						&nbsp;<a href="cart_list.ord">장바구니</a>
						&nbsp;<a href="order.ord">주문내역</a>
					</li>
				</ul>
			</c:if>
			<br><br>

			<div class="top-banner-wrap" style="height: 200px;">
				<!-- <h1 class="banner-inner">Do_Funding</h1> -->
			</div>

			<div class="mobile-menu-wrap">
				<div class="mobile-menu-scroll">
					<nav id="gnb">
						<h2 class="blind">메인 메뉴</h2>
						<ul class="secMenu">
							<li class="m1 no-sub"><a href="list.prd">홈</a></li>

							<li class="m2"><a href="dona.ord">두펀딩</a>
								<ul class="sec m2_Menu" align="center">
									<li><a href="dona.ord">후원 기록</a></li>
								</ul>
							</li>
							<li class="m3"><a href="list.prd">펀딩상품</a>
								<ul class="sec m3_Menu" align="center">
									<li><a href="list.prd?whatColumn1=p_ing">진행중인 펀딩</a></li>
									<li><a href="list.prd?whatColumn1=p_end">마감된 펀딩</a></li>
									<li><a href="list.prd?whatColumn1=p_future">공개 예정</a></li>
								</ul>
							</li>
							<li class="m4"><a href="#">커뮤니티</a>
								<ul class="sec m4_Menu" align="center">
									<li><a href="list.bd">게시판</a></li>
								</ul>
							</li>
							<li class="m5"><a href="#">고객센터</a>
								<ul class="sec m5_Menu" align="center">
									<li><a href="notice_list.bd">공지사항</a></li>
									<li><a href="faq_list.bd">FAQ</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
</body>
</html>

