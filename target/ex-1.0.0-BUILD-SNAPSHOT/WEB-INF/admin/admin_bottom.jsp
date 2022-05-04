<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>두펀딩</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin.css">
<script>
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('.btn_gotop').show();
		} else{
			$('.btn_gotop').hide();
		}
	});
	$('.btn_gotop').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
</script>
</head>
 

<div style="position:fixed; bottom:35px; right:30px; z-index:99;"> 
	<a href="#"  class="btn_gotop">
	  <img src="<%=request.getContextPath()%>/resources/images/탑버튼.png" style="width:50px"> 
	</a>
</div>

 <body>
 	<div id="bottom-wrap">
 		<ul id="bottom-menu1">
 			<li><a href="company.ad">회사소개</a></li>
	 		<li><a href="tos.ad">이용약관</a></li>
	 		<li><a href="map.ad">오시는길</a></li>
 		</ul>
	 	<div class="bottom-menu2">
		 	<div class="bottom-1">
		 		<h1><a href="<c:url value="/"/>">두  펀  딩</a></h1>
		 		<h2><a href="<c:url value="/"/>">DO_FUNDING</a></h2>
		 	</div>
		 	<div class="bottom-2">
		 		<p>| 두펀딩(주)</p>
		 		<p>| 사업자등록번호 123-45-67890</p>
		 		<p>| 대표이사 김윤겸</p>
		 		<p>| 개인정보관리책임 박민서</p>
		 	</div>
		 	<div class="bottom-3">
		 		<p>| (12345)서울특별시 마포구 신촌로 176</p>
		 		<p>| Tel 070-123-4567 | Fax (02)123-4567</p>
		 		<p>| doo@donationfunding.co.kr</p>
		 		<p>| doofunding Co., Ltd</p>
		 	</div>
		 </div>
 	</div>
 </body>