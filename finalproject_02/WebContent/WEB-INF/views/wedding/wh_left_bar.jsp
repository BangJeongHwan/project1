<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="background-color: write">
<h5 class="w3-bar-item">웨딩홀</h5>
<button class="w3-bar-item w3-button tablink" onclick="">홀</button>
<button class="w3-bar-item w3-button tablink" onclick="">실내</button>
<button class="w3-bar-item w3-button tablink" >야외</button>
<c:if test="${login.id == 'admin' }">
	<button class="w3-bar-item w3-button tablink" onclick="location.href='weddingwrite.do'">글쓰기</button>
</c:if>
</div>

