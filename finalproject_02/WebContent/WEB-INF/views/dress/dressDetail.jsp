<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ not empty dflag && dflag eq 'DsSucc'}">
	<script type="text/javascript">
		alert("방문예약 승인중입니다..");
	</script>
</c:if>

<c:if test="${ not empty dflag && dflag eq 'DsFail'}">
	<script type="text/javascript">
		alert("개인고객만 예약가능합니다.");
	</script>
</c:if>

<!-- datepicker -->
<!--  // jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<div class="container">
	<h2 class="nino-sectionHeading">
	<span class="nino-subHeading">Dress</span>
		${Ddto.dname}
	</h2>
	<p class="nino-sectionDesc">
		${Ddto.content}
	</p>
	<div class="sectionContent">
		<div class="row">
			<div class="col-md-6">
				<div class="text-center">
					<img src="upload/${Ddto.getPicture0()}" alt="" id="bigimg" style="height: 500px; width: 350px">
				</div>
				<br>
			</div>
			<div class="col-md-6">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-camera nino-icon"></i> 
									상세 정보
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" >
							<div class="panel-body" style="font-style: normal">
							<h4>영업 시간 : ${Ddto.opentime}</h4>
							<br>
							<h4>주소 : ${Ddto.addre}</h4>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-owl nino-icon"></i> 
									예약
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="font-style: normal">
								<form action="reservationDress.do" method="post">
									<input type="hidden" value="${Ddto.dsseq }" name="pdseq" id="_pdseq">
									<input type="hidden" value="${login.id }" name="mid" id="_mid">
									<font style="text-align: center" color="black">날짜 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시간 선택&nbsp;&nbsp;&nbsp;&nbsp;<br></font>
									<input type="text" id="_redate" name="redate" size="10" value="">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<select style="text-align: center" class="retime" name="retime" id="_retime">
										<option value="09:00~10:00">09:00 ~ 10:00</option>
										<option value="10:00~11:00">10:00 ~ 11:00</option>
										<option value="11:00~12:00">11:00 ~ 12:00</option>
										<option value="12:00~13:00">12:00 ~ 13:00</option>
										<option value="14:00~15:00">14:00 ~ 15:00</option>
										<option value="15:00~16:00">15:00 ~ 16:00</option>
										<option value="16:00~17:00">16:00 ~ 17:00</option>
										<option value="17:00~18:00">17:00 ~ 18:00</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" id="r_checkbtn" name="r_checkbtn" value="예약확인"><font color="black">예약확인</font></button>
									<br><br>
									<font color="black">예약 확인 : <input type="text" style="border: 0; text-decoration: black" name="reser_check" id="reser_check" readonly="readonly" value="" size="30"></font>
									<br><br>
									<input type="submit" value="reservation">
								</form>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-laptop-mac nino-icon"></i> 
									후기
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body" style="font-style: normal">
							
								<table align="center">
								<col width="160"><col width="365"><col width="100">	
								<tr style="border-bottom: solid; border-bottom-color: lightgray">
									<th align="center">작성일</th><th>댓글</th><th>작성자</th>
								</tr>
								
								<%-- <%
								if(commentlist == null || commentlist.size() == 0){
									%>	
									<tr style="border-bottom: solid; border-bottom-color: lightgray">
										<td colspan="3">작성된 댓글이 없습니다</td>
									</tr>	
									<%
								}
								for(int i = 0;i < commentlist.size(); i++){
									CommentDto commentdto = commentlist.get(i);
									%>
									<tr style="border-bottom: solid; border-bottom-color: lightgray">
										<td><%=commentdto.getWdate() %></td>
										<td>
											<%=commentdto.getContent() %>
										</td>
										<td><%=commentdto.getId() %></td>
									</tr>
								<%
								}
								%>	 --%>
								</table>
								<br>
								
							
								 <form action="commu_comment.jsp">
									<input type="hidden" name="seq" value="">
									<table align="center">
									<col width="100"><col width="425"><col width="95">	
									
									<tr style="border: 0; border-bottom-color: lightgray">
										<td colspan="2">
											<input type="text" name="comment_content" size="70">
										</td>
										<td>
											<input class="w3-btn w3-white w3-border w3-border-red w3-round-large" type="submit" value="댓글 달기">
										</td>
									</tr>
									
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<c:forEach items="${ Ddto.pic }" var="pic" varStatus="i">
		<c:if test="${ not empty pic && pic ne ''}">
			<c:if test="${ i.index == 0 }">
				<img alt="이미지 없음" src="upload/${ pic }" onclick="imgChange('${pic}', ${i.index})" id="simg${i.index}" style="height: 110px; width: 85px" class="select_img">
			</c:if>
			<c:if test="${ i.index > 0 }">
				<img alt="이미지 없음" src="upload/${ pic }" onclick="imgChange('${pic}', ${i.index})" id="simg${i.index}" style="height:110px; width:85px">
			</c:if>
		</c:if>
	</c:forEach>
