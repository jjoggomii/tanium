<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글쓰기</title>

<!-- jquery.validate api -->

<script type="text/javascript"
   src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
   
	<style type="text/css">
		
	</style> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	//	function insertNotice() 
	//	{
	//		alert("insertNotice() >>> ");
	//		$("#insertForm").attr("action","/nt/insertNotice.tan");
	//		$("#insertForm").submit();  
	//	} 
		
		function backToList() 
		{
			alert("backToList() >>> ");
			$("#insertForm").attr("action","/nt/listNotice.tan");
			$("#insertForm").submit();  
		}
	</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td><h3>공지사항 글쓰기</h3></td>
			</tr>
		</thead>
	</table>
	<form id="insertForm" name="insertForm" method="post" action = "/nt/insertNotice.tan"> 
		<table border="1">		
			<tbody>
				<tr>
					<td align="center">제목</td>
					<td><input type = "text"  id="ntsubject" name="ntsubject" size="50" maxlength="10" required/></td>
							
					<!--  <td><input type="checkbox" id= "nttop" name="nttop" value="Y"/>공지로 등록</td>-->
				</tr>
				<tr>
					<td align="center">내용</td>
					<td colspan="2"><textarea cols="50" rows="13" id= ntcontent name="ntcontent" required></textarea></td>
				</tr>
		</table>
		<table>
				<tr align="center">
					<td colspan="3">
					<input type=submit value="작성하기">
						<!-- <input type=button value="작성하기" onclick="insertNotice()"> --> 
						<input type=button value="취소" onclick="backToList()">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>