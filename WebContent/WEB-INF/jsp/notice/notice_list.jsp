<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
	<table border = "1">
		<thead>
			<tr>
				<td width="73">번호</td>
				<td width="379">제목</td>
				<td width="73">작성자</td>
				<td width="164">작성일</td>
				<td width="58">조회수</td>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty ntList}">
	               <tr>
	                  <td colspan="5" align="center">게시물이 존재 하지 않습니다.</td>
	               </tr>
	            </c:if>
		</tbody>
		
		<tfoot>
			 <tr>
				<td colspan="5"><input type=button value="글쓰기" style="margin-left:93%;"></td>
			</tr>
		</tfoot>
	</table>

</body>
</html>