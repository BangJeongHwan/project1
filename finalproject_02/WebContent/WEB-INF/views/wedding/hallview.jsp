<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- fullcalender -->
<link rel='stylesheet' href='FullCalendar/fullcalendar.css' />
<link rel='stylesheet' media="print" href='FullCalendar/fullcalendar.print.min.css' />
<script src='FullCalendar/lib/jquery.min.js'></script>
<script src='FullCalendar/lib/moment.min.js'></script>
<script src='FullCalendar/lib/jquery-ui.min.js'></script>
<script src='FullCalendar/fullcalendar.min.js'></script>
<script src='FullCalendar/locale-all.js'></script>	<!-- 한국어 변환 -->


<style>
.tb2 table{
	width: 100%;	
	border: 1px solid #F5F5F5;
}
.tb2 tr{
	padding: 20px 20px;
}
.tb2 th,td{
	align-content: center;
}

ul li{
	display:inline;                         /*  세로나열을 가로나열로 변경 */
    border-left:1px solid #999;             /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
    font:bold 15px;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨( Dotum)로 표시 */
    padding:0 10px; 
}

li.line:hover{
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여 */
   cursor: pointer;			/* 손 모양 */
}
</style>

<style type="text/css">
.imgScroll td{
	width: 10%; 
	height: 5%;
	align-content: center;
	text-align: center;
}
</style>

 <!-- 
 <link rel="stylesheet" href="/maps/documentation/javascript/demos/demos.css">
  -->
<div class="container" style="padding-top: 10px">
	<h2 class="nino-sectionHeading">
	<!-- <span class="nino-subHeading"></span> -->
		${wd.cname }
	</h2>
	
	<div align="right">
		<button onclick="addhall()">홀 추가</button>
	</div>
	
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
			<th><a href="#hallstory"><font color="#ff0000">홀 설명</font></a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
	
	<div>	
		<br><br>
		<p style="color: red">※ 아래 정보는 웨딩홀에서 제공한 정보를 기준으로 하며, 웨딩홀의 사정에 따라 메뉴, 가격 등이 변경될 수 있습니다. </p>
		<b>주소 : ${wd.address }</b><br>
		<b>교통 : ${wd.transpo }</b>
		<br><br>
		
		<div class="tb2">
		<table>
			<colgroup>
				<col width="10%"> <!-- 요일 -->
				<col width="15%"> <!-- 형태/시설구분 -->	
				<col width="15%"> <!-- 인원 -->
				<col width="10%"> <!-- 간격 -->
				<col width="10%"> <!-- 사용료 -->
				<col width="10%"> <!-- 메뉴 -->
				<col width="15%"> <!-- 식대 -->
				<col width="15%"> <!-- 음주류 -->
			</colgroup>
			
			<tr>
				<th>요일</th><th>형태/시설구분</th><th>인원</th><th>간격</th><th>사용료</th><th>메뉴</th><th>식대</th><th>음주류</th>
			
			<c:forEach var="hall" items="${hallList }">
				<tr>
					<td colspan="8" style="background-color: #F5F5F5;">${hall.hallname }/${hall.floor }</td>
				</tr>
				<tr>
					<td>월~일</td>
					<td>${hall.format }<br>/<br>${hall.facility }</td>
					<td>최소 : ${hall.minpeople }명<br>착석 : ${hall.setpeople }명<br>최대 : ${hall.maxpeople}명</td>
					<td>${hall.wstep }</td>
					<td>${hall.pay }</td>
					<td>${hall.menutype }</td>
					<td>${hall.mincook }<br>${hall.maxcook }</td>
					<td>${hall.drink }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</div>
	
