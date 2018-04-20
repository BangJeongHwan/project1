<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<style type="text/css">
.hmslideshow-container {box-sizing: border-box}
.hmmySlides {display: none}
.numbertext img {vertical-align: middle;}

/* Slideshow container */
.hmslideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.hmprev , .hmnext {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: 320px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.hmnext {
  right: 420px;
  border-radius: 3px 0 0 3px;
}
.hmprev{
	margin-left: 100px;
}

/* On hover, add a black background color with a little bit see-through */
.hmprev:hover, .hmnext:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.hmtext {
    color: #f2f2f2;
    font-size: 15px;
    padding: 8px 12px;
    position: absolute;
    bottom: 8px;
    width: 100%;
    text-align: center;
    background-color: rgba(0,0,0,0.6);
    height: 100%;
}
.hmtext span{
	width: 500px;
}

/* Number text (1/3 etc) */
.hmnumbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.hmdot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.hmactive, .hmdot:hover {
  background-color: #717171;
}

/* Fading animation */
.hmfade {
  -webkit-animation-name: hmfade !important;
  -webkit-animation-duration: 1.5s !important;
  animation-name: hmfade !important;
  animation-duration: 1.5s !important;
}

@-webkit-keyframes hmfade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes hmfade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .hmprev, .hmnext,.hmtext {font-size: 11px}
}
</style>

<jsp:include page="honeymoon.jsp"/>
<!-- 
uro bali baliz caribian croa hawai hoju kancoon moldiv puket stlucia tahiti
 -->
<div class="hmslideshow-container">
	<c:if test="${selarea eq uro}">
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">1 / 4</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/uro1.jpg" style="width:100%">
	</div>
	
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">2 / 4</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/uro2.jpg" style="width:100%">
	</div>
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">3 / 4</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/uro2.jpg" style="width:100%">
	  <div class="hmtext"><span><b>[1.에스토니아 탈린. Tallinn, Estonia]</b><br>
	  에스토니아의 수도인 탈린. 발트해 핀란드 연안에 가까이 있는 항만도시이다. 관광도시이자 공업도시로 핀란드의 헬싱키와 굉장히 가깝다. 페리를 타고 가면 대략 50분 정도밖에 걸리지않는다. 주요 관광지로 탈린 알렉산더네브스키 대성당, 탈린 텔레비전 타워 등이 있다.</span> 
	  </div>
	</div>
	
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">3 / 4</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/uro3.jpg" style="width:100%">
	  <div class="hmtext">Caption Three</div>
	</div>
	</c:if>
</div>
<a class="hmprev" onclick="plusSlides(-1)">&#10094;</a>
<a class="hmnext" onclick="plusSlides(1)">&#10095;</a>

<br>

<div style="text-align:center">
  <span class="hmdot" onclick="currentSlide(1)"></span> 
  <span class="hmdot" onclick="currentSlide(2)"></span> 
  <span class="hmdot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("hmmySlides");
  var dots = document.getElementsByClassName("hmdot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace("hmactive", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += "hmactive";
}
</script>
