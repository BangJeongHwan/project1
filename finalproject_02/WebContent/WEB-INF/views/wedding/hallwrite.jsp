<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
    
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	/* height: 1000px; */
}
td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
td{
	 background-color:#F8F8F8;
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div class="container">
	<h2 class="nino-sectionHeading">
	<span class="nino-subHeading">wedding Hall</span>
		${wd.cname }
	</h2>
	<p class="nino-sectionDesc">
		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
	</p>
	<div class="sectionContent">
		<div class="row" align="center">
		
			<!-- action = "weddingwriteAf.do" -->
			<form name="frmForm" id="_frmForm" action="#none" method="post" 
			enctype="multipart/form-data">
					
			<input type="hidden" name="whseq" value="${wd.whseq }">		
			
			<table class="list_table" style="width:85%;">
				<colgroup>
					<col width="20%"><col width="30%">
				</colgroup>
				<tr>
					<td>홀 이름</td>
					<td>
						<input type="text" name="hallname" id="_hallname" size="20"><font id="_hallnameCheckFld"></font>
					</td>
				</tr>
				<tr>
					<td>층</td>
					<td>
						<input type="text" name="cname" id="_cname" size="20">
					</td>
				</tr>
				
				<tr>
					<td>시설 구분</td>
					<td>
						<input type="hidden" name="facility" id="_facility">
						<input type="checkbox" name="faci" value=컨벤션>컨벤션&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="호텔">호텔&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="채플">채플&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="전통">전통&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="야외">야외&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="종교">종교&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="기타">기타
					</td>
				</tr>
				
				<tr>
					<td>이용시간</td>
					<td>
						<select id="_regtime" name="regtime">
							<%-- <c:forEach ></c:forEach> --%>
							<option value="50분" selected="selected">50분</option>
							<option value="60분">60분</option>
							<option value="70분">70분</option>
							<option value="80분">80분</option>
							<option value="90분">90분</option>
							<option value="100분">100분</option>
							<option value="110분">110분</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>음식 종류</td>
					<td>
						<input type="hidden" name="menutype" id="_menutype">
						<input type="checkbox" name="menu" value="뷔페">뷔페&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="양식">양식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="한식">한식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="중식">중식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="일식">일식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="기타">기타
					</td>
				</tr>
				
				<tr>
					<td>식대 가격대</td>
					<td><input type="text" name="mincook" id="_mincook" size="10" value="${wd.mincook }">원
					 ~ <input type="text" name="maxcook" id="_maxcook" size="10" value="${wd.maxcook }">원
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_cookCheckFld">※ 최소 가격 ~ 최대 가격 순으로 입력해주세요!</font>
					 </td>
				</tr>
				
				<tr>
					<td>식사 동시 가능 여부</td>
					<td>
						<select id="_format" name="format">
							<option value="분리" selected="selected">분리</option>
							<option value="동시">동시</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>수용 인원 범위</td>
					<td><input type="text" name="minpeople" id="_minpeople" size="10" value="${wd.minpeople }">명
					 ~ <input type="text" name="maxpeople" id="_maxpeople" size="10" value="${wd.maxpeople }">명
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_peopleCheckFld">※ 최소 인원 ~ 최대인원 순으로 입력해주세요!</font>
					 </td>
				</tr>
				<tr>
					<td>수용 인원 범위, 착석 인원</td>
					<td>
						<input type="text" name="setpeople" id="_setpeople" size="10">
					 </td>
				</tr>
				 
				<tr style="height: 500px">
					<td>사진 업로드</td>
					<td style="text-align: left">
						<!-- 사진 추가를 누를 때 추가 할 수 있도록 할 예정 -->
						<!-- <button type="button" id="_fileBtn">사진 추가</button> -->
						<input type="file" name="fileload" id="_fileload" style=" width : 400px;">
					</td>
				</tr>
				<tr>
					<td>웨딩 간격</td>
					<td>
						 <input type="text" name="wstep" id="_wstep" size="10">
					</td>
				</tr>
				
				<tr>
					<td>사용료</td>
					<td>
						 <input type="text" name="wstep" id="_wstep" size="10">
					</td>
				</tr>
				
				<tr>
					<td>음주류 포함 여부</td>
					<td>
						<select id="_drink" name="drink">
							<option value="포함" selected="selected">포함</option>
							<option value="미포함">미포함</option>
						</select>
					</td>
				</tr>
				
				
				
				<tr>
					<td colspan="2" style="height:50px; text-align:center;">
						<span>
							<a href="#none" id="_btnLogin" title="글쓰기"><img src="assets/images/others/bwrite.png" alt="글쓰기" /></a>
						</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>

<script>
$(function () {
	// 글쓰기 버튼 누를 시 실행
	$("#_btnLogin").click(function () {
		
		
		// checkbox check 된 값 받아오기
		var menutype="";
		$("input[name=menu]:checked").each(function () {
			menutype += $(this).val();
			menutype += "/";
		});	
		// 끝 문자열 자르기
		var len = menutype.length;
		menutype=menutype.substr(0,len-1);
		
		// menutype에 값 넣기
		var menuTrue=true;
		if(menutype==""){
			menuTrue=false;
		}else{
			$("#_menutype").val(menutype);
		}
		
		
		// 숫자 판별하기(식대 가격, 수용 인원)
		var mincook = $("#_mincook").val();
		var maxcook = $("#_maxcook").val();
		var minpeople = $("#_minpeople").val();
		var maxpeople = $("#_maxpeople").val();
		
		if($("#_cid").val()==""||$("#_cname").val()==""||$("#_address").val()==""){
			 $("#_cidCheckFld").text("※ 아이디를 입력해주세요!");
             $("#_cidCheckFld").css("color","#ff0000");
             $("#_cid").focus();
		}else if(!menuTrue){
			alert("음식 종류를 체크해주세요");
		}else if(mincook=="" && !isNum(mincook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
			$("#_mincook").val("");
			$("#_mincook").focus();
		}else if(maxcook=="" && !isNum(maxcook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
            $("#_maxcook").val("");
			$("#_maxcook").focus();
		}else if(minpeople=="" && !isNum(minpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_minpeople").val("");
			$("#_minpeople").focus();
		}else if(maxpeople=="" && !isNum(maxpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_maxpeople").val("");
			$("#_maxpeople").focus();
		}else if($("#_fileload").val()=="" || $("#_fileload").val()==null){	// 사진 미 추가시
			alert("사진을 추가해주세요!");
		}else if($("#_content").val()==""){	// 소개 내용 미입력시
			alert("소개 내용을 입력해주세요!");
			$("#_content").focus();
		}else{
			alert("위도 : "+$("#_latitude").val());
			alert("경도 : "+$("#_longitude").val());
			$("#_frmForm").attr({"target":"_self", "action":"weddingwriteAf.do"}).submit();
		}
			
		
	
	});
	
	// 회사id 체크해 회사명과 주소 넣기
	$("#_cid").blur(function () {
		cidcheck($("#_cid").val());
	});
	
	// 등급올리기
	$("#_upGradeBtn").click(function () {
		$.ajax({
	        type:"get",
	        url:"upCompanyGrade.do",
	        data:"cid="+$("#_cid").val(),      // parameter 타입으로 이동
	        success:function(){
	        	cidcheck($("#_cid").val());
	        },
	        error:function(reqest, status, error){
	           alert("실패");
	        }
	   });
	});
	
});
// 실제로 위도 경도 받는 부분
function getLatLong(addr){
	$.ajax({
		url:"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&address="+addr,
		type:"get",
		dataType:"json",
		success:function(e){
			if(e.status=="OK"){
				var geo = e.results[0].geometry.location;
				//alert("위도1 : "+geo.lat+" 경도1 : "+geo.lng);
				$("#_latitude").val(geo.lat);
				$("#_longitude").val(geo.lng);
			}else{
				alert("위치 정보가 없습니다.");
			}
		},
		error:function(reqest, status, error){
           alert("위치를 찾을 수 없습니다.");
        }
	});
}

// 실제 id 체크해주는 부분
function cidcheck(cid){
	$.ajax({
        type:"get",
        url:"checkCompanyGrade.do",
        data:"cid="+cid,      // parameter 타입으로 이동
        success:function(msg){
           if(msg.message=="null"){
              $("#_cidCheckFld").text("※ 해당되는 아이디가 없습니다.");
              $("#_cidCheckFld").css("color","#ff0000");
              $("#_cid").val("");
              $("#_cname").val("");
              $("#_address").val("");
              $("#_upGradeBtn").attr("style","display: none");
           }else if(msg.message=="false"){
           	$("#_cidCheckFld").text("※ 회사 등급이 낮습니다.");
           	$("#_cidCheckFld").css("color","#ff0000");
           	$("#_upGradeBtn").removeAttr("style");
           	$("#_cname").val("");
            $("#_address").val("");
           }else{
           	$("#_cidCheckFld").text("일치하는 ID를 찾았습니다.");
           	$("#_cidCheckFld").css("color","#0000ff");
           	$("#_cname").val(msg.message.cname);
           	$("#_address").val(msg.message.address);
           	$("#_upGradeBtn").attr("style","display: none");
           	getLatLong(msg.message.address);
           }
        },
        error:function(reqest, status, error){
           alert("실패");
        }
   });
}

// 숫자 판별(숫자면 true)
function isNum(num){
	for( var i = 0; i <= num.length -1 ; i++ ) {
		if (num.charAt(i) >= '0' && num.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}
</script>
    

