<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>    

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

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<form action="admin_notice_update.ad?pageNumber=${pageNumber }" method="post" onsubmit="return noticecheck()">
<input type="hidden" name="no_num" value="${nBean.no_num}">
<h3>수정하기</h3>
<div class="container">
<table class="table" class="text-center">
		<tr>
			<td colspan="2" align="right">
				<a href="admin_notice_list.ad">글목록</a>
				${nBean.no_writer}
			</td>
		</tr>
		<tr>
			<th class="text-center">작성자</th>
			<td><input type="text" name="no_writer" value="${nBean.no_writer}" readonly></td>
		</tr>
		<tr>
			<th class="text-center">제목</th>
			<td><input type="text" name="no_subject" value="${nBean.no_subject}"></td>
		</tr>
		<tr>
			<th class="text-center">내용</th>
			<td>
				<textarea name="no_content" rows="10" cols="50" >${nBean.no_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="" value="수정하기" class="btn btn-default btn-sm">
				<input type="reset" name="" value="다시작성" class="btn btn-default btn-sm">
				<input type="button" name="" value="목록보기" class="btn btn-default btn-sm" onclick="location.href='admin_notice_list.ad?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>

<%@ include file="admin_bottom.jsp" %>

