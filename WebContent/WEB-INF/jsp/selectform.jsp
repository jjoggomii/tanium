<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
p {
	margin: 20px 0px;
}

table {
	border: 2px solid black;
	width: 650px;
	height: auto;
	margin: auto;
	text-align: center;
}

div {
	width: 654px;
	height: auto;
	margin: auto;
	text-align: center;
}

div.container {
	width: 380px;
	margin-left: auto;
	margin-right: auto;
}

.scrolltbody {
	display: block;
	width: 650px;
	border-collapse: collapse;
	border: 2px solid #000;
}

.scrolltbody th {
	border: 1px solid #000;
	background: pink;
}

.scrolltbody td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	height: 200px;
	overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) {
	width: 40px;
}

.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) {
	width: 80px;
}

.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) {
	width: 80px;
}

.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) {
	width: 70px;
}

.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) {
	width: 80px;
}

.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) {
	width: 300px;
}

.scrolltbody th:last-child {
	width: 300px;
}

.scrolltbody td:last-child {
	width: calc(300px - 15px);
}
</style>
<script type="text/javascript">
	function textsearch(){
		alert("search 함수 시작 >>> : ");
		console.log("search 함수 시작 >>> : ");
		$("#selectbox").val("");
		$("#search").val("");
		
	}

</script>
</head>
<body id="body">
	<form id = "select" name = "select" method = "POST">
		<input type = "hidden" name = "mbno" id = "mbno"/>
	</form><br><br>
		<table>
			<tr>
				<td>사원목록</td>
			</tr>
		</table>
		<table class='scrolltbody'>
			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>직위</th>
					<th>부서</th>
					<th>연락처</th>
				</tr>
			</thead>
			<tbody>
				<c:if test = "${empty aa} ">
					<tr>
						<td>조회 하실 사원을 입력해주세요</td>
					</tr>
				</c:if>
				<c:forEach items = "${aa }" var = "list">
				<tr>
					<td><input type="checkbox" /></td>
					<td>{list.mbno}</td>
					<td>{list.mbname}<a href="#"></a></td>
					<td>{list.gname}</td>
					<td>{list.dname}</td>
					<td>{list.mbtel}</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			<form id = "searchForm" name = "searchForm" method = "POST">
				<br> <br>
				<div style="width: 650px; text-align: right;">
				<select id = "selectbox" name = "selectbox">
					<option value = "mbname">사원명</option>
					<option value = "mbno">사원번호</option>
					<option value = "dname">부서명</option>
				</select>
					<input type = "test" id = "search" name = "search" />
					<input type = "button" value = "검색" onclick = "textsearch()"/>
				</div>
			</form>
		<div class="container">
			<div class="row">
				<div class="col">
					<p>
						<strong></strong>
					</p>
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>