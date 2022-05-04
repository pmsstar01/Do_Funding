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
<body>
<h1>글내용 보기</h1>
<div class="container">
<table class="table" class="text-center">
	<tr align="center">
		<th class="text-center">제목</th>
		<td colspan="5" align="left">${bdBean.b_subject}</td>
	</tr>
	<tr>
		<th class="text-center" width="100">작성자</th>
		<td width="250">${bdBean.b_writer}</td>
		<th class="text-center" width="100">작성일</th>
		<td width="350">
			<fmt:formatDate value="${bdBean.b_reg_date}" pattern="yyyy-MM-dd HH:mm"/>
		</td>
		<th class="text-center" width="100">조회수</th>
		<td>${bdBean.b_readcount}</td>
	</tr>

	
	<tr height="200">
	     <th class="text-center">글내용</th>
 		<td colspan="6" >
			${bdBean.getB_content() }
		</td>
	</tr>

	<tr height="30">
		<td align="center" colspan="6">
			<input type="button" name="delete_btn" value="글삭제" class="btn btn-default btn-sm" onclick="location.href='admin_bd_delete.ad?b_num=${bdBean.getB_num()}&b_ref=${bdBean.getB_ref()}&pageNumber=${pageNumber }'" >
			<input type="button" name="reple_btn" value="답글쓰기" class="btn btn-default btn-sm" onclick="location.href='admin_bd_reply.ad?b_ref=${bdBean.b_ref}&b_re_step=${bdBean.b_re_step}&b_re_level=${bdBean.b_re_level}&pageNumber=${pageNumber}'" >
			<input type="button" name="list_btn" value="글목록" class="btn btn-default btn-sm" onclick="location.href='admin_bd_list.ad?pageNumber=${pageNumber}'">
		</td>
	</tr>		
</table>
</div>
</body> 

<br><br>
<%@include file="admin_bottom.jsp"%>


