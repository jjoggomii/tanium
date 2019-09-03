<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Page</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/top.jsp" flush="false"/>

<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
   		<jsp:include page="/WEB-INF/jsp/common/left.jsp" flush="false"/>
      	<div class="col main pt-5 mt-3">
			<form id="myForm" name="myForm" method="post" > 
				<div class="col-lg-12" style="margin-top: 2%; ">
					<h3>&nbsp;&nbsp;My Page</h3>
					<h4>&nbsp;&nbsp;&nbsp;내 정보 조회</h4>
						<c:forEach items="${list}" var="list">
						<h3>${list.mbno}</h3>
						</c:forEach>
			              <div class="col-lg-9 col-md-8">
			                
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