<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<style>
.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
th, td {padding: 10px}

table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    width: 100px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    text-align: center;
    color: #fff;
    background: #ce4869 ;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}

table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.fontyle {
        font-family: 'Hanna', Fantasy;
        font-size: 20px;
        color: black;
      }
      
</style>

<%int a = 1; %>

<div style="width: 1600px">
<div class="w3-display-container" style="padding-left:200px; padding-right: 100px; width: 50%;  float: left;">
  <img class="mySlides" src="upload/${sdDto.pic1}" style="width: 600px; height: 500px">
  <img class="mySlides" src="upload/${sdDto.pic2}" style="width: 600px; height: 500px">
  <img class="mySlides" src="upload/${sdDto.pic3}" style="width: 600px; height: 500px">
  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="padding-left: 120px; width:70%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)" style="color: black;">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)" style="color: black;">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
  </div>
</div>

<div class="fontyle" style="width: 50%; float: left;">
<form action="">
<table class="type05" >

<colgroup>
<col width="20%"><col width="40%"><col width="40%">
</colgroup>
<tr>
	<td colspan="3" style="font-size:50px">${sdDto.cname }</td>
</tr>
<tr>
	<td colspan="3">${sdDto.content }</td>
</tr>
<tr>
	<td>오픈시간</td>
	<td colspan="2">${sdDto.opentime }</td>
</tr>
<tr>
	<td>마감시간</td>
	<td colspan="2">${sdDto.closetime }</td>
</tr>
<tr >
	<td>스튜디오 주소</td>
	<td colspan="2">${sdDto.addre }</td>
</tr>
<!-- 스튜디오 상품의 경우 해당 스튜디오에 해당하는 seq를 가지고 상품디테일을 참조하여 상품들을 리스트로 받아와야 한다. -->
<tr >
	<td>스튜디오 상품</td>
	<td colspan="2">
		<select name="selectproduct" id="selectproduct">
				<option>옵션선택</option>
			<c:forEach var="sdpdDto" items="${sdpdlist}" varStatus="sdpdDtoS">
				<option value="${sdpdDto.sdpdseq}">${sdpdDto.title}</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr >
	<td>상품 가격</td>
	<td colspan="2" ><input type="text" style="border: 0" id="sprice" readonly="readonly" value="     0     원"></td>
</tr>
<tr >
	<td colspan="3">
	&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
	<input type="button" name="basket" value="장바구니" class="w3-btn w3-white w3-border w3-border-red w3-round-large">
	&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
	<input type="button" name="payment" value="결제하기" class="w3-btn w3-white w3-border w3-border-red w3-round-large">
	</td>
</tr>
</table>
</form>
</div>
</div>

<!-- 스튜디오 정보 부분과 탭부분의 구분 -->
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<div class="container" align="center">
	<c:if test="${ not empty login && login.auth == 'admin'}">
		<button onclick="mod()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">수정</button>
		<button onclick="del()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">삭제</button>
	</c:if>
</div>
<br><br><br>

<div class="w3-container" style="color: black;">
  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openCity(event, 'picture');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">스튜디오 사진</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'sdpddetail');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
       	style="font-family: 'Hanna', Fantasy;">상품 정보</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'hugi');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">후기글</div>
    </a>
  </div>

<!-- 스튜디오 사진 뷰 -->
<!-- 컨트롤러에서 사진파일들에 대한 리스트를 만들어 받아온다. -->
<div id="picture" class="w3-container city" style="display:none">
<br><br><br>
 <div style="">
 
  <c:if test="${ not empty sdDto.video}">
	  <video poster="http://placehold.it/640x360" autoplay="autoplay" style="width:1300px; height:500px;" controls="controls">
	    <source src="upload/${sdDto.video}" type="video/mp4" />
	  </video>
	  <br><br><br><br><br><br>
  </c:if>
 
  <c:if test="${ not empty sdDto.pic0}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic0}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic1}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic1}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic2}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic2}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic3}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic3}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic4}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic4}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic5 || sdDto.pic5 ne ''}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic5}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic6}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic6}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic7}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic7}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic8}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic8}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic9}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic9}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
 </div>
</div>

<!-- 스튜디오 상품 뷰 -->
<div id="sdpddetail" class="w3-container city" style="display:none">
<br><br><br>
<div style="padding-left: 100px">
<table class="type11" style="width:85%; font-family: 'Hanna', serif;" >
	<colgroup>
	<col width="10"/><col width="100"/><col width="200"/><col width="50"/>
	</colgroup>
	<thead>
	<tr>
	<th>번호</th><th>상품명</th><th>내용</th><th>가격</th>
	</tr>
	</thead>
	
	<c:forEach var="sdpdDto" items="${sdpdlist}" varStatus="sdpdS">
	<tr class="_hover_tr">
		<td><%=a %></td>
		<td style="text-align: left">${sdpdDto.title }</td>
		<td style="text-align: left">${sdpdDto.content }</td>
		<td style="text-align: center">${sdpdDto.price}</td>
	</tr>
	<%a++; %>
	</c:forEach>
</table>
</div>
</div>

<!-- 스튜디오에 대한 후기 뷰 -->
<div id="hugi" class="w3-container city" style="display:none;">
  <div class="w3-container" style="padding-left: 250px; font-family: 'Hanna', serif;">
 <%--  <c:forEach var="" items="" varStatus=""> --%> <!-- 해당 스튜디오에 대한 후기 리스트 -->
  <br><br><br>
  <div class="w3-card-4" style="width:70%;">
    <header class="w3-container w3-light-grey" style="font-size:35px">
      John Doe<!-- 회원 아이디 -->
    </header>
    <div class="w3-container">
      <p>1 new friend request</p> <!-- 후기 제목 -->
      <hr>
      <img src="images/brand/img-1.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:100px; height:100px">
      <p>CEO at Mighty Schools. Marketing and Advertising. Seeking a new job and new opportunities.</p> <!-- 후기내용 -->
    </div>
  </div>
  <br><br><br>
 <%--  </c:forEach> --%>
</div>
</div>
</div>

<script>
$(document).ready(function () {
	$("#selectproduct").change(function () {
		var	sdpdseq = $("#selectproduct option:selected").val();
		var	sdseq = "${sdDto.stseq}";
		$.ajax({
			url:"productPrice.do",
			type:"get",
			data:"sdseq="+sdseq +"&sdpdseq="+sdpdseq,
			success:function(msg){
					$("#sprice").val(msg+"원");		
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
});
</script>

<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}

function del() {
	if (confirm("삭제 하시겠습니까?")) {
		location.href = "sdDel.do?stseq=" + ${sdDto.stseq};
	}
}

function mod() {
	location.href = "sdModView.do?stseq=" + ${sdDto.stseq};
}
</script>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>