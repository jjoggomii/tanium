<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version = '1.0' encoding = 'UTF-8'?>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<% //값이 잘 넘어 왔나 확인
			System.out.println("여기는 selectAll.jsp 입니다.");
			String obj = request.getParameter("list");
		%>

	<c:choose>
		<c:when test="${not empty list}">
				<comments>
					<c:forEach var = "clist" items="${list}">
						<c:set var = "bcno" value = '${clist.bcno}'/>
						<c:set var = "mbname" value = '${clist.mbname}'/>
						<c:set var = "gname" value = '${clist.gname}'/>
						<c:set var = "bcmakedate" value = '${clist.bcmakedate}'/>
						<c:set var = "bccontent" value = '${clist.bccontent}'/>
						
						
						<%
							String bcno = (String)pageContext.getAttribute("bcno");
							String mbname = (String)pageContext.getAttribute("mbname");
							String gname = (String)pageContext.getAttribute("gname");
							String bcmakedate = (String)pageContext.getAttribute("bcmakedate");
							String bccontent = (String)pageContext.getAttribute("bccontent");
							System.out.println("bcno>> "+bcno);
							System.out.println("mbname>> "+mbname);
							System.out.println("gname>> "+gname);
							System.out.println("bcmakedate>> "+bcmakedate);
							System.out.println("bccontent>> "+bccontent);
						%>
						
						<comment>
							<bcno><%=bcno%></bcno>
							<mbname><%=mbname%></mbname>
							<gname><%=gname%></gname>
							<bcmakedate><%=bcmakedate%></bcmakedate>
							<bccontent><%=bccontent%></bccontent>
						</comment>	
					</c:forEach>
			</comments>	
		</c:when>
		<c:otherwise>
				
			</c:otherwise>
			
	</c:choose>
	
	
	
</body>
</html>