<!-- 홀 사진 -->
<div class="container" id="hallpic">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic"><font color="#ff0000">홀 사진</font></a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>	
	</div>
	
	
	
	<div align="center" style="width: 100%; background-color: #F5F5F5;">	
		<br><br>
		
		
		<ul>
			<li class="line" onclick="hpicChange('all')" id="_hsum">전체<font color="#ff0000">(${piclist.size() })</font></li>
			<c:forEach var="hsum" items="${hallSumList }" varStatus="i" begin="0">
				<li class="line" onclick="hpicChange('${hsum.hallname }')" id="_hsum${i }">${hsum.hallname }<font color="#ff0000">(${hsum.sumpic })</font></li>
			</c:forEach>
		</ul>
		
		<br><br>
		
		<!-- 여러 이미지 추가 -->
		<div>
			<%-- 
			<c:forEach var="hallpic" items="${piclist }" varStatus="i" begin="0">
				<c:if test="${i<=5 }">
					<img src="upload/${ hallpic.picture }" style="width: 10%; height: 5%">
				</c:if>
				<img src="upload/${ hallpic.picture }" style="width: 10%; height: 5%">
			</c:forEach>
			 --%>
			 <%-- 
			 <table>
			 
				<tr id="_PicSel" class="imgScroll">
					<td style='width:50px;cursor:pointer' onclick='scrMoveLeft()'>◀</td>
					<c:forEach varStatus="i" begin="i-2" end="i+2" step="1">
						<c:if test="${i }"></c:if>
					</c:forEach>
					       	for(var i = (picIndex - 2); i <= (picIndex+2); i++) {
        		if (i == picIndex) {
        			tagStr += "<td style='border:4px solid #ef8bc5'>";
        		} else {
        			tagStr += "<td>";
        		}
        		if (i >= 0 && i < picMaxSize) {
        			//var onclickStr = "func()";
        			var onclickStr = "imgChange(" + i +")";
        			tagStr += "<img src='upload/"+ picArr[i] +"' onclick='"+ onclickStr +"' style='width:90px;height:59px;cursor:pointer'>";
        		}
        		tagStr += "</td>";
        	}
        	tagStr += "<td style='width:50px;cursor:pointer' onclick='scrMoveRight()'>▶</td>";
				</tr>
				
			</table>
			 --%>
			<br><br>
			<!-- 메인 이미지 -->
			<c:if test="${ empty piclist || piclist.size() eq 0}">
				<img src="upload/${ wd.picture }" style="width: 70%; height: 50%">
			</c:if>
			<c:if test="${ not empty piclist && piclist.size() ne 0}">
				<img src="upload/${ pic1 }" alt="" id="bigimg" style="width: 70%; height: 50%"/>
			</c:if>
			
		</div>
		
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
			<th><a href="#halllocation"><font color="#ff0000">홀 위치</font></a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>		
	</table>
	</div>

	<div style="width: 100%; background-color: #F5F5F5; ">
		<br><br>
		<div onload="initMap()" align="center">
			<div id="map1" style="width:90%; height: 500px; border: 1px solid black;"></div>
		</div>
		<br>
		
		<div style="margin-left: 60px">
			<b>주소 : ${wd.address }</b><br>
			<b>교통 : ${wd.transpo }</b>
			<br><br>
			<p style="color: red">※ 본 지도는 참고 정보로만 활용하시기 바라며 정확한 위치는 홈페이지를 통해 확인하시기 바랍니다.</p>
		</div>
	</div>
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
			<th><a href="#hallreview"><font color="#ff0000">홀 리뷰</font></a></th>
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
			<th><a href="#hallregi"><font color="#ff0000">홀 예약</font></a></th>
		</tr>
	</table>
	</div>	
	<div align="center">
		<div id='calendar' style="width:90%; height: 895px; margin-top:20px;" ></div>
	</div>
</div>


<!-- 이미지 스크롤을 위한  setting -->
<%-- 
<script type="text/javascript">
var picMaxSize = 0;
var picArr = new Array(${piclist.size()});
</script>
<!-- picName setting  -->
<c:forEach items="${ piclist.pic }" var="pic" varStatus="i">
	<c:if test="${ not empty muDto.pic[i.index] && muDto.pic[i.index] != '' }">
		<script type="text/javascript">
			picArr[picMaxSize] = "${muDto.pic[i.index]}";
			picMaxSize++;
		</script>
	</c:if>
</c:forEach>
 --%>
 
