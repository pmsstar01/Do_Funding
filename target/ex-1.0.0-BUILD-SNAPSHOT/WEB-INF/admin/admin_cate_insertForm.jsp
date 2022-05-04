<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="admin_top.jsp" %>
<center>
<br>
<b>카테고리 등록</b>
<br>
<form method="post"  action="admin_cate_insert.ad">
<div class="container">
<table class="table" class="text-center">

         <tr align="center">
			<th class="text-center">
				카테고리 코드 : <input type="text" name="code" value="${cateBean.code}">
			</th>
		</tr>
		 <tr align="center">
			<th class="text-center">
				카테고리 이름 : <input type="text" name="cname" value="${cateBean.cname}">
			</th>
		</tr>
		<tr> 
			<td colspan="2" align="center">
 			    <input type="submit" value="추가하기"  class="btn btn-default btn-sm" onclick="return catecheck()"> 
			</td>
		</tr>
 </table>
 </div>
 </form>
</center> 
<%@include file ="admin_bottom.jsp" %>