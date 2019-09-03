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
			$("#addNt").click(function() {
				alert("insertPage() >>> ");
				$("#noticeForm").attr("action", "goInsertPage.tan");
				$("#noticeForm").submit();
			});
			
			$(".goDetail").click(function(){
				
				alert("goDetail >>> ");
				var ntno =  $(this).parents("tr").attr("data-num");      
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
      	<div class="col main pt-5 mt-3">
			<form id="noticeForm" name="noticeForm" method="post" > 
				<div class="col-lg-12" style="margin-top: 2%; ">
					<h3>&nbsp;&nbsp;공지사항</h3>
					<input type="hidden" name = "pResult" value="1">
			              <div class="col-lg-9 col-md-8">
			                  <div class="table-responsive">
							<table class="table table-striped">
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
								 	<c:forEach  var="i" begin="1" end="${paging}">
					            	<input type = "button" class="pbutton" value="${i}">
					            	</c:forEach>
					            	</td>
								<td><input type=button class="btn btn-primary"  value="글쓰기" id="addNt"></td>
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



    <!--scripts loaded here-->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script src="js/scripts.js"></script>
  </body>
</html>