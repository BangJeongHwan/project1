<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<h2>��ü �����ϱ�</h2>

<form name="frmForm" id="_frmForm" action="ccupdateAf.do" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="wiseq" value="${ccd.wiseq}">
<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>��ü���̵�</td>
		<td>${ccd.cid}</td>
	</tr>
	<tr>
		<td>��ü�̸�</td>
		<td><input type="text" name="cname" value="${ccd.cname}"></td>
	</tr>
	<tr>
		<td>��ü����</td>
		<td style="text-align: left"><input type="text" name='filename' value="${ccd.picture}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>�Ұ���</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${ccd.content}</textarea></td>
	</tr>
</table><br>
<span><button id = "updatebtn">�����ϱ�</button></span>
<br>

</form>

<script type="text/javascript">
$("#updatebtn").click(function() {	
	alert('�����ϱ�');	
	$("#_frmForm").attr({ "target":"_self", "action":"ccupdateAf.do" }).submit();
});

</script>