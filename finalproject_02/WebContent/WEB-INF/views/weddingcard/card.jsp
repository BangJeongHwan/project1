<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    
<style>

#product{
	width: 80%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
}


.pro_detail{

width: 40%;
height: 200px;
 float: left;
 border: 1px;
 margin-left: 110px;


}

.pro_detail2{
margin-top: 20px;
 margin-left: 30px;
width: 40%;
height: 400px;
 float: left;
 border: 1px;

 
}


#detail_tab{
text-align: center;
width: 80%;
margin : 0 auto;
}

.detail_detail{
text-align: center;
margin : 0 auto;
align: center;
}

#ordertable{

font-size: 16px; 
padding: 15px; 
cellpadding: 6px;
cellspacing: 6px;
}

td{
height: 30px;
}

.cardname{
text-align: left;
margin-top: 20px;
margin-bottom: 20px;
}

.review_table{
text-align: center;
align: center;
}

h2{
border-bottom: 1px solid lightgray;
padding: 5px;
}

.pro_image{
margin-top: 50px;
margin-left: 50px;

}

.pro_detail2{}

</style>


<div id = "product">
<div class = "pro_detail" >
<div class="pro_image">
<img src = "assets/images/${dto.picture0}">
</div>
</div>
	<div class = "pro_detail2" >
	<div class="orderdetail">
		<!-- <h3><strong><span id="card_code"></span></strong><span id="card_name"></span></h3> -->
		<div class="cardname">
		<h2>${dto.title}</h2>
		</div>
	
	<table id="ordertable">
		<tr >
			<td>소비자가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan ="2" class = "pro_price" id="pro_price"><span class = "ori_price" id = "ori_price"> ${dto.price}</span><em>원</em>
			</td>
		</tr>
		<tr>	
			<td>구매수량   </td>
				<td colspan ="2">
					<select class="card_amount" name="card_amount" id="card_amount">
					<option value="100">100매 | 5%할인 | 장당 950원↓</option>
					<option value="200">200매 | 35%할인 | 장당 650원↓</option>
					<option value="300">300매 | 45%할인 | 장당 550원↓</option>
					<option value="400">400매 | 50%할인 | 장당 500원↓</option>
					<option value="500">500매 | 52%할인 | 장당 480원↓</option>
					<option value="600">600매 | 53%할인 | 장당 470원↓</option>
					<option value="700">700매 | 54%할인 | 장당 460원↓</option>
					<option value="800">800매 | 55%할인 | 장당 450원↓</option>
					<option value="900">900매 | 56%할인 | 장당 440원↓</option>
					<option value="1000">1000매 | 56%할인 | 장당 440원↓</option>
					</select>
				</td>
		</tr>
		
		<tr>
			<td>봉투옵션   </td>
				<td colspan = "2">
					<select class = "card_bag" name = "card_bag" >
					<option value="0">일반봉투 <br>
					0원 (1,000장)</option>
					<option value="20000">컬러봉투(핑크베이지) <br>
					20,000원 (1,000장)</option>
					<option value="30000">컬러봉투(스카이블루) <br>
					30,000원 (1,000장)</option>
					</select>
				</td>
		</tr>
			
		<tr>
		
			<td>구입총액   </td>
				<td><span class = "total_price" id = "total_price"> </span>원</td><!-- function으로 값을 계산해서 뿌려줌 -->
				<td><button id = "totbtn">총 금액</button></td>
		</tr>
		<tr style="border-top: 1px solid lightgray">
			<td>배송비   </td>
			<td colspan="2">무료배송</td>
		</tr>
		<tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
			<td rowspan = "2">제작기간</td>
				<td> 지금 주문하시면, <br>
				지금 초안 확정하시면, </td>
				<td><span class = "pro_date" id = "pro_date" ></span>초안완료<br>
				<span class = "pro_date2" id = "pro_date2" ></span>발송완료</td>
