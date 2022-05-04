<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./admin_top.jsp"%>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */ 
.filebox .upload-display { /* 이미지가 표시될 지역 */ 
	margin-bottom: 5px; 
	width:150px;
	height: 150px;
} 
@media(min-width: 768px) {
 .filebox .upload-display { 
  display: inline-block; 
  margin-right: 5px; 
  margin-bottom: 0; 
 } 
} 
filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */ 
	display: inline-block;
	width: 54px; 
 	padding: 2px; 
	vertical-align: middle; 
	border: 1px solid #ddd; 
	border-radius: 5px; 
 	background-color: #fff; 
 } 
 .filebox .upload-display img { /* 추가될 이미지 */ 
 	display: block; 
	max-width: 100%; 
	width: 100% \9; 
 	height: auto; 
 }

</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/option.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 

	//preview image 
	var imgTarget = $('.preview-image .upload-hidden'); //file

	imgTarget.on('change', function(){ //업로드 누르고 파일 추가 했을경우
		
			if(window.FileReader){ 		
				//image 파일만 
				if (!$(this)[0].files[0].type.match(/image\//)) return;
				var parent = $(this).parent(); 
				//기존 보여주던 이미지 제거
				parent.children('.upload-display').remove();
				
				if(window.FileReader){ // modern browser 
					var filename = $(this)[0].files[0].name; 
				} 
				else { // old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} 		
			
				// 추출한 파일명 삽입 기존꺼에 덮어씌우기
				 $('.filebox .upload-hidden').siblings('.upload-name').val(filename); 
					
					var reader = new FileReader(); 
					reader.onload = function(e){ 
						var src = e.target.result; 
						parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
					} 
					reader.readAsDataURL($(this)[0].files[0]);
			 }else { 
				$(this)[0].select(); 
				$(this)[0].blur(); 
				var imgSrc = document.selection.createRange().text; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
				var img = $(this).siblings('.upload-display').find('img'); 
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
			} 
	});
	
});
	function reprdlist(pageNumber){	//돌아가기
		location.href="admin_prd_list.ad?pageNumber="+pageNumber;
	}
</script>
<center>
<h2>제품 수정 화면(${loginInfo.id})</h2>
<div >
	<form action="admin_prd_update.ad" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="p_num" value="${prdBean.p_num}">
		<input type="hidden" name="p_readcount" value="${prdBean.p_readcount}">
		<input type="hidden" name="p_total_price" value="${prdBean.p_total_price}">
		<input type="hidden" name="p_reg_date" value="${prdBean.p_reg_date}">
		<input type="hidden" name="pageNumber" value="${pageNumber}">
		<input type="hidden" name="option_item_no" value="${prdBean.option_item_no}">
		<div class="container">
        <table class="table table-hover table-sm" class="text-center">
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="p_writer" value="${prdBean.p_writer}" readonly="readonly">					 
					</td>
				</tr>
				<tr>
					<th>제품 분류</th>
					<td>
						<select name="p_category_fk">
								<c:forEach var="category" items="${cateList}" >
									<option  value="${category.getCode()}" <c:if test="${category.code eq prdBean.p_category_fk }"> selected</c:if>> ${category.getCname()}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>펀딩 제목</th>
					<td>
						<input type="text" name="p_subject" value="${prdBean.p_subject}">
					</td>
				</tr>
				<tr>
					<th>이미지 파일</th>
					<td class="filebox preview-image">
					<div class="upload-display"><div class="upload-thumb-wrap"><img src="<%=request.getContextPath()%>/resources/images/${prdBean.p_image}" class="upload-thumb"></div></div>
					    <input class="upload-name" value="${prdBean.p_image}" disabled="disabled" id="uploadFile">
					    <label  for="input-file" class='btn btn-default btn-sm'>업로드</label> 
					    <input type="file" id="input-file" class="upload-hidden"  name="upload"> 
					    <input type="hidden" id="p_image1" name="p_image1" class="p_image1" value="${prdBean.p_image}" />
				  				 
					</td>
				</tr>
				<tr>
					<th>게시글 내용</th>
					<td>
						<textarea name="p_content" rows="15" cols="50" style="resize: none;" >${prdBean.p_content}</textarea>
					</td>
				</tr>
				<tr>
					<th>단가</th>
					<td>
						<c:if test="${prdBean == null}">
							<input type="text" name="p_origin_price" value="0">
						</c:if>
						<c:if test="${prdBean != null}">
							<input type="text" name="p_origin_price" value="${prdBean.p_origin_price}">
						</c:if>											
					</td>
				</tr>
				<tr>
					<th>목표 금액</th>
					<td>
						<c:if test="${prdBean == null}">
							<input type="text" name="p_end_price" value="0">
						</c:if>
						<c:if test="${prdBean != null}">
							<input type="text" name="p_end_price" value="${prdBean.p_end_price}">
						</c:if>						
					</td>
				</tr>	
		<c:set var="p_start_date">
			<fmt:parseDate value="${prdBean.p_start_date}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 
		<c:set var="p_end_date">
			<fmt:parseDate value="${prdBean.p_end_date}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 							
				<tr>
					<th>펀딩 시작일</th>
					<td>
						<input type="date" name="p_start_date" value="${p_start_date}" >
						<br><span>ex) 2022-04-21 </span>
					</td>
				</tr>
				<tr>
					<th>펀딩 마감일</th>
					<td>
						<input type="date" name="p_end_date" value="${p_end_date}">				
						<br><span>ex) 2022-04-21 </span>
					</td>
				</tr>

			</table>
			</div>

			 <div class="container"  >
			 <table class="table table-hover table-sm" class="text-center">
				<div>
					<div style="border: 1px solid; padding: 25px;">
						<b>제품 옵션</b> 						
					</div>
					<span style="float:right; margin:auto;">
							<button id="optionAdd_btn" class="btn btn-default btn-sm" type="button">옵션추가</button>
					</span>
					<br>
					<br>
					<div>
						<div>
							<div id="optionIndex" >
								<c:forEach var="option" items="${opList}">
									<div class='form-group' style='margin: 13px;' >
										<input type='text' placeholder="옵션"  style="float:left;" name='item_option' id='item_option' class="item_option" value="${option.option_content}">
										<button type='button' onclick='option_del(this)' style='float:right;' id='optionDelBtn' name='optionDelBtn' class='btn btn-default btn-sm'>삭제</button>
										<form:errors cssClass="err" path="item_option" />
									<br></div>
								</c:forEach>
							</div>
						</div>
						<div>
							<font color="red">최소 1개의 옵션이 필요합니다. ex) (의류) 100, red ///(핸드폰) galaxy22 </font>
						</div>
					</div>
				</div>
				</table>
			</div>
			<div>
				<input type="submit" value="상품수정하기" class="btn btn-default btn-sm" onclick="return prdUpcheck()">
				<input type="button" value="돌아가기" class="btn btn-default btn-sm" onclick="reprdlist('${pageNumber}')">
			</div>
		</form>	
	</div>
</center>
<%@ include file="admin_bottom.jsp"%>