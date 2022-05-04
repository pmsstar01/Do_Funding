<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<script type="text/javascript">
	var count = 0;
	function memUpcheck(myform){
		if (myform.password.value.length==0){
			alert("비밀번호를 입력하세요.");
			myform.password.focus();
			return false;
		}
		if (myform.repassword.value != myform.password.value){
			alert("비밀번호가 일치하지 않습니다.");
			myform.repassword.focus();
			return false;
		}
		var genderarr = document.getElementsByName("gender");
		var flag = true;
		for(var i=0;i<genderarr.length;i++){
			if(genderarr[i].checked == true){ 
				flag = false;
			}
		}
		if(flag){
                alert("성별을 선택하세요."); 
			return false;
		}
		hp2value = myform.hp2.value;
		hp3value = myform.hp3.value;
		if(hp2value==""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		if(isNaN(hp2value)){
			alert("전화번호는 숫자만 입력 가능합니다.");
			return false;
		}
		if(hp3value==""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		if(isNaN(hp3value)){
			alert("전화번호는 숫자만 입력 가능합니다.");
			return false;
		}
		if(myform.address1.value.length==0){
			alert("주소를 입력하세요.");
			myform.address1.focus();			
			return false;
		}
		if(myform.address2.value.length==0){
			alert("상세 주소를 입력하세요.");
			myform.address2.focus();			
			return false;
		}
		if(myform.account.value.length==0){
			alert("계좌번호를 입력하세요.");
			myform.account.focus();			
			return false;
		}
		if(isNaN(myform.account.value)){
			alert("계좌번호는 숫자만 입력 가능합니다.");
			myform.account.focus();
			return false;
		}
	}
</script>
<center>
<br>
<h3 align="center">회원정보 수정</h3>
<br>
<form name="myform" action="update.mem" method="post"> 
	<div class="container">
    <table class="table" class="text-center">
		<tr align="center">
		    <td width="35%">
		    </td>
			<th>
			아이디 : <input type="text" name="id" <c:if test="${loginInfo.id != null}">value="${loginInfo.id }" readonly</c:if>>
			</th>
			<td width="28%">
		    </td>
		</tr>
		<tr align="center">
		    <td>
		    </td>
			<th>
			비밀번호 : <input type="password" name="password" <c:if test="${loginInfo.password != null}"> value='${loginInfo.password }'</c:if>>
			</th>
		    </td>
		</tr>
		<tr align="center">
		    <td>
		    </td>
			<th>
			비밀번호 확인 : <input type="password" name="repassword" <c:if test="${loginInfo.password != null}"> value='${loginInfo.password }'</c:if>>
			</th>
			<td>
		    </td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			이름 : <input type="text" name="name" <c:if test="${loginInfo.name != null}">value="${loginInfo.name }" readonly</c:if>>
			</th>
			<td></td>
		</tr>
		<tr align="center">
			<td></td>
			<th>
			생년월일 : 
			 <c:set var="birthday">
				<fmt:parseDate value="${loginInfo.birthday}" var="dateValue" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
			</c:set> 
				<input type="date" name="birthday" style = "height : 30px; " <c:if test="${loginInfo.birthday != null}">value="${birthday }" readonly</c:if>>
			</th>
			<td></td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			성별 : <input type="radio" name="gender" value="남" <c:if test="${loginInfo.gender eq '남' }">checked</c:if>>남
				  <input type="radio" name="gender" value="여" <c:if test="${loginInfo.gender eq '여' }">checked</c:if>>여
			</th>
			<td></td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			핸드폰 : <select name="hp1">
					<option value="010">010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="018">018
					<option value="019">019
				</select> - 
				<input type="text" name="hp2" value="${loginInfo.hp2 }" size="4px"> - 
				<input type="text" name="hp3" value="${loginInfo.hp3 }" size="4px">
			</th>
			<td></td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			주소 : <input type="text" name="address1" value="${loginInfo.address1 }">
			</th>
			<td></td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			상세주소 :	<input type="text" name="address2" value="${loginInfo.address2 }" size="24px">
			</th>
			<td></td>
		</tr>
		<tr align="center">
		    <td></td>
			<th style="line-height:50%">
			결제은행 : <select name="accountbank">
					<option value="국민은행">국민은행
					<option value="신한은행">신한은행
					<option value="농협">농협
					<option value="하나은행">하나은행
					<option value="SC제일">SC제일
					<option value="새마을금고">새마을금고
				</select> 
				<br>
				<br>
				<input type="text" name="account" style="margin-left:80px" value="${loginInfo.account }">
			</th>
			<td></td>
		</tr>			
		<tr>
			<td colspan="7" align="center"><input type="submit" value="변경하기" class="btn btn-default btn-sm" onclick="return memUpcheck(myform)"></td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>