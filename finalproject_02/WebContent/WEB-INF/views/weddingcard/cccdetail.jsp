<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
    
    
<form name="frmForm" id="_frmForm" action="cdupdate.do?cdseq=${dto.cdseq}" method="post" 
enctype="multipart/form-data">
<table>
	<tr>
		<td>업체ID</td>
		<td>${dto.cid}</td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
		<c:if test="${dto.category eq 'm'}">
			모바일
		</c:if>
		<c:if test="${dto.category eq 'a'}">	
			아날로그
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>봉투</td>
		<td>
		<c:if test="${dto.cbag eq 0}">
			봉투있음
		</c:if>
		<c:if test="${dto.cbag eq 1}">
			봉투없음
		</c:if>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${dto.price}</td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
		<c:if test="${dto.cardsize eq '직사각형' }">
		직사각형(가로)(171*116mm)
		</c:if>
		<c:if test="${dto.cardsize eq '직사각형' }">
		직사각형(세로)(116*171mm)
		</c:if>
		<c:if test="${dto.cardsize eq '정사각형' }">
		정사각형(141*141mm)
		</c:if>
		</td>
	</tr>
	<tr>
		<td>메인사진</td>
		<td>${dto.picture0}</td>
	<tr>
	    <td>사진1</td>
	    <td>${dto.picture1}</td>
	</tr>
	<tr>
	    <td>사진2</td>
	    <td>${dto.picture2}</td>
	</tr>
	<tr>
	    <td>사진3</td>
	    <td>${dto.picture3}</td>
	</tr>
	   </table>

<button id = "card_update">수정하기</button>
<button id="ccdelete">삭제하기</button>
</form>

<script>
$("#card_update").click(function() {
	alert('수정하기');
	$("#_frmForm").submit();
});

$("#ccdelete").click(function() {
	alert('삭제하기');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?pdseq=${dto.cdseq}"}).submit();
});

</script>