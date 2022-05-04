<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%> 
<style type="text/css">
	body{
		text-align: center;
	}
	textarea{
		width: 100%;
		resize: none;
	}
	table{
		margin:auto;
	}
</style>
<!-- <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head> -->

<h3>답글쓰기</h3>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/check.js"></script>
<body>
<form action="admin_bd_reply.ad" method="post">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<input type="hidden" name="b_ref" value="${bdBean.b_ref}">
	<input type="hidden" name="b_re_step" value="${bdBean.b_re_step}">
	<input type="hidden" name="b_re_level" value="${bdBean.b_re_level}">
<div class="container">
<table class="table" class="text-center">
	<tr>
		<td colspan="2" align="right">
			<a href="admin_bd_list.ad?pageNumber=${pageNumber}">글목록</a>
		</td>
	</tr>
	<tr>
		<th class="text-center">작성자</th>
		<td>
			<input type="text" name="b_writer" value="${sessionScope.loginInfo.id}" readonly>
		</td>
	</tr>
	<tr>
		<th class="text-center">제목</th>
		<td><input type="text" name="b_subject" value="[답글]"></td>
	</tr>
	<tr>
		<th class="text-center">내용</th>
		<td><textarea name="b_content" rows="10" cols="50"></textarea></td>
	</tr>
	<!-- 관리자 글은 비밀번호 필요x -->
	<tr>
		<th class="text-center">비밀번호</th>
		<td><input type="hidden" name="b_passwd" value="1234"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="" value="글쓰기"  class="btn btn-default btn-sm" onclick="return check()">
			<input type="reset" name="" value="다시작성" class="btn btn-default btn-sm">
			<input type="button" name="" value="목록보기"  class="btn btn-default btn-sm" onclick="location.href='admin_bd_list.ad?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
</div>
</form>
</body>

<%@ include file="admin_bottom.jsp"%> 
