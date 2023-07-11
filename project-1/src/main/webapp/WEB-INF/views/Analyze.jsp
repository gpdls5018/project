<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
</style>
<body>
	<div class="container mt-5">
		<div class="my-title d-flex effect-custom-font justify-content-between m-auto" style="width:80%;height:200px;">
			<div class="mt-5" style="font-size:40px;"><span style="background-color:#ffdcdc;">홍성민</span>님의 <br>영양제 분석 리포트</div>
			<div class="mt-3"><img src="<c:url value="/resources/images/thumbnail_img/No_IMG.jpeg"/>" style="width:200px;height:200px;border-radius:20px;"></div>
		</div>
		<div class="m-5" style="height:3px;background-color:#ccc"></div>
		<div class="m-5">
			<div class="btn btn-warning effect-custom-font" style="border-radius:15px;width:100%;" onclick="location.href='/AnalyzeNewReport.do'">새로 분석하기</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>