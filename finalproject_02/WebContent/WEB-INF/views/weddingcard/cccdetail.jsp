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
		<td>��üID</td>
		<td>${dto.cid}</td>
	</tr>
	<tr>
		<td>ûø���̸�</td>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<td>ûø������</td>
		<td>
		<c:if test="${dto.category eq 'm'}">
			�����
		</c:if>
		<c:if test="${dto.category eq 'a'}">	
			�Ƴ��α�
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>����</td>
		<td>
		<c:if test="${dto.cbag eq 0}">
			��������
		</c:if>
		<c:if test="${dto.cbag eq 1}">
			��������
		</c:if>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.price}</td>
	</tr>
	<tr>
		<td>ûø��ũ��</td>
		<td>
		<c:if test="${dto.cardsize eq '���簢��' }">
		���簢��(����)(171*116mm)
		</c:if>
		<c:if test="${dto.cardsize eq '���簢��' }">
		���簢��(����)(116*171mm)
		</c:if>
		<c:if test="${dto.cardsize eq '���簢��' }">
		���簢��(141*141mm)
		</c:if>
		</td>
	</tr>
	<tr>
		<td>���λ���</td>
		<td>${dto.picture0}</td>
	<tr>
	    <td>����1</td>
	    <td>${dto.picture1}</td>
	</tr>
	<tr>
	    <td>����2</td>
	    <td>${dto.picture2}</td>
	</tr>
	<tr>
	    <td>����3</td>
	    <td>${dto.picture3}</td>
	</tr>
	   </table>

<button id = "card_update">�����ϱ�</button>
<button id="ccdelete">�����ϱ�</button>
</form>

<script>
$("#card_update").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").submit();
});

$("#ccdelete").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?pdseq=${dto.cdseq}"}).submit();
});

</script>