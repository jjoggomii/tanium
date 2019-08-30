<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"> 
		function insertPage() 
		{
			alert("insertPage() >>> ");
			$("#noticeForm").attr("action","/nt/goInsertPage.tan");
			$("#noticeForm").submit();  
		} 
	</script>
</head>

<body>
	<form id="noticeForm" name="noticeForm" method="post" > 
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
	
	
		         <c:set var="size" value="${fn:length(ntList)}" />
					<!-- ${size}  -->
				<c:forEach items="${ntList}" var="row" varStatus="status">
		           <!-- <c:out value="${status.index}" />  --> 
		              <tr> 
		              <td>${size - status.index}</td> 
		              <td>${row.ntsubject}</td>
		              <td>${row.ntwriter}</td>
		              <td>${row.ntmakedate}</td>
		              <td>${row.ntviews}</td>
		              </tr>
		            </c:forEach>
			</tbody>
						
			<tfoot>
				 <tr>
					<td colspan="5"><input type=button onclick="insertPage()" value="글쓰기" style="margin-left:93%;"></td>
				</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>