<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login V20</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="/resources/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		if ($("#loginResult").val()=='n') {
			$("#loginResult").val('')
			alert("아이디 또는 비밀번호가 틀렸습니다.");
		}	
	});
	
	
	
	function go(){
		alert("함수실행 !!");
		$("#login").attr("action", "loginCheck.tan");
		$("#login").submit();
	}
</script>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<form class="login100-form validate-form" id = "login" method = "POST">
				<input type ="hidden" id = "loginResult" value="${r}"/>
					<span class="login100-form-title p-b-43">
						<p style="text-align: center;">
							<img src="/resources/img/logo.png">
						</p>
					</span>

					<div class="wrap-input100 rs1 validate-input"
						data-validate="아이디를 입력해주세요">
						<input class="input100" type="text" name="mbno"id = "mbno"> <span
							class="label-input100">UserID</span>
					</div>


					<div class="wrap-input100 rs2 validate-input"
						data-validate="비밀번호를 입력해주세요">
						<input class="input100" type="password" name="mbpw" id ="mbpw"> <span
							class="label-input100">Password</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick = "go()">Sign in</button>
					</div>

					<div class="text-center w-full p-t-23">
						<a href="#" class="txt1"> For got ID </a> <a href="#" class="txt1">
							/ </a> <a href="#" class="txt1"> For got PW </a>
					</div>
				</form>
			</div>
		</div>
	</div>





	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/js/main.js"></script>

</body>
</html>