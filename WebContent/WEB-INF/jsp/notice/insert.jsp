<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
			<c:set var = "nCnt" value= "${nCnt}"/>
			<c:choose>
				<c:when test="${nCnt==1}">
					<c:out value = "${nCnt}"/>건 입력됨!
				</c:when>
			</c:choose> 

			
	</body>
</html>
