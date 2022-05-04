<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<center>
<br>
<h3>후원 기록</h3>
<br>
 <div class="container">
        <table class="table table-hover table-sm" class="text-center">
	<tr>
		<th>후원번호</th>
		<th>주문번호</th>
		<th>회원번호</th>	
		<th>주문일자</th>	
		<th>주문금액</th>	
		<th>후원금액</th>	
	</tr>

	<c:forEach var="donation" items="${donaList}">
		<tr>
			<td>
				${donation.dona_num }
			</td>
			<td>
				${donation.dona_o_num }
			</td>
			<td>
				${donation.dona_no }
			</td>
			<c:set var="o_date">
				<fmt:parseDate value="${donation.dona_date}" var="dateValue" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
			</c:set> 
			<td>
				${o_date }
			</td>
			<td >
				<fmt:formatNumber value="${donation.dona_buyprice}" pattern="###,###,###" /> 원	
			</td>
			<td>
				<fmt:formatNumber value="${donation.dona_money}" pattern="###,###,###" /> 원	
			</td>
		</tr>
		
	</c:forEach>
	
</table>
</div>
	<div class="container">
			<ul class="pagination pagination-sm">
				${pageInfo.pagingHtml}
			</ul>
	</div>
</center>


<%@ include file="../common/common_bottom.jsp" %>