<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<div class="container">
	<div align="center">
	<form name="frmForm" id="_frmForm" method="post">
		<table border="1">
		<colgroup>
			<col style="width:30%">
			<col style="width:70%">
		</colgroup>
		<tr>
			<th style="background: #eeeeee; color: #3e5fba;">아이디</th>
			<td>&nbsp;<input type="text" id="_id" name="id" value="" data-msg="ID를" size="15" title="아이디" style="border: 1px solid #dddddd;">
				<input type="checkbox" id="_chk_save_id">ID 저장
			</td>
		</tr>
		
		<tr>
			<th style="background: #eeeeee; color: #3e5fba;">패스워드</th>
			<td>&nbsp;<input type="text" id="_pwd" name="pwd" value="" data-msg="패스워드를" size="15" title="패스워드" style="border: 1px solid #dddddd;">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="height: 50px; text-align: center;">
				<span>
					<a href="#none" id="_btnLogin" title="로그인">
						<img alt="로그인" src="assets/images/others/login_btn.jpg">
					</a>
					<a href="#none" id="_btnRegi" title="회원가입">
						<img alt="회원가입" src="assets/images/others/regi.jpg">
					</a>
				</span>
			</td>
		</tr>
		</table>
	</form>
	</div>
</div>
<!-- 쿠키에 저장되는 부분 -->
<script type="text/javascript">
$("#_btnLogin").click(function() {
	if($("#_id").val() == ""){
		alert($("#_id").attr("data-msg") + " 입력해 주십시오" );
		$("#_id").focus();
	} else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
//		$("#_frmForm").attr("target", "_self").submit();
		go();
	}	
});

$("#_btnRegi").click(function() {
	location.href = "SelectRegi.do";
});

$("#_id").keypress(function(event) {
	if(event.which == "13"){
		event.preventDefault();
		$("#_pwd").focus();
	}
});

$("#_pwd").keypress(function() {
	if(event.which == "13"){
		event.preventDefault();
		$("#_btnLogin").click();
	}
});

//id저장
var user_id = $.cookie("user_id");
if(user_id != null){
	$("#_id").val(user_id);
	$("#_chk_save_id").attr("checked", "checked");
}

$("#_chk_save_id").click(function() {		
	if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
		if($("#_id").val() == ""){
			$(this).prop("checked", false);
			alert("아이디를 입력해 주십시오");
		}else{
			$.cookie("user_id", $("#_id").val(), { expires: 7, path: '/' });
		}		
	}else{
		$.removeCookie("user_id", { path:'/' });
	}
});

function go() {
	var id = $("#_id").val();
	var pwd = $("#_pwd").val();
	console.log("id = " + id);
	console.log("pwd = " + pwd);
	$.ajax({
		type:"post",
		url:"loginAf.do",
		data:"id=" + id+"&pwd=" + pwd,
		async:true,
		success:function(data){
			if(data=="true"){
				opener.top.location.href="index.do";
				self.close();
			}else{
				$("#_id").val("");
				$("#_pwd").val("");
				alert("ID와 PWD가 맞지않습니다.");
			}
		}		
	});
}

</script>