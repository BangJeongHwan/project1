<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h5 class="w3-bar-item">S / D / M</h5>
<button class="w3-bar-item w3-button tablink" onclick="sdm()">스튜디오</button>
<button class="w3-bar-item w3-button tablink" onclick="dressMain()">드레스</button>
<button class="w3-bar-item w3-button tablink" onclick="muMainView()">메이크업</button>
<button class="w3-bar-item w3-button tablink" onclick="reserView()">예약확인</button>
<script>
function sdm(){
	location.href="company.do"
}

function dressMain() {
	location.href="dressMain.do";
}

function muMainView() {
	location.href = "muMainView.do";
}

function reserView() {
	location.href = "reservationDressList.do";
}
</script>


