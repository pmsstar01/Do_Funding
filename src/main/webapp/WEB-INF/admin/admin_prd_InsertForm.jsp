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
<%-- <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/option.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		} 
		else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		} 
	
	// 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename); 
	}); 
	//preview image 
	var imgTarget = $('.preview-image .upload-hidden'); 

	imgTarget.on('change', function(){ 
		var parent = $(this).parent(); 
		parent.children('.upload-display').remove(); 
		
		if(window.FileReader){ 
			//image 파일만 
			if (!$(this)[0].files[0].type.match(/image\//)) return;
			var reader = new FileReader(); 
			reader.onload = function(e){ 
				var src = e.target.result; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
			} 
			reader.readAsDataURL($(this)[0].files[0]);
		} 
		else { 
			$(this)[0].select(); 
			$(this)[0].blur(); 
			var imgSrc = document.selection.createRange().text; 
			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
			var img = $(this).siblings('.upload-display').find('img'); 
			img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
		} 
	});
	
	
	
	
});
</script>
<center>
<h3>제품 추가 화면(${loginInfo.id})</h3>

<div >
	<form:form commandName="prdBean" action="admin_prd_insert.ad" method="post" enctype="multipart/form-data" >
		<div class="container">
        <table class="table table-hover table-sm" class="text-center">
				<tr>
					<th>작성자</th>
					<td>
						<c:if test="${loginInfo == null}">
							<input type="text" name="p_writer" value="admin" readonly="readonly">
						</c:if>
						<c:if test="${loginInfo != null}">
							<input type="text" name="p_writer" value="${loginInfo.id}" >
						</c:if>						 
					</td>
				</tr>
				<tr>
					<th>제품 분류</th>
					<td>
						<select name="p_category_fk">
								<c:forEach var="cateBean" items="${cateList}" >
									<option  value="${cateBean.getCode()}" <c:if test="${cateBean.code eq prdBean.p_category_fk }"> selected</c:if>> ${cateBean.getCname()}</option>
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
					    <input class="upload-name" value="파일선택" disabled="disabled">
					    <label for="input-file" class='btn btn-default btn-sm'>업로드</label> 
					    <input type="file" id="input-file" class="upload-hidden" name="upload">
					</td>
				</tr>
				<tr>
					<th>펀딩 내용</th>
					<td>
						<textarea name="p_content" rows="15" cols="50" placeholder="지원사업소개는 최소 20자 이상 입력해야 합니다." style="resize: none;" >${prdBean.p_content}</textarea>
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
				<tr>
					<th>펀딩 시작일</th>
					<td>
						<input type="date" name="p_start_date" value="${prdBean.p_start_date}" >
						<br><span>ex) 2022-04-21 </span>
					</td>
				</tr>
				<tr>
					<th>펀딩 마감일</th>
					<td>
						<input type="date" name="p_end_date" value="${prdBean.p_end_date}">
						<br><span>ex) 2022-04-21 </span>
					</td>
				</tr>

			</table>
			</div>

			<div class="container"  >
			 <table class="table table-hover table-sm" class="text-center" padding: 10px; margin: 10px;>
					<div style="border: 1px solid; padding: 25px;">
						<b>제품 옵션</b> 
						</td>
					</div>
					
						<span  style="float:right; margin:auto;">
							<button id="optionAdd_btn"  class="btn btn-default btn-sm" type="button">옵션추가</button>							
						</span>
					<br>
					<br>
					<div>
					    <div>
							<div id="optionIndex" >
								<div class='form-group' style='margin: 13px;' >
<!-- 								<input type='text' placeholder='옵션' class='form-control input-lg'  style='float:left;' name='item_option' id='item_option'>-->									
									<input type='text' placeholder='옵션'  style='float:left;' name='item_option' id='item_option' >
									<button type='button' onclick='option_del(this)' style='float:right;' id='optionDelBtn' name='optionDelBtn' class='btn btn-default btn-sm'>삭제</button>
								<br></div>
							</div>							
						</div>
					   </div>								
						<div>
							<font color="red">최소 1개의 옵션이 필요합니다. ex) (의류) 100, red ///(핸드폰) galaxy22 </font>
						</div>
					</div>
			        </table>
			</div>
			
			<div>
				<input type="submit" value="상품추가하기" class="btn btn-default btn-sm" onclick="return prdcheck()">
			</div>			
		</form:form>	
	</div>
</center>
<%@ include file="admin_bottom.jsp"%>