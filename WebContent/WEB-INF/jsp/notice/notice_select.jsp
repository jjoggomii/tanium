<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세조회</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<style type = "text/css">
			
			
			ul{
				list-style : none;
			}
			
			#container {
			  	padding: 30px 20px;
			}
			
			
			#comment_write{
				padding: 13px 8px 0px 9px;
			    margin-bottom: -12px;
			}
			
			#comment_write label {
				display : inline-block;
				width : 80px;
				font-size : 14px;
				font-weight:bold;
				margin-bottom : 10px;
			}
			
			#comment_write input[type='text'], #comment_write textarea{
				border : 1px solid #ccc;
				vertical-align : middle;
				padding : 3px 10px;
				font-size: 12px;
				line-height : 150%;
				
			}
			
			#comment_write textarea{
				width:380px;
				height : 90px;
			}
			
			.comment_item {
				font-size: 13px;
				color: #333;
				padding: 15px;
				border-bottom: 1px dotted #ccc;
				line-height: 150%;
			}
			
			.comment_item .writer {
				color: #555;
				line-height: 200%;
			}
			
			.comment_item .writer input {
				vertical-align: middle;
			}
			
			.comment_item .writer .name {
				color: #222;
				font-weight: bold;
				font-size: 14px;
			}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#ttleftbar').append( '<li class="nav-item"><a class="nav-link listyle" href="/nt/listNotice.tan" >● 공지사항 게시판</a></li>');
		
		$("#list").click(function() {
			$("#insertForm").attr("action", "listNotice.tan");
			$("#insertForm").submit();
		});
		
		$("[name='file12']").click(function(){
		    
		    var atno = $(this).data('num');
		    
		    location.href = "/nt/downloadFile.tan?atno=" +atno;
	
			return false;
		 });  

		
		//브라우저 처음 띄우면 getCommentList() 진입
		getCommentList();
		
		//저장하기 누르면 ->comment_form이 submit 그럼 function run
		$("#comment_form").submit(function(){
			
			if(!$("#bccontent").val()){
				alert("댓글 내용을 입력하세요.");
				$("#bccontent").focus();
				return false;
			}
			
			//작성일시 만들기
			var date = new Date();
			var yy = date.getFullYear();
			var mm = date.getMonth()+1;
			var dd = date.getDate();
			var hh = date.getHours();
			var mi = date.getMinutes();
			var ss = date.getSeconds();
			
			//자리수 보정
			if(mm <10) { mm = "0"+mm; };
			if(dd <10) { dd = "0"+dd; };
			if(hh <10) { hh = "0"+hh; };
			if(mi <10) { mi = "0"+mi; };
			if(ss <10) { ss = "0"+ss; };
			
			//오늘 날짜값 생성
			var today = yy+"-"+mm+"-"+dd+" "+hh+":"+mi+":"+ss;
			
			$('.c-content').keyup(function(){
	            cut_300(this);
	        });

	        $('.sb').click(function(){
	            if(getTextLength($('.c-content').val()) > 300){
	                alert("문자는 300바이트 이하로 적어 주세요.");
	                return false;
	            }else{
	                //alert("문자가 300바이트 이하입니다.");
	            }
	        });
			
			var url = "/ct/insertComment.tan";
			alert("url >>> : " + url);
			alert("insert today >>> : " + today);
			$("#bcmakedate_").val(today);
			/* var cname = document.getElementById("user_name").value;
			alert("cname >>> " + cname); */
			var mbno = document.getElementById("mbno").value;
			var bccontent = document.getElementById("bccontent").value;
			var ntno =document.getElementById("ntno").value;
			var bcmakedate =document.getElementById("bcmakedate_").value;
			//오브젝트
			alert("댓글 작성 후 넘겨준  mbno>>> " + mbno);
			alert("댓글 작성 후 넘겨준 bccontent>>> " + bccontent);
			alert("댓글 작성 후 넘겨준 ntno>>> " + ntno);
			alert("댓글 작성 후 넘겨준 bcmakedate>>> " + bcmakedate);
			
			
			$.get(url,{"ntno":ntno,"mbno":mbno,"bccontent":bccontent,"bcmakedate":bcmakedate},
					function(data){
					alert("data" + data);
					
			});
			
/* 			getSelectList(); */
			
			// 입력내용 지우기
			$("#bccontent").val("");
			
			
			
			return  false;
		});
		
		//삭제버튼을 클릭 시 동작을 "미리"지정
		$(document).on("click",".delete_btn",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				var url = "/pskWebExam/comment/delete.jsp";
				var delCno = $(this).siblings(".cno").text();
					alert("delcno>> '" + delCno+"'");
				var isud = "D";
				
				$.get(url,{"isud":isud, "cno":delCno},
					function(data){
						alert("cno>>>>>>>>> '" + delCno+"'" );
						alert("data~>" + data);
						
					
				});
				
				$(this).parents(".comment_item").remove();
			}
		});
		
	});
	

	
			function getSelectList(){
				alert("getSelectList() >>>");
				
				var url2 = "/ct/selectComment.tan";
				var mbname = "";
				var gname = "";
				var bccontent = "";
				var bcmakedate = "";
				
				$.get(url2,{"ntno":ntno},
						function(data){
					alert("data ~> " + data);
					console.log($(data).find('mbname').text());
					console.log($(data).find('bccontent').length);
					
					//내가 지정한 xml 태그 이름으로 가져오는거
					if($(data).find('comment').length>0){
						$(data).find('comment').each(function(){
							//cname을 찾아서 초기화
							/* bcno = $(this).find('bcno').text(); */
							mbname = $(this).find('mbname').text();
							gname = $(this).find('gname').text();
							bccontent = $(this).find('bccontent').text();
							bcmakedate = $(this).find('bcmakedate').text();
							
							/* console.log("bcno >>" +bcno); */
							console.log("mbname >>"+mbname);
							console.log("gname >>"+gname);
							console.log("bccontent >>" +bccontent);
							console.log("bcmakedate >>" +bcmakedate);
							
							/* document.getElementById('bcno_').value = bcno; */
							document.getElementById('cname_').value = mbname;
							document.getElementById('gname_').value = gname;
							document.getElementById('bccontent_').value = bccontent;
							document.getElementById('bcmakedate_').value = bcmakedate;
							
							append();		
					
								});
							}
					
				});
				
			}
				
			function getCommentList(){
				alert("getCommentList() >>> 진입");
			
				var url1 = "/ct/listComment.tan";
				var ntno = $("#ntno").val();
				alert("ntno >>> : " + ntno);
				/* var bcno = ""; */
				var mbname = "";
				var gname = "";
				var bccontent = "";
				var bcmakedate = "";
			
				
				$.get(url1,{"ntno":ntno},
					function(data){
						alert("data ~> " + data);
						console.log($(data).find('mbname').text());
						console.log($(data).find('bccontent').length);
						//내가 지정한 xml 태그 이름으로 가져오는거
						if($(data).find('bccontent').length>0){
							$(data).find('comment').each(function(){
								//cname을 찾아서 초기화
								/* bcno = $(this).find('bcno').text(); */
								mbname = $(this).find('mbname').text();
								gname = $(this).find('gname').text();
								bccontent = $(this).find('bccontent').text();
								bcmakedate = $(this).find('bcmakedate').text();
								
								/* console.log("bcno >>" +bcno); */
								console.log("mbname >>"+mbname);
								console.log("gname >>"+gname);
								console.log("bccontent >>" +bccontent);
								console.log("bcmakedate >>" +bcmakedate);
								
								/* document.getElementById('bcno_').value = bcno; */
								document.getElementById('cname_').value = mbname;
								document.getElementById('gname_').value = gname;
								document.getElementById('bccontent_').value = bccontent;
								document.getElementById('bcmakedate_').value = bcmakedate;
								
								append();
								
							});
						}
						
				});
			
			}
			
			function append(){
				var new_li = $("<li>");
				new_li.addClass("comment_item");
				
				// 작성자 정보가 지정될 <p>태그
				var writer_p = $("<p>");
				writer_p.addClass("writer");
				
				/* var cno_span = $("<span>");
				cno_span.addClass("cno");
				cno_span.html($("#cno_").val()+ " "); */
				
				//작성자 직위
				var gname_span = $("<span>");
				gname_span.addClass("gname");
				gname_span.html($("#gname_").val()+ " ");
				
				// 작성자 정보의 이름
				var name_span = $("<span>");
				name_span.addClass("name");
				name_span.html($("#cname_").val());
				
				// 작성일시
				var date_span = $("<span>");
				date_span.html(" / " + $("#bcmakedate_").val() + " ");
				
				// 삭제하기 버튼
				var del_input = $("<input>");
				del_input.attr({
					"type" : "button",
					"value" : "삭제",
					"style" : "font-size: 11px; height: 28px;",
					"class" : "btn btn-outline-secondary"
						    
				});
				del_input.addClass("delete_btn");
				
				// 내용
				var content_p = $("<p>");
				content_p.html($("#bccontent_").val());
			
				
				writer_p.append(name_span).append(gname_span).append(date_span).append(del_input);
				new_li.append(writer_p).append(content_p);
				$("#comment_list").append(new_li);
			}
			
			function getTextLength(str){
				var len = 0;
				for(var i = 0; i<str.length; i++){
					if(escape(str.charAt(i)).length == 6){
						length++;
					}
					len++;
				}
				return len;
			}
			
			function cut_300(obj){
			    var text = $(obj).val();
			    var leng = text.length;
			    while(getTextLength(text) > 300){
			        leng--;
			        text = text.substring(0, leng);
			    }
			    $(obj).val(text);
			    $('.bytes').text(getTextLength(text));
			}


