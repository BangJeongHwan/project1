<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<style type="text/css">

table {
	border: 1px solid #EBEBEB;
	align-content: center;
	/* height: 1000px; */
}
tr{
	height: 60px;
	padding:  10px 10px;
}
td{
	 background-color:#F8F8F8;
}
th{
	 background-color:#F8F8F8;
	text-align:center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div class="container">
	
	<h4>개인정보</h4>
	<table style="width:100%;">
		<colgroup>
			<col width="10%"><col width="30%">
		</colgroup>
		<tr>
			<th>이름</th>
			<td>	
				<input type="text" name="name" id="_name" size="20" value="${login.name }">
			</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>
				<input type="hidden" name="phone" id="_phone">
				<select id="_phone1">
					<option value="010" selected>010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="018">018
					<option value="019">019
				</select>-
				<input type="text" id="_phone2" size="7">-
				<input type="text" id="_phone3" size="7">
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="hidden" name="email" id="_email">
				<input type="text" id="_email1" size="10">@
				<input type="text" id="_email2" size="10">
				<select id="_emailsel">
					<option>선택해주세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>직접입력</option>
				</select>
			</td>
		</tr>
	</table>
	<br><br>
	<h4>상담정보</h4>
	<table style="width:100%;">
		<colgroup>
			<col width="10%"><col width="30%">
		</colgroup>
		<tr>
			<th>홀이름</th>
			<td>	
				<input type="text" name="name" id="_name" size="20" value="${login.name }">
			</td>
		</tr>
		<tr>
			<th>희망홀</th>
			<td>
				<input type="hidden" name="phone" id="_phone">
				<select id="_phone1">
					<option value="010" selected>010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="018">018
					<option value="019">019
				</select>
			</td>
		</tr>
		
		<tr>
			<th>예약일</th>
			<td>
				<input type="hidden" name="email" id="_email">
				<input type="text" id="_email1" size="10">@
				<input type="text" id="_email2" size="10">
				<select id="_emailsel">
					<option>선택해주세요</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>직접입력</option>
				</select>
			</td>
		</tr>
	</table>
	<br><br>
	<h4>상담정보</h4>
	<input type="">
</div>