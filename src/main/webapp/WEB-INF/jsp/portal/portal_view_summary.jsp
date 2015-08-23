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
			<h1 class="page-header">${summary.get(0).portalName } Summary <a href="portalViewList.sk?pCode=${summary.get(0).portalCode }" class="btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span> Back to Result</a></h1>
			
			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal" style="margin-bottom:0">
						<dt>CHECK DATE</dt>
						<dd>${summary.get(0).checkDate }</dd>
						<dt>FROM</dt>
						<dd>${summary.get(0).checkBaseLocation } - ${summary.get(0).checkBaseBrowser } - ${summary.get(0).checkBaseConnection }</dd>
						<dt>CHECK URL</dt>
						<dd><a href="${summary.get(0).checkUrl }" target="_new">${summary.get(0).checkUrl }</a></dd> 
					</dl>
				</div>
			</div>				
			
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>MIME Type</th>
							<th>Bytes Downloaded</th>
							<th>Request</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="summary" items="${summary }" varStatus="status">
							<tr>
								<td>${summary.statType }</td>
								<td>${summary.statByte } KB</td>
								<td>${summary.statRequest } 개</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>