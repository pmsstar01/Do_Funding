 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
	var flag=true;
	function check_pw() {
		if(flag){
			$("#passcheckindex").append("<input type='password' placeholder='비밀번호를 입력하세요' style='float:center;' id='repassword'>"
									+"<button type='button' onclick='return pw_check()'>확인</button>"									
			);
		flag=false;
		}
	}
	function delconfirm() {
    	if (!confirm("회원탈퇴 하시겠습니까?")) {
        		alert("취소(아니오)를 누르셨습니다.");
    	} else {
       	 		alert("확인(예)을 누르셨습니다.");
				location.href="delete.mem?no=${loginInfo.no}";
    	}
	}
	function pw_check(){
		var password = document.getElementById('password').value;
		var repassword = document.getElementById('repassword').value;
		var id = document.getElementById('id').value;
		if(repassword != password){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else{
			location.href='update.mem?id='+id;			
		}
	}
</script>
<center>
<br>
<h3>회원정보</h3>
<br>

<div class="container">
    <table class="table" class="text-center">
	<tr>
	    <td width="30%"></td>
		<th width="28%">
			회원번호
		</th>		
		<td >
			${loginInfo.no }
			
		</td>
	    <td width="27%"><td>
	</tr>
	<tr>
	    <td></td>
		<th>
			ID
		</th>
		<td>
			${loginInfo.id }
			<input type="hidden" id="id" value="${loginInfo.id }">	
		</td>
		<td></td>
	</tr>
	<tr>
	    <td></td>
		<th>
			이름
		</th>
		<td>
			${loginInfo.name }
		</td>
		 <td><input type="hidden" id="password" value="${loginInfo.password }"></td>
	</tr>
	<tr>
	    <td></td>
		<th>
			생년월일
		</th>
		<c:set var="birthday">
			<fmt:parseDate value="${loginInfo.birthday}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 
		<td>
			${birthday }
		</td>
		 <td></td>
	</tr>
	<tr>
	     <td></td>
		<th>
			가입일
		</th>
		<c:set var="joindate">
			<fmt:parseDate value="${loginInfo.joindate}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 
		<td>
			${joindate }
		</td>
		 <td></td>
	</tr>
	<tr>
	     <td></td>
		<th>
			성별
		</th>
		<td>
			${loginInfo.gender }
		</td>
		<td></td>
	</tr>
	<tr>
	     <td></td>
		<th>
			핸드폰 번호
		</th>
		<td>
			${loginInfo.hp1 }-${loginInfo.hp2 }-${loginInfo.hp3 }
		</td>
		 <td></td>
	</tr>
	<tr>
	    <td></td>
		<th>
			주소
		</th>
		<td>
			${loginInfo.address1 } ${loginInfo.address2 }
		</td>
		 <td></td>
	</tr>
	<tr>
	    <td></td>
		<th>
			은행
		</th>
		<td>
			${loginInfo.accountbank }
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<th>
			입금전용 계좌
		</th>
		<td>
			${loginInfo.account }
		</td>
	    <td></td>
	</tr>
	<tr>
	    <td></td>
		<th>
			총 후원금액
		</th>
		<td>
			<fmt:formatNumber value="${loginInfo.mpoint }" pattern="###,###,###" /> 원			
		</td>
	    <td></td>
	</tr>
	<tr>
		<td colspan="10" align="center">
			<input type="button" value="정보수정"  class="btn btn-default btn-sm" onclick="check_pw()">
			<input type="button" value="회원탈퇴"  class="btn btn-default btn-sm" onclick="delconfirm()">
		</td>
	</tr>
	<tr>
		<td colspan="10" align="center" id="passcheckindex">
		</td>
	</tr>
</table>
</div>
</center>
<%@ include file="../common/common_bottom.jsp" %>