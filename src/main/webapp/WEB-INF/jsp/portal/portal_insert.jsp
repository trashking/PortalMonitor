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
		<%@ include file="../include/navigation.jsp" %>
		
		<!-- Begin page content -->
		<div class="container">

			<h1 class="page-header">Insert Test URL</h1>
			<form role="form" action="insert.sk" method="post">
		
				<div class="input-group">
					<label class="sr-only" for="URL">Insert Test URL</label>
					<input type="text" id="URL" name="URL" placeholder="Insert Test URL" class="form-control" placeholder="Insert Test URL" required autofocus />
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">Insert</button>
					</span>
				</div><!-- /input-group -->		
		
			</form>	
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>

</body>
</html>