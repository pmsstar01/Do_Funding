<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>

<script type="text/javascript">
	function insert(){
		location.href = "insert.prd"; // ProductInsertController
	}
	function like(){
		document.likeform.submit();
	}

	function addcheck(id, account){
			if (document.myform.orderqty.value =="") {
				alert("수량을 입력해주세요.");
				document.myform.orderqty.focus();
				return false;
			}	
			if (isNaN(document.myform.orderqty.value)) {
				alert("수량은 숫자만 입력 가능합니다.");
				document.myform.orderqty.select();
				return false;
			}
			if (Number(document.myform.orderqty.value)<0||Number(document.myform.orderqty.value)==0) {
				alert("수량은 0보다 커야 합니다.");
				document.myform.orderqty.select();
				return false;
			}	
		
			if (Number(document.myform.orderqty.value)>99) {
				alert("수량은 100보다 작아야 합니다.");
				document.myform.orderqty.select();
				return false;
			}	
			document.myform.submit();
			if(isNaN(document.myform.orderqty.value)){
				alert("숫자만 입력 가능합니다.");
				document.myform.orderqty.select();
				return false;
			}
			if(id == null || id ==""){
				alert('로그인 후 이용가능합니다.');
				return false;
			}
			if(account ==null || account ==""){
				alert('계좌연동 후 이용가능합니다.');
				return false;
			}
	}
	
</script>
<center>
    <center>
    <br>
    <h3>펀딩 상세 화면<%-- (${productBean.p_num }/${pageNumber }) --%></h3>
    <br>
    </center>
    <div class="container">
    <table class="table" class="text-center">
    	<tr>
    		<td rowspan="10" align="center">
    			<img width=400 height=350  src="<%=request.getContextPath() %>/resources/images/${productBean.p_image}" alt="<%=request.getContextPath() %>/resources/images/no_image.jpg" >
    		</td>
    	</tr>
    	<tr>
    		<th>상품명</th>
    		<td>${productBean.p_subject }</td>
    	</tr>
    	<tr>
    		<th>가격</th>
    		<td><fmt:formatNumber value="${productBean.p_origin_price }" pattern="###,###,###" /> 원</td>
    	</tr>
    	<tr>
    		<th>설명</th>
    		<td>${productBean.p_content }</td>
    	</tr>
<c:set var="p_start_date">
	<fmt:parseDate value="${productBean.p_start_date}" var="dateValue" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
</c:set> 
<c:set var="p_end_date">
	<fmt:parseDate value="${productBean.p_end_date}" var="dateValue" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
</c:set> 
<%-- <c:set var="p_end_date"><fmt:formatDate value="${productBean.p_end_date}" pattern="yyyy-MM-dd" /></c:set> 	
 --%>    	<tr>
    		<th>펀딩 기간</th>
    		<td>${p_start_date}~${p_end_date}</td>
    	</tr>
    	
    	<tr>
    		<th>진행상황</th>
    		<td><fmt:formatNumber value="${(productBean.p_total_price/productBean.p_end_price)*100}" pattern=".00" /> %</td>
    	</tr>
    	
<!-- add.mall => mall.controller.CartAddController -->
<form name="myform" method="post" action="add.ord" onsubmit="return addcheck('${sessionScope.loginInfo.id}','${sessionScope.loginInfo.account}')">
    	<tr>
    		<th>옵션</th>
    		<td>
    			<select name="option_no">
    				<c:forEach var="optionBean" items="${optionList}">
    					<option value="${optionBean.option_no}">${optionBean.option_content}</option>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
 
    	<tr>
    		<th>주문수량</th>
    		<td colspan="2">
    				<input type="hidden" name="p_num" value="${productBean.p_num }">		
    				<input type="text" name=orderqty>	    			
<!-- 현재날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
	    			<input type="submit" value="주문"  class="btn btn-default btn-sm" <c:if test="${sysDate > p_end_date or sysDate < p_start_date}"> disabled</c:if> >

    		</td>   		
    	</tr>
 </form>	
    	
    	<tr>
    	 <th>찜하기<th>

				<form name="likeform" action="detail.prd" method="post"> <!-- form  -->
					<input type="hidden" name= "p_num" value="${productBean.p_num}"/>
					<input type="hidden" name= "like_check" value="${like_check}"/>
					<input type="hidden" name= "pageNumber" value="${pageNumber}"/>
					<input type="hidden" name= "whatColumn" value="${whatColumn}"/>
					<input type="hidden" name= "whatColumn1" value="${whatColumn1}"/>
					<input type="hidden" name= "keyword" value="${keyword}"/>

				<c:if test = "${loginInfo != null}">
					<c:if test="${like_check == 1}"><!--좋아요  -->
						<input type="image"
							src="<%=request.getContextPath()%>/resources/images/heart_2.png" width="20px" height="20px" 
							onclick="like()">
					</c:if>
					<c:if test="${like_check == 0}"><!--좋아요x  -->
						<input type="image"
							src="<%=request.getContextPath()%>/resources/images/heart_1.png" width="20px" height="20px"
							onclick="like()">
					</c:if>
				</c:if>
				</form>
		</tr>
		<tr>
    		<td colspan="3">
    			<a href="list.prd?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}&whatColumn1=${whatColumn1}">상품 리스트</a>
    		</td>
    	</tr>
    </table>
    </div>
  </center>

<%@ include file="../common/common_bottom.jsp" %>
