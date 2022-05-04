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
<!-- <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head> -->
<body>
<h3>Notice</h3>
<div class="container">
<table class="table" class="text-center">
	<tr align="center">
		<th class="text-center">제목</th>
		<td colspan="5" align="left">${noticeBean.no_subject}</td>
	</tr>
	<tr>
		<th class="text-center" width="100">작성자</th>
		<td width="250">${noticeBean.no_writer}</td>
		<th class="text-center" width="100">작성일</th>
		<td width="350">
			<fmt:formatDate value="${noticeBean.no_reg_date}" pattern="yyyy-MM-dd"/>
		</td>
		<th class="text-center" width="100">조회수</th>
		<td>${noticeBean.no_readcount}</td>
	</tr>

	<tr height="200">
	     <th class="text-center">글내용</th>
	
 		<td colspan="6" >
			${noticeBean.no_content }
		</td>
	</tr>
	<tr height="30">
		<td align="center" colspan="6">
			<input type="button" name="list_btn" value="목록" class="btn btn-default btn-sm" onclick="location.href='admin_notice_list.ad?pageNumber=${pageNumber}'">
			<input type="button" name="update_btn" value="글수정" class="btn btn-default btn-sm"   onclick="location.href='admin_notice_update.ad?no_num=${noticeBean.no_num}&pageNumber=${pageNumber}'" >
			<input type="button" name="delete_btn" value="글삭제"  class="btn btn-default btn-sm"  onclick="location.href='admin_notice_delete.ad?no_num=${noticeBean.no_num}&pageNumber=${pageNumber }'" >		</td>
	</tr>		
</table>
</div>
</body> 

<br><br>
<%@ include file="admin_bottom.jsp" %>
