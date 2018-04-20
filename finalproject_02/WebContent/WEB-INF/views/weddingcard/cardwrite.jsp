<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<style>
table{
text-align: center;
align: center;
margin: 0 auto;
border: 1px solid black;
}

</style>

<form name="frmForm" id="_frmForm" action="cardwriteAf.do" method="post" 
enctype="multipart/form-data">
<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>업체아이디</td>
		<td><input type="text" name = "cid"></td>
	</tr>
	<tr>
		<td>업체사진</td>
		<td><input type = "file" name="pname" style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<span><a href="#none" id="card_write" title="글쓰기">글쓰기</a></span>
	</td>
	</tr>
</table>

</form>

<script type="text/javascript">
$("#card_write").click(function() {
	alert("글쓰기");
	$("#_frmForm").submit();
});


</script>
