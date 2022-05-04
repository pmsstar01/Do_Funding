<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common_top.jsp" %>	

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<form method="post" action="delete.bd">
	<input type="hidden" name="b_num" value="${bdBean.b_num}">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
<div class="container">
<table class="table" class="text-center">
		<tr>
			<th class="text-center">비밀번호를 입력하세요.</th>
		</tr>
		<tr>
			<th class="text-center">비밀번호: <input type="password" name="b_passwd"></th>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="글삭제" class="btn btn-default btn-sm">
				<input type="button" value="글목록" class="btn btn-default btn-sm"  onclick="location.href='list.bd?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
	</div>
</form>

<%@ include file="../common/common_bottom.jsp" %>