<!-- 				<td><button id = "datebtn">날짜계산</button></td> -->
		</tr>
		
	</table>
	<br>
	<button id = "orderbtn" onclick="">주문하기</button>
			<button id = "likebtn" onclick="function2()">찜하기</button>
	</div>
	</div>

<br><br>
<div id="detail_tab">
<table id ="detail_menu" border="1" text-align="center" style="font-size: 15px" >
<col width="250"><col width="250"><col width="250"><col width="250"><col width="250"><col width="250">
	<tr>
		<td><a href ="#detail_01">상품상세정보</a></td>
		<td><a href = "#detail_02">수량별 할인안내</a></td>
		<td><a href = "#detail_03">구매혜택</a></td>
		<td><a href = "#detail_04">제작과정</a></td>
		<td><a href = "#detail_05">주문/베송</a></td>
		<td><a href = "#detail_06">이용후기</a></td>
	</tr>

</table>
</div>


<div class="detail_detail">
<!-- 상품디테일 이미지 -->
<div id ="detail_01">

	<div class = "detail_image">
		<!-- 이미지 자리 -->
		<img src="assets/images/${dto.picture1} ">
	</div>
</div>
<br>
<!-- 수량별 할인안내 이미지  -->
<div id ="detail_02">
<h4>수량별 할인안내</h4><!-- style border-bottm:  -->
	<div class = "detail_image">
		<img src="assets/images/${dto.picture2} ">
	</div>
</div>
<br>
<!-- 구매혜택 이미지  -->
<div id ="detail_03">
<h4>구매혜택</h4><!-- style border-bottm:  -->
	<div class = "detail_image">
		<img src="assets/images/${dto.picture3} ">
	</div>
</div>
<br>
<!-- 제작과정 이미지  -->
<div id ="detail_04">
<h4>제작과정</h4><!-- style border-bottm:  -->
	<div class = "detail_image">
		<img src="assets/images/ ">
	</div>
</div>
<br>
<!-- 주문/베송 이미지  -->
<div id ="detail_05">
<h4>주문/베송</h4><!-- style border-bottm:  -->
	<div class = "detail_image">
		<!-- 이미지 자리 -->
	</div>
</div>
<br>


<!-- 이용후기 리스트  -->
<div id ="detail_06">
<h4>이용후기</h4><!-- style border-bottm:  -->
	<div class = "detail_image">
		<!-- 별점 -->
	</div>
	<div class = "review_tab" id ="reviewbtn">
		<ul>
		<li name = "allcom" class = "on"><a href = "" title="전체보기" >전체보기</a></li>
		<li name = "photocom"><a href = "" title="포토이용후기" >포토이용후기</a></li>
		<li name = "bestcom"><a href = "" title="베스트이용후기" >베스트이용후기</a></li>
		</ul>
	</div>
	<div class = "review_table" id="review_table">
		<table border="1">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>추천수</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<tr>
			<!-- 리스트 뿌려주기 -->
			</tr>
		</table>
		<button id="review_btn" onclick='location.href = "crwrite.do"'>이용후기 쓰기</button>
	</div>
	
</div>

</div>
</div>

<script type="text/javascript">
$("#totbtn").click(function(){
var ori_price = parseInt($("#ori_price").text());
var c_option1 = parseInt($("select[name=card_amount] option:selected").val());
var c_option2 = parseInt($("select[name=card_bag] option:selected").val());

$("#total_price").text((ori_price * c_option1 + c_option2));
});


$("#datebtn").click(function(){
var newDate=new Date();
var yy = newDate.getFullYear();
var mm = newDate.getMorth()+1;
var dd = newDate.getDate();
if(dd<10){dd='0'+dd}
if(mm<10){mm='0'+mm}
var toDay = yy + mm + dd;
var getdate = new Date(toDay);
getdate.setDate(getdate.getDate()+3);
var getdate2 = new Date(toDay);
getdate2.setDate(getdate2.getDate()+7);

$("#pro_date").text(getdate);
$("#pro_date2").text(getdate2);
});
</script>
