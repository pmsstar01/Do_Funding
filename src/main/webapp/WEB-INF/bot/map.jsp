<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/common_top.jsp" %>
    
   <style type="text/css">
#daumRoughmapContainer1650365279097 {
margin: 0 auto;
}
h1 { text-align: center; }
</style> 
    
    
    
    <h1>찾아오시는 길</h1>


<div id="daumRoughmapContainer1650365279097" class="root_daum_roughmap root_daum_roughmap_landing"></div>


<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1650365279097",
		"key" : "29w4u",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>

<%@include file= "../common/common_bottom.jsp" %>
