<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/common_top.jsp" %>  

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
	function list(){
		location.href="list.bd"; 
	}
</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/check.js"></script>
<body>
<center>
<br>
<h3>글쓰기</h3>
<br>
</center>
<form action="insert.bd" method="post">
<div class="container">
<table class="table" class="text-center">
	<tr>
		<th class="text-center">이름</th>
		<td><input type="text" name="b_writer" value="${sessionScope.loginInfo.id}" readonly></td>
	</tr>
	<tr>
		<th class="text-center">제목</th>
		<td><input type="text" name="b_subject"></td>
	</tr>
	<tr>
		<th class="text-center">내용</th>
		<td><textarea name="b_content" rows="10" cols="50" style="resize: none;"></textarea></td>
	</tr>
		<input type="hidden" name="b_passwd" value="${sessionScope.loginInfo.password}">
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="" value="글쓰기" class="btn btn-default btn-sm" onclick="return check()">
			<input type="reset" name="" value="다시작성" class="btn btn-default btn-sm">
			<input type="button" name="" value="목록보기" class="btn btn-default btn-sm" onclick="location.href='list.bd'">
		</td>
	</tr>
</table>
</div>
</form>
</body>

<%@ include file="../common/common_bottom.jsp" %>