<!-- 홀별 사진 변경 -->
<script type="text/javascript">
function imgScroll(hallname){
	alert(hallname);
	var data = {
		"hallname":hallname,
		"whseq":${wd.whseq}
	}
	
	$.ajax({
		url:"hallPicList.do",
        data:data,      // parameter 타입으로 이동
        success:function(res){
        	var tagStr = "<td style='width:50px;cursor:pointer' onclick='scrMoveLeft()'>◀</td>";
        	for(var i = (picIndex - 2); i <= (picIndex+2); i++) {
        		if (i == picIndex) {
        			tagStr += "<td style='border:4px solid #ef8bc5'>";
        		} else {
        			tagStr += "<td>";
        		}
        		if (i >= 0 && i < picMaxSize) {
        			//var onclickStr = "func()";
        			var onclickStr = "imgChange(" + i +")";
        			tagStr += "<img src='upload/"+ picArr[i] +"' onclick='"+ onclickStr +"' style='width:90px;height:59px;cursor:pointer'>";
        		}
        		tagStr += "</td>";
        	}
        	tagStr += "<td style='width:50px;cursor:pointer' onclick='scrMoveRight()'>▶</td>";
        	
        	$("#_PicSel").empty();
        	$("#_PicSel").append(tagStr);        	
        },
        error:function(reqest, status, error){
            alert("실패");
        }
	});
}
</script>

<!-- fullcalendar에 대한 스크립트 -->
<script type="text/javascript">
$(function() {
	// 한국어 변환
	var initialLocaleCode = 'ko';
	
	// 현재 날짜 설정
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth()+1;
	var y = date.getFullYear();
	var rdate = y+"-0"+m+"-"+d;	
	//alert(rdate);
	
	// fullcalender 시작
	$('#calendar').fullCalendar({
		
		// 한국어 변환
	 	locale: initialLocaleCode,
	 	   
		// header 설정
  		header: {
  	        left: 'prev,next today',	// 달 이동
  	        center: 'title',			// 제목
  	        right: 'month,agendaWeek,agendaDay,listMonth'	// 월별, 주별, 일별, list
  	    },
  		// 현재 보여줄 화면
  	    defaultDate: rdate,	
  	    // show the prev/next text <, >
 	    buttonIcons: false,
 	    // 1년간의 주를 나타내 (주)는 부분
 	   	weekNumbers: true,
  	    // 날짜 클릭 가능(true), 불가(false)
  	    navLinks: true,   	    
  	    // 일정 옮기기 가능
  	    editable: true,  	    
  		// 4개 이상 "more" 창 나타내기(true), 나타내지 않기(false)
  	    eventLimit: true, 
  	    
 		// 일정 넣는 부분
  	    events: [				
  	      {
  	        title: 'All Day Event1',		// 제목
  	        start: '2018-04-01',			// 시작일
  	        end: '2018-04-10'				// 종료일
  	      },
  	      {
    	   	title: 'All Day Event2',
    	    start: '2018-04-01'
    	  },
    	  {
      	   	title: 'All Day Event3',
      	    start: '2018-04-01T20:00:00'	//YYYY-MM-DDThh:mm:ss
      	  },
      	  {
          	title: 'All Day Event4',
            start: '2018-04-01'
          },
          {
           	title: 'All Day Event5',
            start: '2018-04-01'
          },
          {
            title: 'All Day Event6',
            start: '2018-04-01'
          }
  	    ],
  	});
});
</script>

<!--  구글맵에 대한 스크립트 -->
<script type="text/javascript">
function initMap() {
	var x = ${wd.latitude};
	var y = ${wd.longitude};
	var uluru = {lat: x, lng: y};					// 위도 경도
 	var map = new google.maps.Map(document.getElementById('map1'), {	// wedmap에 뿌려줄거임
	   	zoom: 18,								// 숫자가 올라갈수록 지도 확대
	   	center: uluru
	   	//disableDefaultUI:true,
	   	//mapTypeId:google.maps.MapTypeId.ROADMAP,
	   	//draggable:true  	
 	});
	
	var marker = new google.maps.Marker({		
	    position: uluru,
	    map: map,
	    title:'${wd.cname}'
	});
	
}
// 바로 맵 실행
google.maps.event.addDomListener(window, 'load', initMap);
</script>

<!-- 홀 추가 -->
<script>
function addhall(){
	location.href="Hallwrite.do?whseq="+${wd.whseq};
}
</script>

