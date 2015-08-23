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
		<jsp:include page="../include/navigation.jsp" flush="false" />

		<!-- Begin page content -->
		<div class="container">
		
			<h1 class="page-header">
				View Result
			</h1>
			
			<ul class="nav nav-tabs" style="margin-bottom:30px">
				<c:choose>
					<c:when test="${pCode == 0 }">
						<li class="active"><a href="#">NATE</a></li>
						<li><a href="./portalViewList.sk?pCode=1">DAUM</a></li>
						<li><a href="./portalViewList.sk?pCode=2">NAVER</a></li>
						<li><a href="./portalViewList.sk?pCode=4">mNATE</a></li>
						<li><a href="./portalViewList.sk?pCode=5">mNATE News</a></li>
					</c:when>
					<c:when test="${pCode == 1 }">
						<li><a href="./portalViewList.sk?pCode=0">NATE</a></li>
						<li class="active"><a href="#">DAUM</a></li>
						<li><a href="./portalViewList.sk?pCode=2">NAVER</a></li>
						<li><a href="./portalViewList.sk?pCode=4">mNATE</a></li>
						<li><a href="./portalViewList.sk?pCode=5">mNATE News</a></li>
					</c:when>
					<c:when test="${pCode == 2 }">
						<li><a href="./portalViewList.sk?pCode=0">NATE</a></li>
						<li><a href="./portalViewList.sk?pCode=1">DAUM</a></li>
						<li class="active"><a href="#">NAVER</a></li>
						<li><a href="./portalViewList.sk?pCode=4">mNATE</a></li>
						<li><a href="./portalViewList.sk?pCode=5">mNATE News</a></li>
					</c:when>
					<c:when test="${pCode == 4 }">
						<li><a href="./portalViewList.sk?pCode=0">NATE</a></li>
						<li><a href="./portalViewList.sk?pCode=1">DAUM</a></li>
						<li><a href="./portalViewList.sk?pCode=2">NAVER</a></li>
						<li class="active"><a href="#">mNATE</a></li>
						<li><a href="./portalViewList.sk?pCode=5">mNATE News</a></li>
					</c:when>
					<c:when test="${pCode == 5 }">
						<li><a href="./portalViewList.sk?pCode=0">NATE</a></li>
						<li><a href="./portalViewList.sk?pCode=1">DAUM</a></li>
						<li><a href="./portalViewList.sk?pCode=2">NAVER</a></li>
						<li><a href="./portalViewList.sk?pCode=4">mNATE</a></li>
						<li class="active"><a href="#">mNATE News</a></li>
					</c:when>
				</c:choose>
			</ul>

			<div class="list-group">
			<c:forEach var="stats" items="${stats }" varStatus="status">
				<a class="list-group-item text-center" href="./portalViewDetail.sk?pCode=<c:out value="${pCode}"/>&cDate=<c:out value="${stats.checkDate}"/>&seq=<c:out value="${stats.checkSeq}"/>">${stats.checkDate }</a>
			</c:forEach>
			</div>

		</div>

	</div>

	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>

</body>
</html>