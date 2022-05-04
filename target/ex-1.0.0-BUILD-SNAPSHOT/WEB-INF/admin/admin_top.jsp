<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin.css">
<script src="<%=request.getContextPath() %>/resources/common_tb.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/admin.js"></script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
		content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">
	<title>두펀딩(관리자)</title>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
</head>

<%if(session.getAttribute("loginInfo")==null){%>
	<script> alert('세션이 만료되었습니다. 로그인 페이지로 이동합니다.');</script>
<%	response.sendRedirect("start.jsp");} %>
<style>
.top-banner-wrap {  /* 실제 배너가 주어지면 수정 가능 */
	background: url(<%=request.getContextPath()%>/resources/images/banner.png) no-repeat;
	border:none;
}
</style>
<body>
	<br><br>
	<div id="top-wrap">
		<header class="top-inner">

			<c:if test="${sessionScope.loginInfo.id  != null}">
				<ul class="subMenu">
					<li>
						<c:if test="${loginInfo.admin == 0}">
						&nbsp;<a href="list.prd">사용자 페이지</a>
						</c:if>
						&nbsp;<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
						&nbsp;<a href="memberInfo.mem">회원정보</a>
					</li>
				</ul>
			</c:if>
			<br><br>
		
			<div class="top-banner-wrap" style="height: 200px;" >
			</div>

			<div class="mobile-menu-wrap">
				<div class="mobile-menu-scroll">
					<nav id="gnb">
						<h2 class="blind">메인 메뉴</h2>
						<ul class="secMenu">
							<li class="m1 no-sub"><a href="main.ad">홈</a>						
							</li>
					
							<li class="m2"><a href="admin_cate_list.ad">카테고리</a>
								<ul class="sec m2_Menu" align="center">
									<li><a href="admin_cate_list.ad">카테고리 목록</a></li>
									<li><a href="admin_cate_insert.ad">카테고리 등록</a></li>		
								</ul>
							</li>
							<li class="m3"><a href="admin_prd_list.ad">펀딩</a>
								<ul class="sec m3_Menu" align="center">
									<li><a href="admin_prd_list.ad">펀딩 목록</a></li>
									<li><a href="admin_prd_insert.ad">펀딩 추가</a></li>
								</ul>
							</li>
							<!-- 					<li class="m4 no-sub"> -->
							<li class="m4"><a href="#">회원관리</a>
								<ul class="sec m4_Menu" align="center">
<!-- 								<li><a href="admin_mem_list.ad">회원 목록</a></li>
 -->								<li><a href="admin_mem_list.ad">회원 목록</a></li>
								</ul>
							</li>
							<li class="m5"><a href="admin_bd_list.ad">게시판</a>
								<ul class="sec m5_Menu" align="center">
									<li><a href="admin_bd_list.ad">게시판 목록</a></li>
									<li><a href="admin_notice_list.ad">공지사항 목록</a></li>
									<li><a href="admin_faq_list.ad">FAQ 목록</a></li>
								</ul>
							</li>
							<li class="m6"><a href="admin_ord_list.ad">주문내역</a>
								<ul class="sec m6_Menu" align="center">
 									<li><a href="admin_ord_list.ad">주문내역</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
</body>