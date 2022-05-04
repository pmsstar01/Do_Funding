<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common_top.jsp"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style type="text/css">
.div2 {
	position: fixed;
	top: 250px;
	right: 30px;
	width: 200px;
	margin: 10px;
	background: #F8FFFF;
}
</style>

<script type="text/javascript">
	function ordcheck(listSize) {
		if(listSize == 0){
			alert("최소 한 개 이상의 제품이 있어야 합니다.");
			return false;
		}
		if (document.myform.name.value == "") {
			alert("이름을 입력하세요.");
			document.myform.name.focus();
			return false;
		}
		if (document.myform.hp1.value == "") {
			alert("전화번호를 입력하세요.");
			document.myform.hp1.focus();
			return false;
		}
		if (isNaN(document.myform.hp1.value)) {
			alert("전화번호는 숫자만 입력 가능합니다.");
			document.myform.hp1.select();
			return false;
		}
		if (document.myform.hp2.value == "") {
			alert("전화번호를 입력하세요.");
			document.myform.hp2.focus();
			return false;
		}
		if (isNaN(document.myform.hp2.value)) {
			alert("전화번호는 숫자만 입력 가능합니다.");
			document.myform.hp2.select();
			return false;
		}
		if (document.myform.hp3.value == "") {
			alert("전화번호를 입력하세요.");
			document.myform.hp3.focus();
			return false;
		}
		if (isNaN(document.myform.hp3.value)) {
			alert("전화번호는 숫자만 입력 가능합니다.");
			document.myform.hp3.select();
			return false;
		}
		if (document.myform.address.value=="") {
			alert("주소를 입력하세요.");
			document.myform.addr.focus();
			return false;
		}
		if (document.myform.address2.value== "") {
			alert("상세주소를 입력하세요.");
			document.myform.d_addr.focus();
			return false;
		}
		
	}
	function delcartcheck(p_subject){
		var dep = confirm(p_subject+"(을)를 정말 장바구니에서 삭제하시겠습니까?");
		//prompt : 값을 입력 받을 수 있는 창 (제목, 초기값) 확인/취소 버튼이 있음.
		//comfirm : YES/NO t/f
		//alert(dep);
		if(dep){
			return true;
		}else{
			return false;
		}
	}
	
</script>
<body>
	<br>
	<h3 align="center">주문 및 결제</h3>
	<br>
	<form name="myform" action="calculate.ord" >
	<div class="div2" align="center" style="background-color: #fffcf6; border: 1px solid black;">
		<h3>결제금액</h3>
		<tr>
			<th class="text-center">총 금액</th>
			<td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###" /> 원</td>
			<br>
		</tr>
		<tr>
			<td>배송비</td>
		<c:choose> 
			<c:when test="${totalAmount > 30000}">
				0 원
			</c:when> 
			<c:when test="${totalAmount > 0  and totalAmount < 30000 }">
				3,000 원
			</c:when> 
			<c:otherwise>
				0 원
			</c:otherwise> 
		</c:choose> <br><br>
		</tr>               
		<tr>
			<td>최종 결제금액: 
			<c:choose> 
				<c:when test="${totalAmount > 30000}">
					<fmt:formatNumber value="${totalAmount}" pattern="###,###,###" /> 원
					<input type="hidden" name="amount" value="${totalAmount }">
				</c:when> 
				<c:when test="${totalAmount > 0  and totalAmount < 30000 }">
					<fmt:formatNumber value="${totalAmount+3000}" pattern="###,###,###" /> 원
					<input type="hidden" name="amount" value="${totalAmount+3000 }">
				</c:when> 
				<c:otherwise>
					<fmt:formatNumber value="${totalAmount}" pattern="###,###,###" /> 원
					<input type="hidden" name="amount" value="${totalAmount}">	
				</c:otherwise> 
			</c:choose> 
			</td>
		</tr>
		<br> <br> 
		<input type="submit" name="btn1" value="결제하기"  class="btn btn-default btn-sm" onclick="return ordcheck(${shopLists.size()})">	
		<a href="list.prd" class="btn btn-default btn-sm">추가 주문</a>		
	</div>	      			
	<div class="container">
          <table class="table" class="text-center">
              <tr >
			<th colspan="6" class="text-center">주문자 정보</th>
		</tr>
		<tr>
			<th colspan="2">주문자명</th>
			<td colspan="4">${loginInfo.name}(${loginInfo.id})</td>
		</tr>
		<tr>
			<th colspan="2">휴대폰 번호</th>
			<td colspan="4">${loginInfo.hp1}-${loginInfo.hp2}-${loginInfo.hp3}</td>
		</tr>
		<tr>
			<th colspan="6" class="text-center">배송정보</th>
		</tr>
		<tr>
			<th colspan="2">받는 분</th>
			<td colspan="4">
				<input type="text" name=name value="${loginInfo.name}"><br><br> 
				<input type="text" name="hp1" size="3" maxlength="3" value="${loginInfo.hp1}">- 
				<input type="text" name="hp2" size="4" value="${loginInfo.hp2}">-
				<input type="text" name="hp3" size="4" value="${loginInfo.hp3}">
			</td>
		</tr>
		<tr>
			<th colspan="2">배송지</th>
			<td colspan="4">
			<input type="text" name=address1 value="${loginInfo.address1}"> 
			<input type="text" name="address2" placeholder="상세 주소" value="${loginInfo.address2}"></td>
		</tr>
		<tr>
			<th colspan="2">배송 요청사항(선택)</th>
			<td colspan="4">
				<input type="text" name="del_request" placeholder="배송 요청사항을 입력하세요" size="40">
			</td>
		</tr>
		<tr>
			<th colspan="2">주문 요청사항(선택)</th>
			<td colspan="4">
				<input type="text" name="order_request" placeholder="주문 요청사항을 입력하세요" size="40">
			</td>
		</tr>
	</form>			
		<tr>
			<th colspan="7" class="text-center">상품 정보</th>
		</tr>
		<tr>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>상품 옵션</th>
			<th>주문 수량</th>
			<th>단가</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>
	<form name="reform" method="post" action="cart_list.ord">
		<c:choose>	
			<c:when test="${sessionScope.shopLists.size() ==0}">
				<tr>
					<td  colspan="7" class="text-center">장바구니에 담긴 상품이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach var="shopInfo" items="${sessionScope.shopLists}">
					<tr>
						<td>${shopInfo.p_num }</td>
						<td>${shopInfo.p_subject}</td>
						<td>${shopInfo.option_content }</td>
						<td>${shopInfo.qty }</td>
						<td><fmt:formatNumber value="${shopInfo.price }" pattern="###,###,###" /> 원</td>
						<td><fmt:formatNumber value="${shopInfo.amount }" pattern="###,###,###" /> 원</td>
						<td>			
						<input type="hidden" name="p_num" value="${shopInfo.p_num }"> 
						<input type="hidden" name="option_no" value="${shopInfo.option_no}"> 
						<input type="submit" value="삭제" onclick="return delcartcheck('${shopInfo.p_subject}')" class="btn btn-default btn-sm" > 
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</form>	
		</table>
	</div>
</body>
<%@ include file="../common/common_bottom.jsp"%>	