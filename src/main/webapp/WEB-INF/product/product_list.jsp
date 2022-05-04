<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp"%>
<!doctype html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/kfonts2.css"
	rel="stylesheet">
</head>
<% 
	request.setCharacterEncoding("UTF-8");

	if(request.getAttribute("msg") != null){
	String msg=(String)request.getAttribute("msg");
	out.println("<script> alert('"+msg+"');</script>");
	request.removeAttribute("msg");
}%>
<script type="text/javascript">
 	/* window.onload function hihi(){
		prompt("안녕?") 
 	} */
</script>
<div align="center">
	<c:if test="${rotatorlist ne null}">
		<div class="container" style="width: 100%">
			<!--  <h2>캐러셀 슬라이드 효과  </h2> -->
			<div id="carousel-example-generic" class="carousel slide" style="width: 100%; background: url(<%=request.getContextPath()%>/resources/images/carousel.png) no-repeat;">

				<!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				</ol>
				<!-- Carousel items  여기 foreach돌려서 최신상품 5개 정도 나오개 반복-->
				<div class="carousel-inner">
					<div class="item active">
						<a
							href="detail.prd?p_num=${rotatorlist.get(0).p_num}&pageNumber=${pageInfo.pageNumber}">
							<img
							src="<%=request.getContextPath()%>/resources/images/${rotatorlist.get(0).getP_image()}"
							alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
							height="250px">
						</a>
					</div>
					<c:forEach var="rota_list" items="${rotatorlist}" begin="1">
						<div class="item">
							<a
								href="detail.prd?p_num=${rota_list.p_num}&pageNumber=${pageInfo.pageNumber}">
								<img
								src="<%=request.getContextPath()%>/resources/images/${rota_list.getP_image()}"
								alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
								width="300" height="150">
							</a>
						</div>
					</c:forEach>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span></a> 
				<a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span></a>
			</div>
		</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script>
			$('.carousel').carousel(); /* 1 */
		</script>
	</c:if>
	<br><br>
	
	<div>
		<form action="list.prd" method="get">
			<input type="hidden" name="whatColumn1" value="${pageInfo.whatColumn1}">
			<select name="whatColumn">
				<option value="all">선택</option>
				<option value="p_subject">상품명</option>
				<option value="p_content">설명</option>
			</select> <input type="text" name="keyword"> <input type="submit"
				value="검색" class="btn btn-default btn-sm">
		</form>
	</div>
	
	<div class="container">
		<c:if test="${prdList.size() == 0}">
			<img
				src="<%=request.getContextPath() %>/resources/images/no_image.jpg">
			<br>
					검색된 상품이 없습니다.			
		</c:if>
		<c:if test="${prdList ne null}">
			<c:set var="today" value="<%=new java.util.Date()%>" />
			<fmt:parseNumber value="${today.time / (1000*60*60*24)}"
				integerOnly="true" var="t_Date"></fmt:parseNumber>
			<c:set var="p_sysdate">
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
			</c:set>
			<div>
				<table border="1" width="800">
					<tr>
						<c:forEach var="prdBean" items="${prdList}" varStatus="status">
							<fmt:parseDate value="${prdBean.p_start_date}" var="sValue"
								pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${sValue.time / (1000*60*60*24)}"
								integerOnly="true" var="s_Date"></fmt:parseNumber>
							<c:set var="p_start_date">
								<fmt:formatDate value="${sValue}" pattern="yyyy-MM-dd" />
							</c:set>

							<fmt:parseDate value="${prdBean.p_end_date}" var="eValue"
								pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${eValue.time / (1000*60*60*24)}"
								integerOnly="true" var="e_Date"></fmt:parseNumber>
							<c:set var="p_end_date">
								<fmt:formatDate value="${eValue}" pattern="yyyy-MM-dd" />
							</c:set>

							<td align="center" width="250px">
								<table style="text-align: center; margin: 20px;">
										<c:choose>
												<c:when test="${0>(t_Date-s_Date)}">
												<tr>
													<td>
													<a href="detail.prd?p_num=${prdBean.p_num}&pageNumber=${pageInfo.pageNumber}&whatColumn=${pageInfo.whatColumn}&keyword=${pageInfo.keyword}&whatColumn1=${pageInfo.whatColumn1}">
														<img width="250px" height="250px"
														alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
														src="<%=request.getContextPath() %>/resources/images/comingsoon1.png"><br>
														${prdBean.p_subject}<br>
													</a>
													</td>
												</tr>
												<tr>
													<td><span style="float: left;">기간 : ${p_start_date} ~ ${p_end_date}</span></td>
												</tr>
												<tr>
													<td>
													<span style="float: left;">
													금액 : <fmt:formatNumber value="${prdBean.p_total_price}" pattern="###,###,###" />
													 /
 													<fmt:formatNumber value="${prdBean.p_end_price}" pattern="###,###,###" /> 
 													</span>
													 원 </td>
												</tr>
												<tr>
													<td><span style="float: left;">상품준비중…</span><br>
													</td>
												</tr>
												<tr>
													<td><input type="range" width="80%" name="userRange"
														min="1" max="${prdBean.p_end_price}"
														step="${prdBean.p_end_price/100}"
														value="${prdBean.p_total_price}" disabled="disabled" /></td>
												</tr>	
												</c:when>
												<c:otherwise>
												<tr>
													<td>
													<a href="detail.prd?p_num=${prdBean.p_num}&pageNumber=${pageInfo.pageNumber}&whatColumn=${pageInfo.whatColumn}&keyword=${pageInfo.keyword}&whatColumn1=${pageInfo.whatColumn1}">
														<img width="250px" height="250px"
														alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
														src="<%=request.getContextPath() %>/resources/images/${prdBean.p_image}"><br>
														${prdBean.p_subject}<br>
													</a>
													</td>
												</tr>
												<tr>
													<td><span style="float: left;">기간 : ${p_start_date} ~ ${p_end_date}</span></td>
												</tr>
												<tr>
													<td>
													<span style="float: left;">
													금액 : <fmt:formatNumber value="${prdBean.p_total_price}" pattern="###,###,###" />
													 /
 													<fmt:formatNumber value="${prdBean.p_end_price}" pattern="###,###,###" /> 
 													</span>
													 원</td>
												</tr>
												<tr>
													<td><span style="float: left;">진행률 :
															<fmt:formatNumber value="${(prdBean.p_total_price/prdBean.p_end_price)*100}" pattern=".00" /> %</span>															
															<span style="float: right;">조회수:${prdBean.p_readcount}</span><br>
													</td>
												</tr>
												<tr>
													<td><input type="range" width="80%" name="userRange"
														min="1" max="${prdBean.p_end_price}"
														step="${prdBean.p_end_price/100}"
														value="${prdBean.p_total_price}" disabled="disabled" /></td>
												</tr>	
												</c:otherwise>
											</c:choose>

									<tr>
										<td><c:choose>
												<c:when test="${0>(t_Date-s_Date)}">
													<img width="100px"
														alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
														src="<%=request.getContextPath() %>/resources/images/coming soon.gif">
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${(t_Date-s_Date) <= 7}">
															<img width="50px"
																alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
																src="<%=request.getContextPath() %>/resources/images/new-animation.gif">
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${prdBean.p_readcount>100}">
																	<img width="50px"
																		alt="<%=request.getContextPath() %>/resources/images/no_image.jpg"
																		src="<%=request.getContextPath() %>/resources/images/hot.gif">
																</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</table>
							</td>
							<c:if test="${status.count%3 == 0 }">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
	
	<div class="container">
		<ul class="pagination pagination-sm">
			${pageInfo.pagingHtml}
		</ul>
	</div>
</div>
<%@ include file="../common/common_bottom.jsp"%>
