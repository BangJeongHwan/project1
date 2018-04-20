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
		<td><input type="text" name = "cid" value="${cdd.cid}"></td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td><input type="text" name = "cname" value="${cdd.cname}"></td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
		<input type="text" name = "catagory" value="${cdd.catagory}">
		</td>
		
	</tr>
	<tr>
		<td>봉투</td>
		<td>
		<input type="text" name = "bag" value="${cdd.bag}">
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name = "price" value="${cdd.price}"></td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
		<input type="text" name = "cardsize" value="${cdd.cardsize}">
		</td>
	</tr>
	<tr>
		<td>메인사진</td>
		<td style="text-align: left"><input type="text" name='filename' value="${cdd.picture0}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
	<tr>
	    <td>사진1</td>
	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture1}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
	</tr>
	<tr>
	    <td>사진2</td>
	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture2}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
	</tr>
	<tr>
	    <td>사진3</td>
	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture3}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
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
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${dto.cdseq}"}).submit();
});

</script>