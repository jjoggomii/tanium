<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">

    <style>
    	
    	.top-size{
				font-size: 22px;
			    margin-right: 50px;
			    width: 120px;
			    text-align: center;
			    font-weight: bold;
    	}
    	.nav-link {
			/* 투명도 조절 0-1사이 */
			opacity: 0.5;
		}
		.nav-link:hover {
			opacity: 1;
		}
    </style>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<!-- 여기가서 찾아!!!!!! class="" -->
    <!-- write like this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <link rel="stylesheet" href="/resources/css/styles.css" />
	<nav class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3" style="background-color: #D1DDDB !important;">
	    <div class="flex-row d-flex">
	        <img src="/resources/img/tt_logo.png" style=" height: 65px; margin-left:7px; margin-top:2px;"/>
	    </div>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar" >
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="navbar-collapse collapse" id="collapsingNavbar" style="margin-left: 150px;">
	        <ul class="navbar-nav">
	            <li class="nav-item">
	                <a class="nav-link top-size" href="#" style="color : #1D6A96 !important;">전자결재</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link top-size" href="#" style="color : #1D6A96 !important;">메일</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link top-size" href="#" style="color : #1D6A96 !important;">일정</a>
	            </li>
	            <li class="nav-item active">
	                <a class="nav-link top-size" href="/nt/listNotice.tan" style="color : #1D6A96 !important;">게시판</a>
	            </li>
	             <li class="nav-item">
	                <a class="nav-link top-size" href="#" style="color : #1D6A96 !important;">웹하드</a>
	            </li>
	            <c:if test="">
	            <li class="nav-item">
	                <a class="nav-link top-size" href="#" style="color : #1D6A96 !important;">인사관리</a>
	            </li>
	            </c:if>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="#myAlert" data-toggle="collapse">Alert</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">About</a>
	            </li>
	        </ul>
	    </div>
	</nav>

	<!--scripts loaded here-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/resources/js/scripts.js"></script>