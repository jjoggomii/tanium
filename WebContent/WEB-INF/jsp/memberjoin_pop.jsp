<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<!-- jquery.validate api -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<!-- 다음 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
h1 {
	text-align: center;
}
</style>
<script type="text/javascript">
	// 벨리데이션

	$(document).ready(function() {
		var mode = "${mode}";
		if (mode == "insert") {
			$('#insertmember').attr('disabled', false);
		}
		$("#insertmember").click(

		function() {
			if (confirm('등록을 진행할까요?')) {
				$("#emp").validate();
				$.extend($.validator.messages, {
					required : "필수 항목입니다."
				});
				$("#emp").attr("action", "/member/insert.do");
				$("#emp").submit();
			}
		});
	});

	// 사진 이미지 미리보기
	function previewImage(targetObj, mbpicture) {
		var preview = document.getElementById(mbpicture); //div id
		var ua = window.navigator.userAgent; // ??

		//ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + mbpicture);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(mbpicture); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + mbpicture)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + mbpicture;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
			//ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + mbpicture); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + mbpicture;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '140px';
				img.style.height = '180px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ mbpicture)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + mbpicture;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}

	// 도장 이미지 미리보기
	function previewImage1(targetObj, mbstamp) {
		var preview = document.getElementById(mbstamp); //div id
		var ua = window.navigator.userAgent;

		//ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + mbstamp);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(mbstamp); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + mbstamp)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + mbstamp;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
			//ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + mbstamp); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + mbstamp;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px';
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document
							.getElementById("sfr_preview_error_" + mbstamp)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + mbstamp;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}

	// 주소 다음 API 사용
	function addrCheck() {
		alert("주소 찾기 함수 진입");
		var width = 500;
		var height = 600;
		daum.postcode.load(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#addr1').val(data.address);
					console.log("주소값 >>> : " + data.address);

					$('#addr2').val(data.buildingName);
					console.log("빌딩값  >>> : " + data.buildingName);

					mbaddr = data.address + data.buildingName;
					console.log("합친값 >>> : " + mbaddr);
					alert(mbaddr);
					document.emp.mbaddr.value = mbaddr;
					console.log(document.getElementById("mbaddr"));
					alert(document.getElementById("mbaddr"));
				}
			}).open({
				left : (window.screen.width / 2) - (width / 2),
				top : (window.screen.height / 2) - (height / 2),
			});
		});
	}
