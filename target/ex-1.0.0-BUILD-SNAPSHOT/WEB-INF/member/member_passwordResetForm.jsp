<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
	function resetcheck(myform){
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
	}
</script>
<center>
<br>
<h3>비밀번호 재설정</h3>
<br>

<form action="resetpw.mem" method="post" name="myform"> 
	<div class="container">
    <table class="table" class="text-center">
     
		<tr align="center">
		    <td width="30%">
		    </td>
			<th>
			     아이디 :	<input type="text" name="id" <c:if test="${loginInfo.id != null}">value="${loginInfo.id }" readonly</c:if>>
			<th>
			<td width="28%">
		    </td>			
		</tr>
		<tr align="center">
		    <td>
		    </td>
			<th>
			     비밀번호 : <input type="password" name="password">
			<th>
			 <td>
		    </td>			
		</tr>
		<tr align="center">
		     <td>
		    </td>
			<th>
			     비밀번호 확인 : <input type="password" name="repassword">
			<th>
			 <td>
		    </td>			
		</tr>
		<tr align="center">
		     <td>
		    </td>
			<th>
			     이름 : <input type="text" name="name" <c:if test="${loginInfo.name != null}">value="${loginInfo.name }" readonly</c:if>>
			<th>
			 <td>
		    </td>			
		</tr>
		<tr align="center">
		     <td>
		    </td>
			<th>
			     생년월일 : 
			     <c:set var="birthday">
				<fmt:parseDate value="${loginInfo.birthday}" var="dateValue" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
			    </c:set> 
			     <input type="date" name="birthday"  style = "height : 30px;" <c:if test="${loginInfo.birthday != null}">value="${birthday }" readonly</c:if>>
			<th>
			 <td>
		    </td>			
		</tr>
		<tr>
			<td colspan="5" align="center">
			<input type="submit" value="변경하기"  class="btn btn-default btn-sm" onclick="return resetcheck(myform)">
			</td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>