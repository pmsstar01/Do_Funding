<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp"%>
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
	function check(){
 		if(document.myform.name.value.length==""){
 			alert("이름을 입력하세요.");
 			document.myform.name.focus();
 			return false;
 		}
 		if(document.myform.hp1.value.length==""){
 			alert("전화번호를 입력하세요.");
 			document.myform.hp1.focus();
 			return false;
 		}
 		if (isNaN(document.myform.hp1.value)) {
			alert("전화번호는 숫자만 입력가능합니다");
			document.myform.hp1.select();
			return false;
		}
 		if(document.myform.hp2.value.length==""){
 			alert("전화번호를 입력하세요.");
 			document.myform.hp2.focus();
 			return false;
 		}
 		if (isNaN(document.myform.hp2.value)) {
			alert("전화번호는 숫자만 입력가능합니다");
			document.myform.hp2.select();
			return false;
		}
 		if(document.myform.hp3.value.length==""){
 			alert("전화번호를 입력하세요.");
 			document.myform.hp3.focus();
 			return false;
 		}
 		if (isNaN(document.myform.hp3.value)) {
			alert("전화번호는 숫자만 입력가능합니다");
			document.myform.hp3.select();
			return false;
		}
 		if(document.myform.addr.value.length==""){
 			alert("주소를 입력하세요.");
 			document.myform.addr.focus();
 			return false;
 		}
 		if(document.myform.d_addr.value.length==""){
 			alert("상세주소를 입력하세요.");
 			document.myform.d_addr.focus();
 			return false;
 		}
	}
</script>
<body>
<!-- OrderMallController => order_order.jsp -->
<br><br>

<div class="div1" align="center"> 
	<form name="myform" action=""><!-- action -->
	<h2>주문 및 결제</h2>
	<h3>주문 정보</h3>
		주문자명
		${loginInfo.name}(${loginInfo.id})
		<br>
		휴대폰 번호
		${loginInfo.hp1}-${loginInfo.hp2}-${loginInfo.hp3}
		<br>
			<h3>배송정보</h3>
				<p>받는 분<br> 
					<input type="text" name=name value="${loginInfo.name}"><br> 
					<input type="text" name="hp1" size="2" value="${loginInfo.hp1}">-
					<input type="text" name="hp2" size="2" value="${loginInfo.hp2}">-
					<input type="text" name="hp3" size="2" value="${loginInfo.hp3}"><br>
				</p><br>
				<p>
					배송지<br> <input type="text" name="addr" value="${loginInfo.address1} ${loginInfo.address2}"><br>
					<input type="text" name="d_addr" placeholder="상세 주소">
				</p><br>
				<p>
					배송 요청사항(선택)<br> <input type="text" placeholder="배송 요청사항을 입력하세요" size="40">
				</p><br>
	<h3>주문 요청사항(선택)</h3>
		<input type="text" placeholder="주문 요청사항을 입력하세요" size="40"><br>
	<br>
	<h3>상품 정보<h3>
				<table>
					<tr>
						<td>상품명</td>
						<td>${productBean.p_subject }</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td>${optionBean.option_content }</td>
					</tr>
					<tr>
						<td>주문 수량</td>
						<td>${param.o_qty }개</td>
					</tr>
					<tr>
						<td>개당 가격</td>
						<td>${productBean.p_origin_price }원</td>
					</tr>
					<tr>
						<td>금액</td>
						<td>${productBean.p_origin_price*param.o_qty }원</td>
					</tr>
				</table>
			<br>
			<h4>배송 안내사항</h4>
				기본 배송비는 3000원이며 30000원 이상 주문 시 무료배송입니다.<br>
				주문 확인 후 입금 계좌를 개별 안내드리며, 미입금 시 주문이 취소될 수 있습니다. <br> <br> <br> <br> <br> <br> <br>
</div>
<div class="div2">
	<h3>결제금액</h3>

	<tr>
		<td>상품금액</td>
		<td>${productBean.p_origin_price*param.o_qty }</td>
		<br>
	</tr>
	<tr>
		<td>배송비</td>
	<c:choose> 
		<c:when test="${productBean.p_origin_price*param.o_qty > 30000}">
			0
		</c:when> 
		<c:when test="${productBean.p_origin_price*param.o_qty > 0  and productBean.p_origin_price*param.o_qty < 30000 }">
			3000
		</c:when> 
		<c:otherwise>
			0
		</c:otherwise> 
	</c:choose> <br><br>
	</tr>
	<tr>
		<td>최종 결제금액: 
		<c:choose> 
			<c:when test="${productBean.p_origin_price*param.o_qty > 30000}">
			${productBean.p_origin_price*param.o_qty}
		</c:when> 
		<c:when test="${productBean.p_origin_price*param.o_qty > 0  and productBean.p_origin_price*param.o_qty < 30000 }">
			${productBean.p_origin_price*param.o_qty+3000}
		</c:when> 
		<c:otherwise>
			${productBean.p_origin_price*param.o_qty}
		</c:otherwise> 
		</c:choose> 
		</td>
	</tr>
	<br> <br> 
	<input type="submit" name="btn1" value="결제하기" onclick="return check()">
	</form>	
</div>
</body>
<%@ include file="../common/common_bottom.jsp"%>