</div>
<br><br>
<div class="container" align="center">
	<c:if test="${ not empty login && login.auth == 'admin'}">
		<button onclick="mod()">수정</button>
		<button onclick="del()">삭제</button>
	</c:if>
</div>
<!-- class="select_img" -->

<script>
var selectedIndex = 0;

function imgChange(pic, index) {
 	var src = "upload/" + pic;
	$("#bigimg").attr("src", src);
	var selectedId = "#simg" + selectedIndex;
	var newId = "#simg" + index;
	$(selectedId).removeAttr("class");
	$(newId).attr("class", "select_img");
	selectedIndex = index;
}

$("#r_checkbtn").click(function(){
	var c_option1 = $("#_redate").val();
	var c_option2 = $("select[name=retime] option:selected").val();

	$("#reser_check").val(c_option1 + "  " + c_option2 + "입니다.");
});


function del() {
	if (confirm("삭제 하시겠습니까?")) {
		location.href = "dressDelete.do?dsseq=" + ${Ddto.dsseq};
	}
}

function mod() {
	location.href = "dressUpdate.do?dsseq=" + ${Ddto.dsseq};
}

</script>

<script>
var startD = "";
var endD = "";

var year = "";
var month = "";
var day = "";
  $("#_redate").datepicker(   // inputbox 의 id 가 startDate 
          {dateFormat:'yy/mm/dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
           , showOn: 'button' // 클릭으로 우측에 달력 icon 을 보인다.
           , buttonImage: 'assets/images/selectCal.jpg'  // 우측 달력 icon 의 이미지 패스 
           , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
           , changeMonth: true // 월선택 select box 표시 (기본은 false)
           , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
           , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
           , minDate : 0         // 오늘부터 시작
           , onSelect: function(date){
         		selectDate(date);
           }
     });
  
  $('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

//datepicker 날짜 선택시 수행
  function selectDate(date) {
  	//alert(date);
  	var adata = {
  			redate:date,
  			pdseq:${Ddto.dsseq}
  	};
  	
  	$.ajax({
			url:"getDSReservListByPdseqRedate.do",
			type:"get",
			data:adata,
			success:function(msg){
				
					$("#_retime").empty();
					$("#_retime").append("<option value='09:00~10:00'>09:00 ~ 10:00</option>");
					$("#_retime").append("<option value='10:00~11:00'>10:00 ~ 11:00</option>");
					$("#_retime").append("<option value='11:00~12:00'>11:00 ~ 12:00</option>");
					$("#_retime").append("<option value='12:00~13:00'>12:00 ~ 13:00</option>");
					$("#_retime").append("<option value='14:00~15:00'>14:00 ~ 15:00</option>");
					$("#_retime").append("<option value='15:00~16:00'>15:00 ~ 16:00</option>");
					$("#_retime").append("<option value='16:00~17:00'>16:00 ~ 17:00</option>");
					$("#_retime").append("<option value='17:00~18:00'>17:00 ~ 18:00</option>");
					
					//예약된 시간 삭제
					for(var i = 0; i < msg.reservListDS.length; i++){
	  				var retime = msg.reservListDS[i].retime;
	  				var optionId = "#_retime option[value='" + retime +"']";
	  				$(optionId).remove();
	  				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
			
		 });
	}
</script>