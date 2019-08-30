<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="boardTit">
		<h3>글상세</h3>
	</div>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" name="b_num" value="${detail.b_num}" /> <input
			type="hidden" name="b_file" id="b_file" value="${detail.b_file}" />
	</form>
	<%-- ========= 비밀번호 확인 버튼 및 버튼 추가 시작 ====== --%>
	<table id="boardPwdBut">
		<tr>

			<td id="btd1">
				<div id="pwdChk">
					<form name="f_pwd" id="f_pwd">
						<input type="hidden" name="b_num" id="b_num"
							value="${detail.b_num}" /> <label for="b_pwd" id="l_pwd">비밀번호
							: </label> <input type="password" name="b_pwd" id="b_pwd" /> <input
							type="button" id="pwdBut" value="확인" /> <span id="msg"></span>
					</form>
				</div>
			</td>
			<td id="btd2"><input type="button" value="수정" id="updateForm">
				<input type="button" value="삭제" id="boardDelete"> <input
				type="button" value="목록" id="boardList"></td>
		</tr>
	</table>
	<%-- =========== 비밀번호 확인 버튼 및 버튼 추가 종료 ====== --%>
	<%-- =============== 상세 정보 보여주기 시작 ============ --%>
	<div id="boardDetail">
		<table>
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="ac">작성자</td>
					<td>${detail.b_name}</td>
					<td class="ac">작성일</td>
					<td>${detail.b_date}</td>
				</tr>
				<tr>
					<td class="ac">제목</td>
					<td colspan="3">${detail.b_title}</td>
				</tr>
				<tr class="ctr">
					<td class="ac">내용</td>
					<td colspan="3">${detail.b_content}</td>
				</tr>
				<tr class="ctr">
					<td class="ac">첨부파일 파일</td>
					<td colspan="3"><img id="fileImage" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>