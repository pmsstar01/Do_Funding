<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="admin_top.jsp"%>   
<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
</style>
<!-- <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head> -->
<center>
<h1>글목록</h1>
<div class="container">
<table class="table table-hover table-sm" class="text-center">
	    <tr>
			<td align="left" colspan="7">
				<input type="button" value="삭제"  class="btn btn-default btn-sm" onclick="selectDelete()">
			</td>
		</tr>	
		<tr>
			<th class="text-center">
					<input type="checkbox" name="allcheck" onclick="allRowCheck(this)">
			</th>
			<th class="text-center">번호</th>
			<th>제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성일</th>
			<th class="text-center">조회</th>
		</tr>
	    <form name="myform" action="admin_bd_multidelete.ad?" method="post">
		<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber }">
		<c:forEach var="bdBean" items="${requestScope.bdList}" varStatus="status">
		<tr>
		    <td align="center">
				<input type="checkbox" name="rowcheck" value="${bdBean.b_num}">
			</td>
			<td align="center" >
			${requestScope.totalCount - (requestScope.pageInfo.pageNumber-1)*requestScope.pageInfo.pageSize - status.index}</td>
			<td>
				<c:if test="${bdBean.b_re_level>0}">
					<c:set var="wid" value="${bdBean.b_re_level*20}"/>
					<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid}" height="15">
					<img src="<%=request.getContextPath() %>/resources/images/화살표2.png" height="15">
				</c:if>

			<a href="admin_bd_content.ad?b_num=${bdBean.b_num}&pageNumber=${pageInfo.pageNumber}" > ${bdBean.b_subject}</a>
				<!-- 글번호 뿐만 아니라 현재페이지도 넘겨야함! -->					
			<c:if test="${bdBean.b_readcount >=10 }">
				<img src='<%=request.getContextPath()%>/resources/images/best2.png' height='20'>
			</c:if>
			</td>
			<td align="center" >${bdBean.b_writer}</td>
			<td align="center" >
				<fmt:formatDate value="${bdBean.b_reg_date}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			<td align="center" >${bdBean.b_readcount}</td>
		</tr>
		</c:forEach>
</table>

<br><br>
	<div>
		<a href="admin_bd_insert.ad" class="btn btn-default btn-sm pull-right">글쓰기</a>	
	</div>
	<div class="container">
		<ul class="pagination pagination-sm">
			${pageInfo.pagingHtml}		
		</ul>
	</div>


<form action="admin_bd_list.ad" method="get" class="row g-3">
<p>
	<select name="whatColumn">
		<option value="all">선택
		<option value="b_content">내용
		<option value="b_subject">제목
		<option value="b_writer">글쓴이
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색"  class="btn btn-default btn-sm">
</p>	
</form>
</div>
</center>
<%@include file="admin_bottom.jsp"%>

