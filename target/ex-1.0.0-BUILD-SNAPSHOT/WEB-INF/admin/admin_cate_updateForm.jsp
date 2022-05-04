<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="admin_top.jsp" %>
<script type="text/javascript">

</script>
<center>
<br>
<b>카테고리 수정</b>
<br>
<form method="post" action="admin_cate_update.ad" name="myform">
	<input type="hidden" name="cnum" value="${cateBean.cnum}">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<div class="container">
    <table class="table" class="text-center">
		<tr>
			<th class="text-center">
			  카테고리 코드 : <input type="text" name="code" value="${cateBean.code}">
	        </th>		
		</tr>
		<tr>
			<th class="text-center">
			  카테고리 이름 : <input type="text" name="cname" value="${cateBean.cname}">
		    </th>
		</tr>
		<tr> 
			<td colspan="2" align="center">
 			    <input type="submit" value="수정하기" onclick="return catecheck()" class="btn btn-default btn-sm" > 
			</td>
		</tr>
 	</table>
 	</div>
</form>
</center>
<%@include file ="admin_bottom.jsp" %>