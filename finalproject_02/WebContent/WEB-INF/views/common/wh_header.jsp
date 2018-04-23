<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 구글 맵  -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIZ4hkMflbjiUrfDA_2S-AAyUvyKJxdc0&callback=initMap"></script>	
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>


<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="index.do">Wedding</a>
</div>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="nino-menuItem pull-right">
	<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#nino-header"><i class="fa fa-home" style="font-size:23px"></i> <span class="sr-only">(current)</span></a></li>
			<li><a href="#" onclick="wdh()">웨딩홀</a></li>
			<li><a href="#nino-story" onclick="sdm()">스드메</a></li>
			<li><a href="#nino-ourTeam">신혼여행</a></li>
			<li><a href="#" onclick="location.href='pagingclist.do'">청첩장</a></li>
			<li><a href="#nino-latestBlog">이벤트</a></li>
		</ul>
	</div><!-- /.navbar-collapse -->
	<ul class="nino-iconsGroup nav navbar-nav">
		<li><a href="#" onclick="basketListView()"><i class="mdi mdi-cart-outline nino-icon"></i></a></li>
		<li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
	</ul>
</div>


<script type="text/javascript">
function index() {
	location.href = "index.do";
}
function sdm() {
	location.href = "company.do";
}
function basketListView() {
	location.href = "basketListView.do";
}
function wdh(){
	location.href = "weddingHallView.do";
}
</script>
