<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<form name="frmForm" id="_frmForm" action="cdwriteAf.do?wiseq=${ccd.wiseq}" method="post" 
enctype="multipart/form-data">
<table>
	<tr>
		<td>업체ID</td>
		<td><input type="text" name="cid" readonly="readonly" value="${ccd.cid}"></td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
			<select class="card_catagory" name="category" id="card_catagory">
				<option value="m">모바일</option>
				<option value="a">아날로그</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>봉투</td>
		<td>
			<select class="card_bag" name="cbag" id="card_bag">
				<option value="1">봉투있음</option>
				<option value="0">봉투없음</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
			<select class="card_size" name="cardsize" id="card_size">
				<option value="직사각형가로">직사각형(가로)(171*116mm)</option>
				<option value="직사각형세로">직사각형(세로)(116*171mm)</option>
				<option value="정사각형">정사각형(141*141mm)</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>이미지</td>
	<td><input type="button" onClick="addFile();" value="추가">
	   <table id="fileDiv">
	      <tr>
	         <td><input type="file" name="files[0]"/></td>
	      </tr>
	   </table>
	</td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
</table>
<button id = "card_write">글쓰기</button>
</form>

<script>
$("#card_write").click(function () {
	alert("글쓰기");
	$("#_frmForm").submit();
});

var fileUploadCount=0;
function addFile(){       
   
   var list = $('#fileDiv');
   var data = list.find("tr").eq(list.find("tr").length-1).find("input[type=file]").attr("name");

   fileUploadCount++;

   var html = "";
   html += "<tr>"; 
   html += "   <td><input type='file' name='files["+fileUploadCount+"]'/></td>";
   html += "</tr>";
   
   list.append(html);
   
}

// function select(){
// 	var select = "";
// 	$("select[name='catagory']:seleted").each(function()){
// 		select.push($(this).val);
// 	}
	
// 	$.ajax({
// 		url:'cdwriteAf.do',
// 		type:'POST',
// 		dataType:'text',
// 		data:{
// 			data:select
// 		}
		
// 	});
// }



</script>
