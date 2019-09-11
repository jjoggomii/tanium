<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>인사 관리 메뉴</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	
<script type="text/javascript">

	$(document).ready(function(){
		loginForm();
	});
	

function loginForm(){
	/* alert("로그인 페이지 시작  >>> : "); */
	$("#mbno").val("");
	$("#loginForm").attr("action","/loginStart/loginForm.tan");
	$("#loginForm").submit();
}
	
</script>
</head>
<body>
	<form method = "POST" id = "loginForm"> 
	<div>
	<!-- 	<a href="javascript:loginForm()">[login]</a> -->
		<input type = "hidden" id = "mbno" name = "mbno"/>
	</div>
	</form>
</body>
</html>