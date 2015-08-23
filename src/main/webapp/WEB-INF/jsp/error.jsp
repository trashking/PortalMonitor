<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ page trimDirectiveWhitespaces="true"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/favicon.ico"  type="image/x-icon" rel="shortcut icon" />	
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

	<div class="site-wrapper">
	
		<div class="site-wrapper-inner">
		
			<div class="cover-container">
			
				<div class="inner cover">
					<h1 class="cover-heading" style="margin-bottom:30px">처리 과정에서 에러가 발생했습니다.</h1>
					<p class="lead">
						<a href="./" class="btn btn-lg btn-default">Back to Main</a>
					</p>
				</div>
		
			</div>
		
		</div>
	
	</div>

</body>
</html>