</script>
</head>
<body>
	<div style="height: auto; width: 630px; border: 2px solid;">
		<form method="POST" enctype="multipart/form-data" runat="server"
			name="emp" id="emp">
			<h1>사원등록/수정</h1>
			<hr>
			<div align="left">
				<table>
					<tr>
						<td><div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">증명사진</font>
							</div>
							<div id='mbpicture'
								style='position: relative; width: 140px; height: 180px; color: black; border: 1px solid black; dispaly: inline;'>
							</div> <input type="file" name="mbpicture" id="mbpicture"
							onchange="previewImage(this,'mbpicture')"></td>
						<td><br> <br> <br>
							<div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">사인</font>
							</div>
							<div id='mbstamp'
								style='position: relative; width: 100px; height: 100px; color: black; border: 1px solid black; dispaly: inline;'>
							</div> <input type="file" name="mbstamp" id="mbstamp"
							onchange="previewImage1(this,'mbstamp')"></td>
					</tr>
				</table>
			</div>
			<hr>
			<br>
			<Table border="1" width="625px">
				<tr>
				</tr>
				<div style="width: 100px; border: 2px solid; border-radius: 8px">
					<font size="5">사원정보</font>
				</div>
				<tr>
					<td>* 입사일자</td>
					<td><input type="date" id="mbjoindate" name="mbjoindate"
						required /></td>
					<td>퇴사일자</td>
					<td><input type="date" value="2000-01-01" id="mbresingation"
						name="mbresingation" required /></td>
				</tr>
				<tr>
					<td>* 부서</td>
					<td><select id="dname" name="dname" required>
							<option value=""></option>
							<option value="D10">개발부</option>
							<option value="D11">관리부</option>
							<option value="D12">마케팅부</option>
					</select></td>
					<td>* 직위</td>
					<td><select id="gname" name="gname" required>
							<option value=""></option>
							<option value="G20">CEO</option>
							<option value="G21">부사장</option>
							<option value="G22">이사</option>
							<option value="G23">부장</option>
							<option value="G24">차장</option>
							<option value="G25">과장</option>
							<option value="G26">대리</option>
							<option value="G27">주임</option>
							<option value="G28">사원</option>
					</select></td>
				</tr>
				<tr>
					<td>팀</td>
					<td><select id="tname" name="tname">
							<option value=""></option>
							<option value="T50">인사관리팀</option>
							<option value="T51">재무회계팀</option>
							<option value="T52">웹컨텐츠개발팀</option>
							<option value="T53">디자인개발팀</option>
							<option value="T54">고객영업팀</option>
							<option value="T55">기획&홍보팀</option>
					</select></td>
					<td>직책</td>
					<td><select id="pname" name="pname">
							<option value=""></option>
							<option value="P30">대표이사</option>
							<option value="P31">부서장</option>
							<option value="P32">팀장</option>
					</select></td>
				</tr>
				<tr>
					<td>직급</td>
					<td><select id="rname" name="rname">
							<option value=""></option>
							<option value="R40">1호봉</option>
							<option value="R41">2호봉</option>
							<option value="R42">3호봉</option>
					</select></td>
				</tr>
			</Table>

			<hr>
			<table border="1" width="625">
				<div style="width: 100px; border: 2px solid; border-radius: 8px">
					<font size="5">개인정보</font>
				</div>
				<tr>
					<td>* 사원명</td>
					<td><input type="text" id="mbname" name="mbname" required /></td>
					<td>* 성별</td>
					<td><select id="mbgender" name="mbgender" required>
							<option value=""></option>
							<option value="M">남성</option>
							<option value="F">여성</option>
					</select></td>
				</tr>
				<tr>
					<td>* 생년월일</td>
					<td><input type="date" id="mbbirth" name="mbbirth" required /></td>
					<td>* 휴대폰</td>
					<!-- function에서 밸리데이션후 합치기 합친값 >>> mbtel으로 리턴 -->
					<td><select id="tel1" name="tel1" required>
							<option value=""></option>
							<option value="010">010</option>
							<option value="011">011</option>
					</select>- <input type="text" size="2" id="tel2" name="tel2" />- <input
						type="text" size="2" id="tel3" name="tel3" required /> <input
						type="hidden" name="mbtel" id="mbtel" /></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<!-- function에서 밸리데이션후 합치기 합친값 >>> mbemail으로 리턴 -->
					<td><input type="text" size="7" id="email1" name="email1"
						required />@ <select id="email2" name="email2" required>
							<option value=""></option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
					</select> <input type="hidden" name="mbemail" id="mbemail" /></td>
				</tr>
				<tr>
					<td>* 현 주소</td>
					<!-- function에서 밸리데이션후 합치기 합친값 >>> mbaddr으로 리턴 -->
					<td><input type="text" id="addr1" name="addr1" required /> <input
						type="button" value="주소찾기" onclick="addrCheck()" /> <br> <input
						type="text" id="addr2" name="addr2" /> <input type="hidden"
						name="mbaddr" id="mbaddr" /></td>
					<td>* 우편번호</td>
					<td><input type="text" name="mbpostcode" id="mbpostcode"
						required /><font size="1"><br>* 신 우편번호</font></td>

				</tr>
				<tr>
					<td>* 취미</td>
					<td><input type="text" id="mbhobby" name="mbhobby" required /></td>
				</tr>
				<tr>
					<td>* 결혼여부</td>
					<td><select id="mbmarry" name="mbmarry" required>
							<option value=""></option>
							<option value="미혼">미혼</option>
							<option value="기혼">기혼</option>
							<option value="이혼">이혼</option>
					</select></td>
				</tr>
			</table>
			<br> &nbsp;* 표시는 필수
			기입해주세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp; <input class="submit" type="submit" value="등록/수정"
				id="insertmember" name="insertmember"> <br>
		</form>
	</div>
</body>
</html>