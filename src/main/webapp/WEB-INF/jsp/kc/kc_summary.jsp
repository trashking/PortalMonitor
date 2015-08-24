<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/favicon.ico"type="image/x-icon" rel="shortcut icon" />	
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" rel="stylesheet">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/kc_summary_view.js"></script>
</head>
<body>

	<!-- Wrap all page content here -->
	<div id="wrap">
		<!-- navigation -->
		<jsp:include page="../include/navigation.jsp" flush="false" />

		<!-- Begin page content -->
		<div class="container">
			<h1 class="page-header">Korean Click Load Time (2012. 12~)</h1>
			
			<form class="form-inline" role="form">
				<div class="form-group">
					<select id="portal-code" class="form-control">
						<option value='none'>검색하실 포털을 선택해주세요</option>
						<option value='0' ${'0' eq pCode ? 'selected' : '' }>NATE</option>
						<option value='1' ${'1' eq pCode ? 'selected' : '' }>DAUM</option>
						<option value='2' ${'2' eq pCode ? 'selected' : '' }>NAVER</option>
					</select>
				</div>
				<div class="form-group">
					<fmt:parseDate value='${sDate}' var='sDate' pattern="yyyymmdd" scope="page"/>
					<fmt:parseDate value='${eDate}' var='eDate' pattern="yyyymmdd" scope="page"/>
					<input type="date" id="sDate" name="sDate" value="<fmt:formatDate value="${sDate}" pattern="yyyy-mm-dd"/>" class="form-control">
					<input type="date" id="eDate" name="eDate" value="<fmt:formatDate value="${eDate}" pattern="yyyy-mm-dd"/>" class="form-control">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary">View</button>
				</div>
			</form>

			<div class="table-responsive" style="margin-top:30px">
				<table class="table table-condensed table-bordered text-center small">
					<thead>
						<tr>
							<th class="active text-center">Date</th>
							<th class="active text-center">LoadTime</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="summary" items="${summary}" varStatus="status">
						<tr>
							<td>
								<c:out value="${summary.checkDate }" />
							</td>
							<td>
								<c:set var="loadTime" value="${summary.loadTime }"/>
								<c:out value="${fn:substring(loadTime, 0, 4) }" />
							</td>
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
