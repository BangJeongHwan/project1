<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<style>
#ccdetail_main{
margin-left:100px;
margin-right:20px;
}
table th,td{
border: 1px solid black;
text-align: center;
}
button{
text-align: center;
align: center;
}


</style>

<div id = "ccdetail_main">
<h2>��ü �󼼺���</h2>

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
		<td>${ccd.cname}</td>
	</tr>
	<tr>
		<td>��ü����</td>
		<td><img src="upload/${ccd.picture}"></td>
	</tr>
	<tr>
		<td>�Ұ���</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${ccd.content}</textarea></td>
	</tr>
</table><br>
<span><button onclick="location.href='ccupdate.do?wiseq=${ccd.wiseq}'">�����ϱ�</button></span>
<br>

<h2>�ش� ��ü ��ǰ���</h2>
<br>

<table class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>��ȣ</th><th>��üID</th> <th>��ǰ�̸�</th>  
	</tr>
</thead>

<tbody>	
	<c:if test="${empty clist}">
	<tr>
		<td colspan="3">��ϵ� ��ǰ�� �����ϴ�.</td>
	</tr>	
	</c:if>

	<c:forEach items="${clist}" var="card" varStatus="cardS">

	<tr class="_hover_tr">
		<td>${card.cdseq}</td> 
		<td style="text-align: left"><a href='cccdetail.do?cdseq=${card.cdseq}'>
		${card.cid}</a></td>
		<td>${card.title}</td> 
	</tr>
	</c:forEach>
</tbody>

</table><br>
<span><button onclick='location.href="cdwrite.do?wiseq=${ccd.wiseq}"'>��ǰ�ø���</button></span>

<br><br>
</div>