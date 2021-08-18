<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
<style type="text/css">

#joinbox {
	position: absolute;
 	left: 50%;
 	transform: translateX(-50%);
}

#snsUserBox {
	visibility:hidden;
}

#text_align {
	text-align: center;
}

#joinMsg {
	font-size: 12px;
}

#joinErr {
	font-size: 11px;
}

.join_input {
	border: none;
	color: white;
	border-bottom: 2px solid #D1D1D4;
	background: #212121;
	padding: 15px;
	padding-left: 24px;
	margin-left: 18px;
	font-weight: 700;
	width: 75%;
	transition: .4s;
}

.join_input:active,
.join_input:focus,
.join_input:hover {
	background: #212121;
	outline: none;
	border-bottom-color: #6A679E;
}

#joinSubmit {
	background: #fff;
	font-size: 14px;
	margin-top: 30px;
	margin-left:22px;
	padding: 8px 20px;
	border-radius: 5px;
	border: 1px solid #D4D3E8;
	text-transform: uppercase;
	text-align: center;
	font-weight: 1000;
	align-items: center;
	width: 70%;
	color: #4C489D;
	box-shadow: 0px 2px 2px #5C5696;
	cursor: pointer;
	transition: .4s;
	float:left;
}

#joinSubmit:active,
#joinSubmit:focus,
#joinSubmit:hover {
	border-color: #6A679E;
	outline: none;
}

</style>
<script type="text/javascript">

$(function(){
	$("#joinSubmit").prop("readonly", true);
});

function focusID(){
	$("#joinMsg").text("4자 이상, 이메일도 사용 가능합니다.");
	$("#email").prop("disabled", true);
	$("#id").prop("readonly", false);
}
function focusName(){
	$("#joinMsg").text("특수문자는 사용하실 수 없습니다.");
	$("#email").prop("disabled", true);
	$("#id").prop("disabled", true);
	$("#name").prop("readonly", false);
}
function focusPw(){
	$("#joinMsg").text("6자 이상 입력해주세요.");
}
function focusEmail(){
	$("#joinMsg").text("아이디를 이메일로 사용시 향후 변경이 불가합니다.");
	$("#id").prop("disabled", true);
	$("#email").prop("readonly", false);
}
function focusBirth(){
	$("#joinMsg").text("2020-02-02 형식으로 입력해주세요.");
}

function checkID(){
	var id = $("#id").val();
	var email = $("#email").val();
	
	if(id == "" || id.length < 4){
		$("#id").css("border-bottom-color", "red");
		$("#joinErr").text("아이디를 4자 이상 작성해주세요.");
		$("#id").focus();
		$(".join_input").prop("readonly", true);
		$("#id").prop("readonly", false);
		return false;
	}
	if(id.includes('@') == 1 && id.includes('.') == true){
		$("#email").val($("#id").val());
		$("#id").css("border-bottom-color", "#6A679E");
		$("#email").css("border-bottom-color", "#6A679E");
		$("#joinErr").text(" ");
		$(".join_input").prop("readonly", false);
	}
	$.ajax({
		type:'post',
		dataType:'text',
		data: 'id='+id,
		url: '../joinCheck',
		success: function(rData, textStatus, xhr){
			if(rData == 1){
				$("#id").css("border-bottom-color", "red");
				$("#joinErr").text("이미 등록된 아이디 입니다.");
				$(".join_input").prop("readonly", true);
				$("#id").prop("readonly", false);
				return false;
			}else{
				$("#id").css("border-bottom-color", "#6A679E");
				$("#joinErr").text(" ");
				$(".join_input").prop("readonly", false);
				$("#email").prop("disabled", false);
				return true;
			}
		},
		error: function(xhr, status, e){
			alert("문제 발생 : " + e);
		}
	});
}



function checkName(){
	var name = $("#name").val();
//	alert($("#id").val());
//	alert(name);
//	alert($("#password").val());
//	alert($("#confirmPassword").val());
//	alert($("#email").val());
	if(name == ""){
		$("#name").css("border-bottom-color", "red");
		$("#joinErr").text("닉네임을 작성해주세요.");
		$("#name").focus();
		$(".join_input").prop("readonly", true);
		$("#name").prop("readonly", false);
	}
	$.ajax({
		type:'post',
		dataType:'text',
		data: 'name='+name,
		url: '../joinCheck',
		success: function(rData, textStatus, xhr){
			if(rData == 1){
				$("#name").css("border-bottom-color", "red");
				$("#joinErr").text("이미 등록된 닉네임 입니다.");
				$(".join_input").prop("readonly", true);
				$("#name").prop("readonly", false);
			}else{
				$("#name").css("border-bottom-color", "#6A679E");
				$("#joinErr").text(" ");
				$(".join_input").prop("readonly", false);
				$("#email").prop("disabled", false);
				$("#id").prop("disabled", false);
				return true;
			}
		},
		error: function(xhr, status, e){
			alert("문제 발생 : " + e);
		}
	});
}



function isSame() {
	var pw1 = $("#password").val();
	var pw2 = $("#confirmPassword").val();
    
	if(pw1.length < 6 || pw1.length > 30){
			$("#joinErr").text("비밀번호를 6자 이상 입력해주세요.");
			$("#password").css("border-bottom-color", "red");
			$(".join_input").prop("readonly", true);
			$("#password").prop("readonly", false);
			$("#confirmPassword").prop("readonly", false);
            return false;
    }
	if(pw1.length > 5){
    	if(pw1 == pw2 && pw2 == pw1) {
    		$("#joinErr").text(" ");
			$("#password").css("border-bottom-color", "#6A679E");
			$("#confirmPassword").css("border-bottom-color", "#6A679E");
			$(".join_input").prop("readonly", false);
            return true;
        } else if(pw2 == "") {
        	$("#joinErr").text("비밀번호를 한번 더 입력해주세요.");
			$("#confirmPassword").css("border-bottom-color", "red");
        } else {
            $("#joinErr").text("비밀번호가 일치하지 않습니다.");
			$("#password").css("border-bottom-color", "red");
			$("#confirmPassword").css("border-bottom-color", "red");
			$(".join_input").prop("readonly", true);
			$("#password").prop("readonly", false);
			$("#confirmPassword").prop("readonly", false);
        }
    } 
}
	
	
	