</script>

</head>
<style>

</style>
<body>
	<jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false" />
	<div class="container-fluid" id="main">

		<div class="row row-offcanvas row-offcanvas-left">
			<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false" />

			<form id="insertForm" name="insertForm" method="post" style="width: 80%; margin-left:285px;" >
				<div class="col-lg-12" style="margin-top: 10%;margin-left: 2.5%;">
					<h1>&nbsp;&nbsp;공지사항</h1>
					<div style="margin-left: 87.7%;margin-bottom: 10px;">
					<table>
						<tr>
						<c:if test="${sessionScope.logininfo.tname =='인사관리'}">
							<td><input type=button value="수정" id="edit" class="btn btn-outline-secondary"> </td>
								<td>	<input type=button value="삭제" id="del" class="btn btn-outline-secondary"> </td>
						</c:if>
									<td><input type=button value="목록" id="list" class="btn btn-outline-secondary"></td>
						</tr>
					</table>
					</div>
					<div class="card mb-3" style="width: 100%;">
						<div class="card-header">
							<table>
								<c:forEach items="${ntSelect}" var="list">
									<tr>
										<td><h4>${list.ntsubject}</h4></td>
									</tr>
									<tr>
										<td>${list.ntwriter}&nbsp;${list.gname}</td>
									</tr>
									<tr>
										<td>${list.ntmakedate}</td>
									</tr>

								</c:forEach>
							</table>
						</div>
						<div class="card-body">
							<p class="card-text" />
							<table>
								<c:forEach items="${ntSelect}" var="list">
									<tr>
										<td>${list.ntcontent}</td>
									</tr>
								</c:forEach>
							</table>
							<c:if test="${not empty atList}">
							<div style="margin-top: 120px;" class="list-group">
								<table style="border: 1px solid rgba(0, 0, 0, .125);">
									<tr style="border: 1px solid rgba(0, 0, 0, .125);">
										<td rowspan="${atSize+1}" style="border: 1px solid rgba(0, 0, 0, .125); width: 10%;text-align: center;">첨부파일</td>
									<c:forEach items="${atList}"  begin="0" end="${atSize}" var="atList">
										<tr>
										<td style="border: 1px solid rgba(0, 0, 0, .125);">
										<a href = ""  name="file12" data-num="${atList.atno}" style="margin-left: 2%;" >${atList.atfilename }</a></td>
										</tr>
									</c:forEach>
										
									</tr>
								</table>
							</div>
							</c:if>
						</div>
					</div>
				</div>
			</form>
				<div id = "container" style="margin-left: 17.8%; width: 78.4%;" class="card mb-3 fc fc-unthemed fc-ltr">
			<div id = "comment_write">
			<ul id = "comment_list" style="margin-left: -60px; margin-top: -16px;"></ul>
				<form id = "comment_form" method= "POST">
			
					<div>
						<label for = "comment">${sessionScope.logininfo.mbname}</label>
						<input type = "text" name = "bccontent" id="bccontent" class= "c-content" maxlength="300" style="width: 87%;" />
						<c:forEach items="${ntSelect}" var="list">
						<input type = "hidden" name = "ntno" id ="ntno" value="${list.ntno}"/>
						</c:forEach>
						<input type = "hidden" name =	"mbno" id="mbno" value="${sessionScope.logininfo.mbno}" />
						<input type = "hidden" name = "cname_" id ="cname_" value="${sessionScope.logininfo.mbname}"/>
						<input type = "hidden" name = "gname_" id ="gname_"/>
						<input type = "hidden" name = "bccontent_" id ="bccontent_"/>
						<input type = "hidden" name = "bcmakedate" id ="bcmakedate_"/>
						<input type = "hidden" name = "bcno" id ="bcno_"/>
						
						<input type = "submit" value="댓글 작성" class="sb btn btn-outline-secondary" />
					</div>
				</form>
				
			</div>
		</div>
		</div>
	</div>




</body>
</html>




