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
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").click(function() {
			$("#insertForm").attr("action", "listNotice.tan");
			$("#insertForm").submit();
		});
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false" />
	<div class="container-fluid" id="main">

		<div class="row row-offcanvas row-offcanvas-left">
			<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false" />

			<form id="insertForm" name="insertForm" method="post">
				<div class="col-lg-12" style="margin-top: 30%; margin-left: 4%;">
					<h3>공지사항</h3>
					<table>
						<tr>
							<td><input type=button value="수정" id="edit"> <input
								type=button value="삭제" id='"del'> <input type=button
								value="목록" id="list"></td>
						</tr>
					</table>
					<div class="card mb-3" style="width: 200%;">
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
						</div>
					</div>

					<!-- Commnet -->

					<div id="container">
						<div id="comment_write">

							<div>
								<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE" value="I" />
								<input type="hidden" name="cname_" id="cname_" /> <input
									type="hidden" name="cmemo_" id="cmemo_" /> <input
									type="hidden" name="ctoday_" id="ctoday_" /> <input
									type="hidden" name="cno_" id="cno_" />
							</div>
							<div>
								<table>
									<tr>
										<td colspan="4"><input type="text" id="ntcomment" name="ntcomment"
													class="ntcomment" style="width: 100%;" maxlength="100" /></td>
								
										<td><input type="submit" value="댓글 작성" class="sb" /></td>
									</tr>
								
								</table>
							</div>


							<ul id="comment_list"></ul>

						</div>


					</div>
				</div>
			</form>




		</div>


	</div>




</body>
</html>




