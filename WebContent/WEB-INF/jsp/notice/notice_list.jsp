<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>공지사항</title>
    
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"> 	
	
		$(document).ready(function() {
			/* $('.abcdefg').empty() */
			$('#ttleftbar').append( '<li class="nav-item"><a class="nav-link listyle" href="/nt/listNotice.tan" >● 공지사항 게시판</a></li>');
			
			
			$("#addNt").click(function() {
				alert("insertPage() >>> ");
				$("#noticeForm").attr("action", "goInsertPage.tan");
				$("#noticeForm").submit();
			});
			
			$(".goDetail").click(function(){
				
				alert("goDetail >>> ");
				var ntno =  $(this).parents("tr").attr("data-num");  
				alert("ntno >>> : " + ntno);
				$("#listntno").val(ntno);     
				$("#noticeForm").attr({      
												 "method":"post"      
												,"action":"selectNotice.tan"     
											});   
				$("#noticeForm").submit();
			});
		});

		function goListPage() {
			alert("goListPage() >>> ");
			$("#noticeForm").attr("action", "listNotice.tan");
			$("#noticeForm").submit();
		}

		$(function() {
			$(".pbutton").click(function() {
				$('[name=pResult]').val($(this).val());
				$("#noticeForm").attr("action", "listNotice.tan");
				$("#noticeForm").submit();
			})
		});
	</script>
  </head>
 <body >
 <jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false"/>

<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
   		<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false"/>
      	<div class="col main pt-5 mt-3" style="margin-left: 266px;">
			<form id="noticeForm" name="noticeForm" method="post" style="width: 100%;" > 
				<div class="col-lg-12" style="margin-top: 5%;margin-left: 1.5%;">
					<h1>&nbsp;&nbsp;공지사항</h1>
					<input type="hidden" name = "pResult" value="1">
			              <div class="col-lg-9 col-md-8" style="margin-top: 3%;">
			                  <div class="table-responsive" style=" width: 130%;">
							<table class="table table-striped" style=" text-align:center;">
								<thead class="thead-inverse">
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
				
				
					         <c:set var="index" value="${index}" />
								<!-- ${size}  -->
							<c:forEach items="${ntList}" var="row" varStatus="status">
					           <!-- <c:out value="${status.index}" />  --> 
					              <tr data-num="${row.ntno}"> 
					              <td>${index - status.index}</td> 
					              <td><span class = "goDetail">${row.ntsubject}</span></td>
					              <td>${row.ntwriter}</td>
					              <td>${row.ntmakedate}</td>
					              <td>${row.ntviews}</td>
					              </tr>
				            </c:forEach>
						</tbody>
									
						<tfoot>
						
							 <tr>
								 	<td colspan="4" align="center">
					            	<c:if test="${sss ne 's'}"><button class="pbutton btn btn-outline-secondary" value="${sPage -1}">이전 </button></c:if>
								 	<c:forEach  var="i" begin="${sPage}" end="${ePage}">
					            	<input type = "button" class="pbutton btn btn-outline-secondary" value="${i}">
					            	</c:forEach>
					            	<c:if test="${sss ne 'e'}"><button class="pbutton btn btn-outline-secondary" value="${ePage +1}"> 다음 </button></c:if>
					            	</td>
					            	<c:if test="${sessionScope.logininfo.tname =='인사관리'}">
								<td><input type=button class="btn btn-primary"  value="글쓰기" id="addNt"></td>
									</c:if>
							</tr>
						</tfoot>
					</table>
					<input type="hidden" name="listntno" id="listntno"> 
	                  </div>
	              </div>
              </div>
			</form>
          </div>
          <!--/row-->
      </div>
         <!--/main col-->
  </div>
    
  </body>
</html>