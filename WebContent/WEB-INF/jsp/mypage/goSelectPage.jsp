<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#mbnoForm").attr("action", "selectMp.tan");
				$("#mbnoForm").submit();
			});
		</script>
</head>
<body>
	<form id="mbnoForm" name="mbnoForm" method="post" > 
		<input type="hidden" name="mbno" id="mbno" value="${mbno}">
	</form>
</body>
</html>