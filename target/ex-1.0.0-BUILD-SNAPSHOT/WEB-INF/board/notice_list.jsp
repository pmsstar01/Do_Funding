<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/kfonts2.css" rel="stylesheet">
</head>
<center>
<h1>공지글 목록</h1>
<div class="container">
<table class="table table-hover table-sm" class="text-center">
	
	<tr>
		<th class="text-center">번호</th>
		<th colspan="2" class="text-center">제목</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회</th>
	</tr>
		<c:if test="${noticeList == null}">
			등록된 공지글이 없습니다.
		</c:if>
		<c:forEach var="noticeBean" items="${noticeList}" varStatus="status">
		<tr>
			<td align="center" >${requestScope.totalCount - (requestScope.pageInfo.pageNumber-1)*requestScope.pageInfo.pageSize  - status.index}</td>
			<td colspan="2">
				<a href="notice_content.bd?no_num=${noticeBean.no_num}&pageNumber=${pageInfo.pageNumber}" > ${noticeBean.no_subject}</a>
			</td>
			<td align="center" >
				<fmt:formatDate value="${noticeBean.no_reg_date}" pattern="yyyy-MM-dd"/>
			</td>
			<td align="center" >${noticeBean.no_readcount}</td>
		</tr>
		</c:forEach>
</table>
<br><br>
	<div class="container">
		<ul class="pagination pagination-sm">
			${pageInfo.pagingHtml}		
		</ul>
	</div>
</center>

<form action="notice_list.bd" method="get" class="row g-3">
<p>
	<select name="whatColumn">
		<option value="all">선택
		<option value="no_content">내용
		<option value="no_subject">제목
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색" class="btn btn-default btn-sm">
</p>	
</form>


<%@ include file="../common/common_bottom.jsp" %>  

