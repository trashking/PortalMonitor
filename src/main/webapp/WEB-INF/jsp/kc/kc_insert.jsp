<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
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
<style type="text/css">
.error {
	color : red;
}
</style>
</head>
<body>

	<!-- Wrap all page content here -->
	<div id="wrap">
		<!-- navigation -->
		<%@ include file="../include/navigation.jsp" %>
		
		<!-- Begin page content -->
		<div class="container">

			<h1 class="page-header">Insert Korean Click Load Time</h1>
			
			<!-- 
			<form class="form-horizontal" role="form" action="insertKc.sk" method="post">
				<div class="input-group">
					<label for="date">Date</label>
					<input type="text" id="date" name="date" placeholder="Insert Date ex)YYYYMMDD" class="form-control" required autofocus />
				</div>		
				<div class="input-group">
					<label for="nate">Nate Load Time</label>
					<input type="text" id="nate" name="nate" placeholder="Insert Nate Load Time" class="form-control" required />
				</div>		
				<div class="input-group">
					<label for="daum">Daum Load Time</label>
					<input type="text" id="daum" name="daum" placeholder="Insert Daum Load Time" class="form-control" required />
				</div>		
				<div class="input-group">
					<label for="naver">Naver Load Time</label>
					<input type="text" id="naver" name="naver" placeholder="Insert Naver Load Time" class="form-control" required />
				</div>
				<div class="input-group">		
					<button type="submit" class="btn btn-primary" style="margin-top:10px">Insert</button>
				</div>
			</form>
			 -->
			
			<sf:form action="insertKc.sk" commandName="kcmodel" method="post">
			
				<sf:input path="date" />

			</sf:form>
			
				
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>

</body>
</html>