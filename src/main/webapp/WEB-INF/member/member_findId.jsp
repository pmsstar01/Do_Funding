<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
	function findIdcheck(myform){
	 	if (myform.name.value==""){
			alert("이름을 입력하세요.");
			$('input[name=name]').focus();
			return false;
		}
		if (myform.birthday.value.length==0){
			alert("생년월일을 입력하세요.");
			$('input[name=birthday]').focus();
			return false;
		} 
	}
</script>
<center>
<br>
<h3>아이디찾기</h3>
<br>
<form action="findid.mem" method="post" name="myform">
	<div class="container">
    <table class="table" class="text-center">
	
	<tr align="center">
	    <td width="35%">
		</td>
		<th>
		       이름 : <input type="text" name="name">
		</th>
		<td width="33%">
		</td>
	</tr>
	<tr align="center">
	    <td>
		</td>
		<th>
		       생년월일 : <input type="date" name="birthday" style = "height : 30px;">
		</th>
		</th>
		<td>
	</tr>
	<tr>
		<td align="center"colspan="3">
			<input type="submit" value="아이디 찾기" class="btn btn-default btn-sm" onclick="return findIdcheck(myform)">
		</td>
	</tr>
</table>
</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>