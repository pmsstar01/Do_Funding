<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>   
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<style>
	.order-detail {
		background: #fffcf6;
		font: 14px Malgun Ghothic,"맑은고딕",sans-serif;
    	color: #555;
    	min-width:320px;
	}
</style>
<center>
<br>
<h3>주문 상세 내역</h3>
<br>
<c:set var="today" value="<%=new java.util.Date()%>" />
<fmt:parseNumber value="${today.time / (1000*60*60*24)}"
	integerOnly="true" var="t_Date"></fmt:parseNumber>
<c:set var="p_sysdate">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
</c:set>
	<div class="container">
            <table class="table" class="text-center">
            <td colspan="9" align="right"><a href="order.ord?pageNumber=${pageNumber}">주문내역</a></td>
			<tr>
				<th>상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>수량</th>
				<th>옵션</th>
				<th>결제금액</th>
				<th>펀딩률</th>
				<th>펀딩기간</th>
				<th>결과</th>
			</tr>
		</div>
		<c:set var="totalprice" value="0" />
		<div class="od-in" style="text-align: left;">
			<c:forEach var="odb" items="${detailList}">
<fmt:parseDate value="${odb.p_start_date}" var="sValue"
	pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${sValue.time / (1000*60*60*24)}"
	integerOnly="true" var="s_Date"></fmt:parseNumber>
<c:set var="p_start_date">
	<fmt:formatDate value="${sValue}" pattern="yyyy-MM-dd" />
</c:set>

<fmt:parseDate value="${odb.p_end_date}" var="eValue"
	pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${eValue.time / (1000*60*60*24)}"
	integerOnly="true" var="e_Date"></fmt:parseNumber>
<c:set var="p_end_date">
	<fmt:formatDate value="${eValue}" pattern="yyyy-MM-dd" />
</c:set>			
				<c:set var= "totalprice" value="${totalprice + odb.amount}"/>
				<tr>
					<td>${odb.p_subject}</td>
					<td ><img width="100px" height="100px" src="<%=request.getContextPath()%>/resources/images/${odb.p_image}"></td>
					<td><fmt:formatNumber value="${odb.price}" pattern="###,###,###" /> 원</td>
					<td>${odb.qty}</td>
					<td>${odb.option_content}</td>
					<td><fmt:formatNumber value="${odb.amount}" pattern="###,###,###" /> 원</td>
					<td><fmt:formatNumber value="${(odb.p_total_price/odb.p_end_price)*100}" pattern=".00" /> %</td>
					<td>${p_start_date} ~ ${p_end_date}</td>
					<td>
					<c:choose>
						<c:when test="${0<(t_Date-e_Date)}">
							<c:choose>
								<c:when test="${(odb.p_total_price>=odb.p_end_price)}">
										펀딩 성공<br>
									-상품 배송중-
								</c:when>
								<c:otherwise>
										펀딩 실패<br>
									-펀딩금 반환처리중-
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${0>(t_Date-e_Date)}">
							펀딩 진행중
						</c:when>
					</c:choose>
					</td>
				</tr>
			</c:forEach>	
		</div>
		<tr>
			<td colspan="9" align="right">
				총 결제금액 : 
				<c:choose>
					<c:when test="${totalprice>30000}">
						<fmt:formatNumber value="${totalprice}" pattern="###,###,###" /> 원
					</c:when>
					<c:when test="${totalprice > 0  and totalprice < 30000 }">
						<fmt:formatNumber value="${totalprice+3000}" pattern="###,###,###" /> 원	
					</c:when> 
					<c:otherwise>
							<fmt:formatNumber value="${totalprice}" pattern="###,###,###" /> 원	
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</div>
</center>
<%@ include file="../common/common_bottom.jsp" %>  