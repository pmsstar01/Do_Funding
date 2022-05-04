<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>  

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
</style>
<script type="text/javascript">
	function list(){
		location.href="admin_bd_list.ad"; 
	}
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<body>
<h3>글쓰기</h3>
<form action="admin_bd_insert.ad" method="post">
<div class="container">
<table class="table" class="text-center">
	<tr>
		<th class="text-center">작성자</th>
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
	<tr>
		<input type="hidden" name="b_passwd" value="${sessionScope.loginInfo.password}">
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="" value="글쓰기" class="btn btn-default btn-sm" onclick="return check()">
			<input type="reset" name="" value="다시작성" class="btn btn-default btn-sm">
			<input type="button" name="" value="목록보기" class="btn btn-default btn-sm" onclick="location.href='admin_bd_list.ad'">
		</td>
	</tr>
</table>
</div>
</form>
</body>

<%@ include file="admin_bottom.jsp" %>