<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>인사 관리 메뉴</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript">
	function memberjoin() {
		alert("memberjoin() 함수시작");
		console.log("사원등록 시작 >>> :");
		$("#mbno").val("");
		window.open("", "pop", "width=660px, height=910px");
		$("#personnel").attr("action", "/member/join.do");
		$("#personnel").attr("target", "pop");
		$("#personnel").submit();
	}
	function memberselect() {
		alert("memberselect() 함수 시작");
		console.log("사원조회 시작 >>> :");
		$("#mbno").val("");
		$("#personnel").attr("action", "/member/select.do");
		$("#personnel").submit();
	}
</script>
</head>
<body>
	<form method="POST" id="personnel" name="personnel">
		<table>
			<tr>
				<td><input type="button" value="조직도 관리" onclick="" /></td>
			</tr>
			<tr>
				<td><input type="button" value="사원등록" onclick="memberjoin()" />
					<input type = "hidden" id = "mbno" name = "mbno" value= "insert"/>
				</td>
			</tr>

			<tr>
				<td><input type="button" value="사원조회" onclick="memberselect()" />
					<input type = "hidden" id = "mbno" name = "mbno" value = "select"/>
				</td>
					
			</tr>
			<tr>
				<td><input type="button" value="사원 현황" onclick="" /></td>
			</tr>
		</table>
	</form>
</body>
</html>