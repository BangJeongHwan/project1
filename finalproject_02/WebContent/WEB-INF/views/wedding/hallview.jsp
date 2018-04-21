<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 정환 -->
<!-- 구글 맵 api  -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIZ4hkMflbjiUrfDA_2S-AAyUvyKJxdc0&callback=initMap"></script>

<!-- <div class="container"  style="margin:10px 1px 0px 60px; padding-left:10px; width: 1000px"> -->
<!-- 
<style type="text/css">	
.selectTB table{
	width: 100%;
	border:1px solid black;
}
.selectTB tr{
}
.selectTB th{	
	align-content: center;
}
</style>
 -->
 
 
<style>
#map1{
	height: 400px;
	width: 100%;
	visibility: visible;
	opacity: 1;
	border: 2px solid #ff9c00;
	display: block;
}
</style>
 
 <link rel="stylesheet" href="/maps/documentation/javascript/demos/demos.css">
<div class="container" style="padding-top: 10px">
	<h2 class="nino-sectionHeading">
	<!-- <span class="nino-subHeading"></span> -->
		${wd.cname }
	</h2>
	
	<div class="sectionContent" style="border-top: 6px solid black; padding-left: 30px">
		<div class="row" style="padding-top: 30px">				
			<div class="col-md-6">
				<table style="width: 100%;">
					<colgroup>
						<col width="30%"><col width="70%">
					</colgroup>
					<tr>
						<td colspan="2"  height="1" bgcolor="gray"></td>
					</tr>
					<tr>
						<td>별점</td>
					</tr>
					<tr>
						<td colspan="2"  height="1" bgcolor="gray"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${wd.address }</td>
					</tr>
					<tr>
						<th>홀타입</th>
						<td>${wd.htype }</td>
					</tr>
					<tr>
						<th>식사비용</th>
						<td>${wd.mincook }~${wd.maxcook }</td>
					</tr>
					<tr>
						<th>메뉴종류</th>
						<td>${wd.menutype }</td>
					</tr>
					<tr>
						<th>보증인원</th>
						<td>최소 보증인원 ${wd.minpeople }명 / 최대 보증인원 ${wd.maxpeople }명</td>
					</tr>
				</table>		
					<div class="text-center">
					</div>
			</div>
			<div class="col-md-6">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<img src="upload/${ wd.picture }"  width="400px" >
				</div>
			</div>
			
		</div>
	</div>
</div>



<!-- 홀 설명 -->
<div class="container" id="hallstory">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory"><font style="color: red">홀 설명</font></a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
</div>
	
<!-- 홀 사진 -->
<div class="container" id="hallpic">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic"><font style="color: red">홀 사진</font></a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
	
	
	
	<div align="center">	
		<br><br>
		<!-- 메인 이미지 -->
		<img src="assets/images/wedding/63img1_b.jpg">
		<br><br>
		<!-- 여러 이미지 추가 -->
		<img alt="이미지 없음" src="assets/images/wedding/63img1_s.jpg" onclick="imgChange(1)" id="simg1">
		<img alt="이미지 없음" src="assets/images/wedding/63img2_s.jpg" onclick="imgChange(2)" id="simg2">
		<img alt="이미지 없음" src="assets/images/wedding/63img3_s.jpg" onclick="imgChange(3)" id="simg3">
		<img alt="이미지 없음" src="assets/images/wedding/63img4_s.jpg" onclick="imgChange(4)" id="simg4">
		<img alt="이미지 없음" src="assets/images/wedding/63img5_s.jpg" onclick="imgChange(5)" id="simg5">
		<img alt="이미지 없음" src="assets/images/wedding/63img6_s.jpg" onclick="imgChange(6)" id="simg6">
	</div>
	
</div>	


<!-- 홀 위치 -->
<div class="container" id="halllocation">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation" onclick="initMap(${wd.latitude},${wd.longitude })"><font style="color: red">홀 위치</font></a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>		
	</table>
	</div>
	
	<div id="map1" class="showMap"></div>
</div>	


<!-- 홀 리뷰 -->
<div class="container" id="hallreview">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview"><font style="color: red">홀 리뷰</font></a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
</div>	


<!-- 홀 예약 -->

<div class="container" id="hallregi">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi"><font style="color: red">홀 예약</font></a></th>
		</tr>
	</table>
	</div>	
</div>
	
	
<!--  구글맵에 대한 스크립트 -->
<script type="text/javascript">
//var x = ${wd.latitude};

//var y = ${wd.longitude};

/* 
alert(typeof x);
alert(typeof y);
alert(x);
alert(y);
 */
function initMap(x,y) {
	x = Number(x);
	y = Number(y);
	alert(x);
	alert(y);
	var uluru = {lat: x, lng: y};					// 위도 경도
 	var map = new google.maps.Map($("#map1"), {	// wedmap에 뿌려줄거임
   	zoom: 16,								// 숫자가 올라갈수록 지도 확대
   	center: uluru						
 	});
	var marker = new google.maps.Marker({		
	    position: uluru,
	    map: map
	});
}
</script>


 <!-- 
<div class="col-md-6">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						<i class="mdi mdi-chevron-up nino-icon arrow"></i>
						<i class="mdi mdi-camera nino-icon"></i> 
						결재
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						<i class="mdi mdi-chevron-up nino-icon arrow"></i>
						<i class="mdi mdi-owl nino-icon"></i> 
						상세정보
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						<i class="mdi mdi-chevron-up nino-icon arrow"></i>
						<i class="mdi mdi-laptop-mac nino-icon"></i> 
						후기
					</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>
	</div>
</div>
 -->
