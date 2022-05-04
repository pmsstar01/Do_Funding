<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp"%>
<center>
	<div>
		<h3 align="center">카테고리 목록</h3>
		<div >
			<form method="get" action="admin_cate_list.ad">
				<select name="whatColumn">
					<option value="all">전체검색</option>
					<option value="code">코드</option>
					<option value="cname">카테고리명</option>
				</select> 				
				<input type="text" name="keyword" >
				<input type="submit" value="검색"  class="btn btn-default btn-sm">
			</form>
		</div>
		<br>
		 <div class="container">
         <table class="table table-hover table-sm" class="text-center">
			<tr>
				<td align="left" colspan="6">
					<input type="button" value="삭제"  class="btn btn-default btn-sm" onclick="selectDelete()">
					<input type="button" value="추가"  class="btn btn-default btn-sm"onclick="insertCate()">
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="checkbox" name="allcheck" onclick="allRowCheck(this)">
				</td>
				<th align="center">번호</th>
				<th align="center">카테고리 코드</th>
				<th align="center">카테고리명</th>
				<th align="center" width="150">삭제</th>
				<th align="center">수정</th>
			</tr>
			<form name="myform" action="admin_cate_multidelete.ad" method="post">
				<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber }">
				<c:forEach var="cateBean" items="${cateList}">
					<tr>
						<td align="center"><input type="checkbox" name="rowcheck"
							value="${cateBean.cnum }"></td>
						<td>${cateBean.cnum}</td>
						<td>${cateBean.code}</td>
						<td>${cateBean.cname}</td>
						<td>
							<input type="button" value="삭제"  class="btn btn-default btn-sm"
							onclick="deleteCate('${cateBean.cnum}','${pageInfo.pageNumber}')">
						<td><input type="button" value="수정"  class="btn btn-default btn-sm"
							onclick="updateCate('${cateBean.cnum}','${pageInfo.pageNumber}')">
						</td>
					</tr>
				</c:forEach>
			</form>
		</table>
		</div>
		<br>
		<br>
		<div class="container">
			<ul class="pagination pagination-sm">${pageInfo.pagingHtml}
			</ul>
		</div>
	</div>
</center>
<%@include file="admin_bottom.jsp"%>