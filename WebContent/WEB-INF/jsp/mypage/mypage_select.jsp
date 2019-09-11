<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Page</title>
	<style>
		.td{width: 300px;}
	</style>
	
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
</script>


	<script type="text/javascript">
		 
		$(document).ready(function(){
			$("#edit").click(function(){
				var mbno = $('#mbno').val();
				alert(mbno);
				$('#mbname').attr('disabled',false).css('background-color','white');
				$('#mbtel').attr('disabled',false).css('background-color','white');
				$('#mbaddr').attr('disabled',false).css('background-color','white');
				$('#mbhobby').attr('disabled',false).css('background-color','white');
				$('#mbmarry').attr('disabled',false).css('background-color','white');
				$('#findaddr').show();
				$('#mpsubmit').show();
				$('#mpcancel').show();
			});
			 $("#findaddr").click(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("mbpostcode").value = data.zonecode;
		                document.getElementById("mbaddr").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("mbaddr").focus();
		            }
		        }).open();
			});
			 var mpimg = $('#usersrc').val();
 			 $('#mpimg').append('<img src =" '+mpimg+ ' " style="width:100%; height:100%;">');
			 
 			$("#mpsubmit").click(function() {
 				alert(" mpsubmit >>> ");
 				$("#myForm").attr("action", "/mp/updateMp.tan");
 				$("#myForm").submit(); 
 			});
 			
 			$("#mpcancel").click(function() {
 				alert(" mpcancel >>> ");
 				$("#myForm").attr("action", "/mp/selectMp.tan");
 				$("#myForm").submit(); 
 			});
 			 
		});
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false"/>

<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
   		<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false"/>
      	<div class="col main pt-5 mt-3" style="margin-left: 266px;">
			<form id="myForm" name="myForm" method="post" > 

				<div class="col-lg-12" style="margin-top: 3%; ">
					<h3>&nbsp;&nbsp;My Page</h3>
					<h4>&nbsp;&nbsp;&nbsp;내 정보 조회</h4>
					
				<div id="mpimg" style=" border:1px solid; background-color: burlywood;width: 200px;height: 212px;position: relative;top: 65px;left: 16px;">
					</div>
				<div style="margin-left: 250px;margin-top: -210px;">
				<div style="margin-left: 184px; margin-bottom: 12px;">
					<input type ="button" value="비밀번호 변경" class="btn btn-outline-secondary"/>
					<input type ="button" value="내 정보 수정" id="edit" class="btn btn-outline-secondary"/>
					</div>
						<c:forEach items="${list}" var="list">
							<input type="hidden" value="${list.mbpicture}" id="usersrc">
							<table >
							
							<colgroup>
								<col width="20px">
								<col width="20px">
								<col width="20px">					
								<col width="5px">			
							</colgroup>
							
								<tr>
									<td class="td" colspan="2">
										사원번호 <input type="text" value="${list.mbno}" name="mbno" id="mbno"class="card mb-3"  style="background-color: lightgray;" readonly>
									</td>
									<td>
										입사일자 <input type="text" value="${list.mbjoindate}" name="mbjoindate" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td></td>
									
								</tr>
								<tr>
									<td class="td"  colspan="2" >
										이     름 <input type="text" value="${list.mbname}" name="mbname" id="mbname" class="card mb-3"  style="background-color: lightgray;" disabled>
									</td>
									<td>
									<c:set var="mbgender" value="${list.mbgender}"/>
									<c:choose>
									<c:when test="${mbgender eq 'F'}"><c:set var="mbgender" value="여성"/></c:when>
									<c:when test="${mbgender eq 'M'}"><c:set var="mbgender" value="남성"/></c:when>
									</c:choose>
										성     별 <input type="text" value="${mbgender}" name="mbgender" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td></td>
								</tr>
								<tr>
									<td class="td"  colspan="2">
										휴  대  폰 <input type="text" value="${list.mbtel}" name="mbtel" id="mbtel" class="card mb-3"  style="background-color: lightgray;  "disabled>
									</td>
									<td>
										생년월일 <input type="text" value="${list.mbbirth}" name="mbbirth" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td></td>
								</tr>
								<tr>
									<td class="td"  colspan="2" >
										부     서 <input type="text" value="${list.dname}" name="dname" class="card mb-3"  style="background-color: lightgray;  "disabled>
									</td>
									<td>
										        팀 <input type="text" value="${list.tname}" name="tname" class="card mb-3"  style="background-color: lightgray;  "disabled>
									</td>
									<td></td>
								</tr>
								<tr>
									<td class="td"  colspan="2">
										직     위 <input type="text" value="${list.gname}" name="gname" class="card mb-3"  style="background-color: lightgray;  "disabled>
									</td>
									<td>
									<c:set var="pname" value="${list.pname}"/>
									<c:choose>
									<c:when test="${pname eq 'NULL'}"><c:set var="pname" value=" "/></c:when>
									</c:choose>
										직     책 <input type="text" value="${pname}" name="pname" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td></td>
								</tr>
								<tr>
									<td class="td" colspan="3">
										이  메  일 <input type="text" value="${list.mbemail}" name="mbemail" id="mbemail" class="card mb-3"  style="background-color: lightgray; width:91%; "disabled>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>	
										현  주  소 &nbsp;<input type="text" value="${list.mbpostcode}" name="mbpostcode" id="mbpostcode" class="card mb-3"  id="mbpostcode" style="background-color: lightgray; width:90%  " readonly>
									</td>
									<td  colspan="2">
											&nbsp; <input type="text" value="${list.mbaddr}"name="mbaddr" id="mbaddr" class="card mb-3"  style="background-color: lightgray;width: 88%; "disabled>
									</td>
									<td>
									&nbsp; <input type ="button" value="주소찾기" id="findaddr" style="display: none" class="btn btn-outline-secondary"/>
									</td>
								</tr>
								<tr>
									<td class="td"  colspan="2">
										취     미 <input type="text" value="${list.mbhobby}" name="mbhobby" id="mbhobby" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td>
										결혼여부 <input type="text" value="${list.mbmarry}" name="mbmarry" id="mbmarry" class="card mb-3"  style="background-color: lightgray; "disabled>
									</td>
									<td></td>
								</tr>
							</table>
							<div  style="margin-left: 140px; margin-top: 12px;">
								<input type="button" id = "mpsubmit" value="저장"  style="display: none" class="btn btn-outline-secondary"/>&nbsp;&nbsp;
								<input type="button" id = "mpcancel" value="취소"  style="display: none" class="btn btn-outline-secondary"/>
							</div>
					
						</c:forEach>
			             
	              
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