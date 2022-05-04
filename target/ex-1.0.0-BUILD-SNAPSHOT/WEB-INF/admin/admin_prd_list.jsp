<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<center>
	<h3>펀딩 목록</h3>
	<form action="admin_prd_list.ad" method="get">
		<select name="whatColumn">
			<option value="all">선택</option>
			<option value="p_subject">펀딩명</option>
			<option value="p_content">설명</option>
		</select> 
		<input type="text" name="keyword"> 
		<input type="submit" value="검색" class="btn btn-default btn-sm">
	</form>
	<div class="container">
    <table class="table table-hover table-sm" class="text-center">
		<tr>
			<td align="left" colspan="8">
				<input type="button" value="삭제" class="btn btn-default btn-sm" onclick="selectDelete()">
				<input type="button" value="추가하기" class="btn btn-default btn-sm" onclick="insertPrd()">
			</td>
			<td colspan="3" align="right">
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
				Today : ${sysDate} 								
			</td>
		</tr>
		<tr>
			<td align="center" width="40px">
				<input type="checkbox" name="allcheck" onclick="allRowCheck(this)">
			</td>
			<th>펀딩번호</th>
			<th>펀딩명</th>
			<th>이미지</th>
			<th>가격</th>
			<th>펀딩금액</th>
			<th>확정금액</th>
			<th>진행률</th>
			<th>마감일</th> 
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<form name="myform" action="admin_prd_multidelete.ad? method="post">
		<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber }">
		<c:forEach var="prdBean" items="${prdList}">
			<tr>
				<td align="center" >
					<input type="checkbox" name="rowcheck" value="${prdBean.p_num }">
				</td>
				<td><c:out value="${prdBean.p_num}" /></td>
				<td>
					${prdBean.p_subject}
				</td>
				<td>
					<img width="100" height="100" alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
					src="<%=request.getContextPath() %>/resources/images/${prdBean.p_image}"><br>
				</td>
				<td><fmt:formatNumber value="${prdBean.p_origin_price}" pattern="###,###,###,###" /> 원</td>
				<td><fmt:formatNumber value="${prdBean.p_total_price}" pattern="###,###,###,###" /> 원</td>
				<td><fmt:formatNumber value="${prdBean.p_end_price}" pattern="###,###,###,###" /> 원</td>
				<td><fmt:formatNumber value="${(prdBean.p_total_price/prdBean.p_end_price)*100}" pattern=".00" /> %</td>	
 				<td>
 				<c:set var="end_date">
 					<fmt:parseDate value="${prdBean.p_end_date}" var="dateValue" pattern="yyyy-MM-dd" />
 					<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
 				</c:set>
 					${end_date}
 				</td>
				<td>
					<input type="button" value="수정" class="btn btn-default btn-sm" onclick="updatePrd('${prdBean.p_num}','${pageInfo.pageNumber}')">				
				</td>
				<td>
					<input type="button" value="삭제" class="btn btn-default btn-sm" onclick="deletePrd('${prdBean.p_num}','${pageInfo.pageNumber}')">				
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
		<br>
		<br>
	<div class="container">
			<ul class="pagination pagination-sm">
				${pageInfo.pagingHtml}
			</ul>
	</div>
</center>
<%@ include file="admin_bottom.jsp"%>