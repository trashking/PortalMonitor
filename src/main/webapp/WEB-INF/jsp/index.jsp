<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/favicon.ico"  type="image/x-icon" rel="shortcut icon" />	
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" rel="stylesheet">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

	<!-- Wrap all page content here -->
	<div id="wrap">
		<!-- navigation -->
		<jsp:include page="include/navigation.jsp" flush="false" />

		<!-- Begin page content -->
		<div class="container">

			<div class="jumbotron" style="margin-top:49px;margin-bottom:49px">
				<div class="container">
					<h1>Portal Monitor Tool</h1>
					<p><a href="http://www.webpagetest.org/" target="_blank">http://www.webpagetest.org/</a> 의 Test Result 중 특정 정보를 쉽게 가져올 수 있다.</p>
				</div>
			</div>

			<div class="row placeholder">
				<div class="col-xs-6 col-md-4 placeholder text-center">
					<img src="images/bi_nate.png" width="114" height="114" class="img-circle" style="margin-bottom:30px" />
					<a href="./portalViewList.sk?pCode=0" class="btn btn-default btn-block">NATE RESULT</a>
					<a href="./portalViewList.sk?pCode=4" class="btn btn-default btn-block">mNATE RESULT</a>
					<a href="./portalViewList.sk?pCode=5" class="btn btn-default btn-block">mNATE News RESULT</a>
				</div>
				<div class="col-xs-6 col-md-4 placeholder text-center">
					<img src="images/bi_daum.png" width="114" height="114" class="img-circle" style="margin-bottom:30px" />
					<a href="./portalViewList.sk?pCode=1" class="btn btn-default btn-block">DAUM RESULT</a>
				</div>
				<div class="col-xs-6 col-md-4 placeholder text-center">
					<img src="images/bi_naver.png" width="114" height="114" class="img-circle" style="margin-bottom:30px" />
					<a href="./portalViewList.sk?pCode=2" class="btn btn-default btn-block">NAVER RESULT</a>
				</div>
			</div>	
		</div>

	</div>

	<!-- footer -->
	<%@ include file="include/footer.jsp" %>

</body>
</html>