function checkEmail(){
	var id = $("#id").val();
	var email = $("#email").val();
	if(email == "" || id.length < 5 || id.includes('.') != true || id.includes('@') != true){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#email").css("border-bottom-color", "red");
		$("#email").focus();
		$(".join_input").prop("readonly", true);
		$("#email").prop("readonly", false);
	}
	if(id.includes('@') == 1 && id.includes('.') == true){
		if(id != email){
			$("#email").css("border-bottom-color", "red");
			$("#joinErr").text("아이디와 이메일을 똑같이 입력해주세요.");
			$("#id").focus();
			$(".join_input").prop("readonly", true);
			$("#email").prop("readonly", false);
			return false;
		}
		if(email != id){
			$("#email").css("border-bottom-color", "red");
			$("#joinErr").text("아이디와 이메일을 똑같이 입력해주세요.");
			$("#id").focus();
			$(".join_input").prop("readonly", true);
			$("#email").prop("readonly", false);
			return false;
		}
	}
	$.ajax({
		type:'post',
		dataType:'text',
		data: 'email='+email,
		url: '../joinCheck',
		success: function(rData, textStatus, xhr){
			if(rData == 1){
				$("#email").css("border-bottom-color", "red");
				$("#joinErr").text("이미 등록된 이메일입니다.");
				$(".join_input").prop("readonly", true);
				$("#email").prop("readonly", false);
			}else{
				$("#email").css("border-bottom-color", "#6A679E");
				$("#joinErr").text(" ");
				$(".join_input").prop("readonly", false);
				$("#id").prop("disabled", false);
				$("#name").prop("disabled", false);
				return true;
			}
		},
		error: function(xhr, status, e){
			alert("문제 발생 : " + e);
		}
	});
}





function checkBirth() {
	var birth = $("#birth_date").val();
	var bc = document.getElementById('birthConfirm');
    
	if(birth != null){
    	$("#birth_date").css("border-bottom-color", "#6A679E");
    	$("#joinErr").text(" ");
		$(".join_input").prop("readonly", false);
		$("#joinSubmit").prop("type", "submit");
		$("#joinSubmit").prop("readonly", false);
    	return true;
    } else if (birth.include('-') != 2 && birth.length() != 10){
    	$("#birth_date").css("border-bottom-color", "red");
		$("#joinErr").text("생년월일을 다시 확인해주세요.");
		$(".join_input").prop("readonly", true);
		$("#birth_date").prop("readonly", false);
        return false;
    }
}



function handleOnInput(e)  {
	  e.value = e.value.replace(/[^ㄱ-힣a-zA-Z0-9]/ig, '')
	}

function handleOnEmail(e)  {
	  e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
	}

	
</script>

</head>
<body>
	<div id="joinBox" class="modalBox">
		<h2 align="center">회원가입</h2>
	<div id="text_align"><span id="joinMsg">D'movie</span></div>
	<div id="text_align"><span id="joinErr"> </span></div>
		
		<form action="${pageContext.request.contextPath }/join.do" method="post" autocomplete="off">
			<c:if test="${empty snsUser}">
				<div>
					<input type="text" id="id" name="id" class="join_input" placeholder="아이디" required="required" onchange="checkID()" oninput="handleOnEmail(this)" onfocus="focusID()">
				</div>
				<div>
					<input type="text" id="name" name="name" class="join_input" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInput(this)" onfocus="focusName()">
				</div>
				<div>
					<input type="password" id="password" name="password" class="join_input" placeholder="비밀번호" required="required" onchange="isSame()" onfocus="focusPw()">
				</div>
				<div>
					<input type="password" id="confirmPassword" name="confirmPassword" class="join_input" placeholder="비밀번호 확인" required="required" onchange="isSame()">
				</div>
				<div>
					<input type="email" id="email" name="email" class="join_input" placeholder="이메일" required="required" style="text-transform: lowercase" onchange="checkEmail()" onchange="checkConfirmEmail()" oninput="handleOnEmail(this)" onfocus="focusEmail()">
				</div>
			</c:if>
			<c:if test="${! empty snsUser}">
				<div>
					<input type="text" id="name" name="name" class="join_input" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInput(this)" onfocus="focusName()">
				</div>
			</c:if>
			<c:if test="${! empty snsUser}">
				<div id="snsUserBox">
					<input id="id" name="id" readonly="readonly" value="${snsUser.email}">
					<input id="password" type="password" name="password" readonly="readonly" value="${snsUser.access_token }">
					<input id="confirmPassword" type="password" name="confirmPassword" readonly="readonly" value="${snsUser.access_token }">
					<input id="email" name="email" readonly="readonly" value="${snsUser.email}">
				</div>
			</c:if>
				<div>
					<input type="date" id="birth_date" name="birth_date" class="join_input" placeholder="생일" required="required" onchange="checkBirth()" onfocus="focusBirth()">
				</div>
			
					<input id="joinSubmit" name="joinSubmit" value="가입하기">
		</form>
		
	</div>
</body>
</html>