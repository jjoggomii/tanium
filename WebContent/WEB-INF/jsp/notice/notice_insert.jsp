<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글쓰기</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="../dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jquery.validate api -->
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> -->

<script type="text/javascript">
	var oEditors = [];

	$(function() {
		$('#ttleftbar').append( '<li class="nav-item"><a class="nav-link listyle" href="/nt/listNotice.tan" >● 공지사항 게시판</a></li>');
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ntcontent", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "../dist/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음),글씨체 포인트,정렬,색상등등
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["ntcontent"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//저장버튼 클릭시 form 전송	
		$("#ntsubmit").click(function() {
			
			alert(">>>>>>>>>>>");
			
	/* 		$("#insertForm").validate(); */
			
			oEditors.getById["ntcontent"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#insertForm").attr("action", "insertNotice.tan");
			$("#insertForm").submit(); 
		});

		$("#back").click(function() {
			$("#insertForm").attr("action", "listNotice.tan");
			$("#insertForm").submit();
		});
		
	});

	/* $(document).ready(function(){
		$("#ntsubmit").click(function() {
			alert(">>>>>>>>>>>");
			$("#insertForm").attr("action", "insertNotice.tan");
			$("#insertForm").submit();
		});

		$("#back").click(function() {
			$("#insertForm").attr("action", "listNotice.tan");
			$("#insertForm").submit();
		});
	}); */
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false" />
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left" >
			<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false" />
			<form id="insertForm" name="insertForm" method="post"  enctype="multipart/form-data" 
				style="margin-left: 266px;">
				<div class="col-lg-12" style="margin-top: 25%; margin-left: 4%;">
					<h3>공지사항 글쓰기</h3>
					<div class="card mb-3" style="width: 200%;">
						<div class="card-header">
							<table>
								<tr>
									<td align="center">제목 : &nbsp;</td>
									<td width="92%"><input type="text" id="ntsubject"
										name="ntsubject" style="width: 100%;" maxlength="100"  /></td>
									<!-- <td><input type="checkbox" id= "nttop" name="nttop" value="Y"/>공지로 등록</td> -->
								</tr>
							</table>
						</div>
						<div class="card-body">
							<p class="card-text">
								<textarea cols="50" rows="13" id=ntcontent name="ntcontent"
									style="width: 100%;" ></textarea>
							</p>
						</div>

						<div class="list-group"
							style="position: relative; width: 94%; margin-left: 3.1%; margin-bottom: 2.7%;">
						
								<table style="border: 1px solid rgba(0, 0, 0, .125);">
									<tr style="border: 1px solid rgba(0, 0, 0, .125);">
										<td style="border: 1px solid rgba(0, 0, 0, .125);">첨부파일</td>
										<td><input type="file" name="file" id="file" multiple/></td>
										<td>
											<input type="button" value="삭제하기"
											class="btn btn-outline-secondary"></td>
									</tr>
									
								</table>
					
						</div>
					</div>
					<table>
						<tr>
							<td><input type="submit" class="btn btn-primary" value="작성하기"
								id="ntsubmit" /></td>
							<td><input type="button" class="btn btn-primary" value="취소"
								id="back" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>