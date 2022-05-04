<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script>
	//다중 삭제
	function selectDelete() {
	
		var chkArr = document.getElementsByName("rowcheck");
	
		flag = false;
		for (var i = 0; i < chkArr.length; i++) {
			if (chkArr[i].checked == true) {
				flag = true;
			}
		}
		if (flag == false) {
			alert("삭제할 체크박스를 하나 이상 선택하세요.");
			return; //돌아가 밑에는 못 간다.return t/f 중요하지 않다.
		}
		var dep = confirm("정말 삭제하시겠습니까?");
		if(dep){
			document.myform.submit();//submit 누른것처럼 동작해라.
		}
	}//selectDelete
	
	function allRowCheck(allck){ 
		var chkArr = document.getElementsByName("rowcheck");
		var check = allck.checked;	
		if (check) {﻿
	        for (var i=0; i<chkArr.length; i++){ //배열의 길이만큼
	        	   chkArr[i].checked = true;
	        }
	    } 
		else {
	        for (var i=0; i<chkArr.length; i++) {
	          chkArr[i].checked = false;
	         }
	    }
	}// allRowCheck	
</script>

<center>
<br>
<h3>찜목록</h3>
<br>
	<div class="container">
    <table class="table" class="text-center">
	    <tr>
			<td align="left" colspan="6">
				<input type="button" value="삭제"  class="btn btn-default btn-sm" onclick="selectDelete()">
			</td>
			<td>
				<a href="list.prd" class="btn btn-default btn-sm pull-right">상품보기</a>	
			</td>
		</tr>	
		<tr>
			<th class="text-center">
					<input type="checkbox" name="allcheck" onclick="allRowCheck(this)">
			</th>
			<th class="text-center">펀딩번호</th>
			<th>상품명</th>
			<th class="text-left">이미지</th>
			<th class="text-left">가격</th>
			<th class="text-left">진행률</th>
			<th class="text-left">마감일</th>
		</tr>
	    <form name="myform" action="like_multidelete.like?" method="post">
		<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber }">
		<c:forEach  var="prdBean" items="${prdlist}" varStatus="status">
		<tr>
		    <td align="center">
				<input type="checkbox" name="rowcheck" value="${prdBean.p_num }">
			</td>
			<td align="center" >
				<c:out value="${prdBean.p_num}" />
			</td>
			<td>
				<a href="detail.prd?p_num=${prdBean.p_num}">${prdBean.p_subject}</a>
			</td>
			<td>
				<img width="100" height="100" alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
				src="<%=request.getContextPath() %>/resources/images/${prdBean.p_image}"><br>
			</td>
			<td>
				<fmt:formatNumber value="${prdBean.p_origin_price}" pattern="###,###,###" /> 원	
			</td>
			<td><fmt:formatNumber value="${(prdBean.p_total_price/prdBean.p_end_price)*100}" pattern=".00" /> %</td>
			<td>
				<c:set var="end_date">
					<fmt:parseDate value="${prdBean.p_end_date}" var="dateValue" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
				</c:set>
				${end_date}
			</td>
		</tr>
		</c:forEach>
</table>
</div>
<br><br>
	<div class="container">
		<ul class="pagination pagination-sm">
			${pageInfo.pagingHtml}		
		</ul>
	</div>
<br><br>
</div>
</center>


<%@ include file="../common/common_bottom.jsp"%>
