<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var use;
	var isCheck=false;
	$('#titleCheck').click(function(){
		isCheck=true;
		$.ajax({
			url : "idfunction.mem",
			data : ({id : $('input[name=id]').val()}),
			success : function(data){
				if(data=='false'){
					alert("사용할 수 있습니다.");
					use=false;
					isChange=false;
				}
				else{
					alert("이미 사용중인 아이디 입니다.");
					use=true;	
				}
			},
			error : function(){
	        	alert(data);
	        }
		});
	}); //titleCheck	
 	$('#sub').click(function(){
 		if($('input[name=id]').val()==""){
 			alert("아이디를 입력하세요");
 			return false;
 		}
		if(use==true){
			alert("이미 사용중인 아이디 입니다.");
			return false;
		} else if(isCheck==false||isChange==true){
			alert("아이디 중복체크 해주세요");
			return false;
		}
	});
	$('input[name=id]').keydown(function(){
		isChange=true;
		use=false;
	});

});//ready
</script>

<center>
<br>
<h3>회원가입</h3>
<br>
<form name="myform" action="insert.mem" method="post">
	<div class="container"> 
	<table class="table">
		<tr align="center">
		    <td width="33%">
		    </td>
			<th>아이디 :
				<input type="text" name="id">
				<input type="button" value="중복체크" id="titleCheck" class="btn btn-default btn-sm">
			</th>
			<td width="28%">
		     </td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			    비밀번호 : <input type="password" name="password" value="${memBean.password}">
			    <span id=""></span>
			</th>
			<td></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    비밀번호 확인 : <input type="password" name="repassword" value="${memBean.password}">
			</th>
			<td></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    이름 : <input type="text" name="name" value="${memBean.name}">
			</th>
			<td></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    생년월일 : <input type="date" name="birthday" value="${memBean.birthday }" style = "height : 30px;" >
			</th>
			<td></td>
		</tr>
		<tr>
			<td align="center" colspan="5">
			<input type="submit" value="가입하기" id="sub" class="btn btn-default btn-sm"></td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>
