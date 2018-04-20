<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 
--%><!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 -->
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	height: 1000px;
}
td font{
	font-size:12px;color:#008BDC;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
padding:  20px 20px;
}
td{
	 background-color:#F8F8F8;
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div class="container">

	<h2 class="nino-sectionHeading">
		<span class="nino-subHeading">For you, with us</span>
			회원가입
	</h2>
	
	<p class="nino-sectionDesc">
		회원 가입을 하시면 For you, with us 서비스를 편리하게 이용 하실 수 있습니다.
	</p>
	
	<div align="center">
	<div class="joinField" align="center" style="width:700px">		<!-- 임의 지정 -->
		<form action="memberJoin.do" method="post" onsubmit="return checkSubmit()">
			<input type="hidden" name="auth" value="member">
			<table border="1" style="width:100%">
				<colgroup>
					<col width="30%"><col width="70%">
				</colgroup>
				<tr>
					<td>*회원 아이디</td>
					<td>
						<input type="text" name="mid" id="_mid">&nbsp;※ 4자 이상, 12자 이하 영문 및 숫자
						<p id="_checkIdP" style="margin: 0px">&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td>*비밀번호</td>
					<td>
						<input type="password" name="pwd" id="_pwd">&nbsp;※ 4자 이상, 12자 이하 영문 및 숫자
						<p id="_checkPwdP1" style="margin: 0px">&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td>*비밀번호 확인</td>
					<td>
						<input type="password" id="_pwdck">
						<p id="_checkPwdP2" style="margin: 0px">&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td>*이름</td>
					<td>
						<input type="text" name="mname" id="_mname">
					</td>
				</tr>
				<tr>
					<td>*성별</td>
					<td>
						<input type="radio" name="sex" value="f" checked> 여성&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="f"> 남성
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="hidden" name="email" id="_email">
						<input type="text" id="_email1">@
						<!-- <input type="text" id="_email2"> -->
						<select id="_email2">
							<option selected>naver.com</option>
							<option selected>daum.net</option>
							<option selected>gmail.com</option>
						</select>
						<div id="_checkEmailDiv">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>*휴대폰(연락처)</td>
					<td>
						<input type="hidden" name="phone" id="_phone">
						<select id="_phone1">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>-
						<input type="text" id="_phone2">-
						<input type="text" id="_phone3">
					</td>
				</tr>
				<tr>
					<td>*주소</td>
					<td>
						<input type="text" name="address" id="_address">
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="checkbox" id="_check1"> (필수) 회원 약관에 동의합니다.<br> 
						<input type="checkbox" id="_check2"> (필수) 개인정보 처리방침에 동의합니다.<br> 
						<input type="checkbox" id="_check3"> (필수) 개인정보의 제3자 이용에 동의합니다.<br> 
						<input type="checkbox" id="_checkAll"> 상기의 모든 내용에 동의합니다.<br> 
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
	</div>


</div>


<script type="text/javascript">
var pwdFlag1 = false;
var pwdFlag2 = false;
var idFlag = false;
var emailFalg = true;

function checkSubmit() {
	var flag = false;
	
	// 휴대폰 번호
	var phone1 = $("#_phone1 option:selected").val();
	var phone2 =  $("#_phone2").val();
	var phone3 =  $("#_phone3").val();
	if (phone2.trim() == "" || phone2.length< 3 || phone2.length > 4 || !isNum(phone2)) {
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else if (phone3.trim() == "" || phone3.length != 4 || !isNum(phone3)) {
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else {
		$("#_phone").val(phone1 + "-" + phone2 + "-" + phone3);
	}
	
	// 공백체크
	 if (!idFlag) {
		alert("아이디를 확인해주세요.");
	} else if (!(pwdFlag1 && pwdFlag2)) {
		alert("비밀번호를 확인해주세요.");
	} else if (!emailFalg) {
		alert("이메일 주소를 확인해주세요.");
	} else if ($("#_mname").val().trim() == "") {
		alert("이름을 입력해주세요.");
	} else if ($("#_address").val().trim() == "") {
		alert("주소를 입력해주세요.");
	} else if (!$("#_check1").is(":checked") || !$("#_check2").is(":checked") || !$("#_check3").is(":checked")) {
		alert("약관에 동의해주세요.");
	}
	else {
		flag = true;
	}

	return flag;
}

$(document).ready(function () {
	// 아이디 중복 확인
	$("#_mid").blur(function () {
		$.ajax({
			url:"checkId.do",
			type:"get",
			data:"id=" + $("#_mid").val(),
			success:function(msg){
				
				if ($("#_mid").val().length < 4 || $("#_mid").val().length > 12 || !isEngNum($("#_mid").val())) {
					$("#_checkIdP").html("아이디는 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
					
					idFlag = false;
				} else {
					CheckMessage(msg);
				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
	
	$("#_email1").blur(function () {
		emailCheck();
	});
	
	$("#_email2").change(function () {
		emailCheck();
	});
	
	// 비밀번호 확인
	$("#_pwd").blur(function () {
		if ($("#_pwd").val().length < 4 || $("#_pwd").val().length > 12 || !isEngNum($("#_pwd").val()))  {
			$("#_checkPwdP1").html("비밀번호는 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
			$("#_checkPwdP1").css("color","#ff0000");
			pwdFlag1 = false;
		} else {
			$("#_checkPwdP1").html("&nbsp;");
			pwdFlag1 = true;
		}
	});
	
	$("#_pwdck").blur(function () {
		if ($("#_pwd").val() != $("#_pwdck").val()) {
			$("#_checkPwdP2").html("비밀번호가 일치하지 않습니다.");
			$("#_checkPwdP2").css("color","#ff0000");
			pwdFlag2 = false;
		} else {
			$("#_checkPwdP2").html("&nbsp;");
			pwdFlag2 = true;
		}
	});
	
	// 모든 약관 동의
	$("#_checkAll").click(function () {
		if($("#_checkAll").is(":checked")) {
			$("#_check1").prop("checked", "checked");
			$("#_check2").prop("checked", "checked");
			$("#_check3").prop("checked", "checked");
		} else {
			$("#_check1").removeProp("checked");
			$("#_check2").removeProp("checked");
			$("#_check3").removeProp("checked");
		}
	});
});

// 이메일 체크
function emailCheck() {
	// 이메일 조합
	var email1 = $("#_email1").val();
	var email2 = $("#_email2 option:selected").val();
	if (email1.trim() != "") {
		$("#_email").val(email1 + "@" + email2);
	} else {
		$("#_email").val("");
	}
	
	// 이메일 중복 확인(없어도 되지만 겹치는 건 안 됨 : unique)
	$.ajax({
		url:"checkEmail.do",
		type:"get",
		data:"email=" + $("#_email").val(),
		success:function(msg){
			CheckMessage(msg);
		},
		error:function(reqest, status, error){
			alert("실패");
		}
	});
}

//메시지를 뿌려주는 부분
function CheckMessage(msg) {
	alert("CheckMessage");
	if(msg.type=="id"){
		if(msg.message=="true"){
			/* div태그에 접근할 때 html방식으로 접근 */
			$("#_checkIdP").text("사용할 수 없는 아이디입니다.");
			$("#_checkIdP").css("color","#ff0000");
			$("#_cid").focus();
			idFlag = false;
		}else{
			$("#_checkIdP").text("사용할 수 있는 아이디입니다.");
			$("#_checkIdP").css("color","#0000ff");
			idFlag = true;
		}
	}
	if(msg.type=="email"){
		if(msg.message=="true"){
			/* div태그에 접근할 때 html방식으로 접근 */
			$("#_checkEmailDiv").html("사용중인 이메일 주소입니다.");
			$("#_checkEmailDiv").css("color","#ff0000");
			$("#_email1").val("");
			emailFlag = false;
		}else{
			var email = $("#_email1").val()+"@"+$("#_email2 option:selected").text();
			alert("------------> email : "+email);
			$("#_checkEmailDiv").html("사용할 수 있는 이메일입니다.");
			$("#_checkEmailDiv").css("color","#0000ff");
			$("#_email").val(email);
			emailFlag = true;
		}
	}
}


//영문 또는 숫자이면 true, 아니면 false
function isEngNum(str) {
	for( var i = 0; i <= str.length -1 ; i++ ) {
		if (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') {
		} else if (str.charAt(i) >= '0' && str.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}

// 숫자이면 true
function isNum(str) {
	for( var i = 0; i <= str.length -1 ; i++ ) {
		if (str.charAt(i) >= '0' && str.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}

</script>




