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
<script src="js/portal_summary_view.js"></script>
</head>
<body>

	<!-- Wrap all page content here -->
	<div id="wrap">
		<!-- navigation -->
		<jsp:include page="../include/navigation.jsp" flush="false" />

		<!-- Begin page content -->
		<div class="container">
			<h1 class="page-header">Result Summary</h1>
			
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
							<th class="active text-center">Check Date</th>
							<th class="active text-center" colspan="2">Event / MIME Type</th>
							<th class="active text-center">Html</th>
							<th class="active text-center">Js</th>
							<th class="active text-center">Css</th>
							<th class="active text-center">Image</th>
							<th class="active text-center">Flash</th>
							<th class="active text-center">Text</th>
							<th class="active text-center">Other</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="summary" items="${summary}" varStatus="status">
								<c:choose>
									<c:when test="${summary.loadEventType == 1 }">
									<tr>
										<th rowspan="4" class="active text-center" style="vertical-align:middle">${summary.checkDate }</th>
										<th class="active text-center" rowspan="2" style="vertical-align:middle">Document<br />Complete</th>
										<th class="active text-center">KBytes</th>
										<td>
											<c:set var="htmlByte" value="${summary.statByteHtml} KB" />
											<c:out value="${summary.statByteHtml eq 0 ? '-' : htmlByte}" />
										</td>
										<td>
											<c:set var="jsByte" value="${summary.statByteJs} KB" />
											<c:out value="${summary.statByteJs eq 0 ? '-' : jsByte}" />
										</td>
										<td>
											<c:set var="cssByte" value="${summary.statByteCss} KB" />
											<c:out value="${summary.statByteCss eq 0 ? '-' : cssByte}" />
										</td>
										<td>
											<c:set var="imageByte" value="${summary.statByteImage} KB" />
											<c:out value="${summary.statByteImage eq 0 ? '-' : imageByte}" />
										</td>
										<td>
											<c:set var="flashByte" value="${summary.statByteFlash} KB" />
											<c:out value="${summary.statByteFlash eq 0 ? '-' : flashByte}" />
										</td>
										<td>
											<c:set var="textByte" value="${summary.statByteText} KB" />
											<c:out value="${summary.statByteText eq 0 ? '-' : textByte}" />
										</td>
										<td>
											<c:set var="otherByte" value="${summary.statByteOther} KB" />
											<c:out value="${summary.statByteOther eq 0 ? '-' : otherByte}" />
										</td>
									</tr>
									<tr>
										<th class="active text-center">Request</th>
										<td>
											<c:set var="htmlRequest" value="${summary.statHtmlRequest}" />
											<c:out value="${summary.statHtmlRequest eq 0 ? '-' : htmlRequest}" />
										</td>
										<td>
											<c:set var="jsRequest" value="${summary.statJsRequest}" />
											<c:out value="${summary.statJsRequest eq 0 ? '-' : jsRequest}" />
										</td>
										<td>
											<c:set var="cssRequest" value="${summary.statCssRequest}" />
											<c:out value="${summary.statCssRequest eq 0 ? '-' : cssRequest}" />
										</td>
										<td>
											<c:set var="imageRequest" value="${summary.statImageRequest}" />
											<c:out value="${summary.statImageRequest eq 0 ? '-' : imageRequest}" />
										</td>
										<td>
											<c:set var="flashRequest" value="${summary.statFlashRequest}" />
											<c:out value="${summary.statFlashRequest eq 0 ? '-' : flashRequest}" />
										</td>
										<td>
											<c:set var="textRequest" value="${summary.statTextRequest}" />
											<c:out value="${summary.statTextRequest eq 0 ? '-' : textRequest}" />
										</td>
										<td>
											<c:set var="otherRequest" value="${summary.statOtherRequest}" />
											<c:out value="${summary.statOtherRequest eq 0 ? '-' : otherRequest}" />
										</td>
									</tr>
									</c:when>
									<c:when test="${summary.loadEventType == 2 }">
									<tr>
										<th class="active text-center" rowspan="2" style="vertical-align:middle">Fully<br />Load</th>
										<th class="active text-center">KBytes</th>
										<td>
											<c:set var="htmlByte" value="${summary.statByteHtml} KB" />
											<c:out value="${summary.statByteHtml eq 0 ? '-' : htmlByte}" />
										</td>
										<td>
											<c:set var="jsByte" value="${summary.statByteJs} KB" />
											<c:out value="${summary.statByteJs eq 0 ? '-' : jsByte}" />
										</td>
										<td>
											<c:set var="cssByte" value="${summary.statByteCss} KB" />
											<c:out value="${summary.statByteCss eq 0 ? '-' : cssByte}" />
										</td>
										<td>
											<c:set var="imageByte" value="${summary.statByteImage} KB" />
											<c:out value="${summary.statByteImage eq 0 ? '-' : imageByte}" />
										</td>
										<td>
											<c:set var="flashByte" value="${summary.statByteFlash} KB" />
											<c:out value="${summary.statByteFlash eq 0 ? '-' : flashByte}" />
										</td>
										<td>
											<c:set var="textByte" value="${summary.statByteText} KB" />
											<c:out value="${summary.statByteText eq 0 ? '-' : textByte}" />
										</td>
										<td>
											<c:set var="otherByte" value="${summary.statByteOther} KB" />
											<c:out value="${summary.statByteOther eq 0 ? '-' : otherByte}" />
										</td>
									</tr>
									<tr>
										<th class="active text-center">Request</th>
										<td>
											<c:set var="htmlRequest" value="${summary.statHtmlRequest}" />
											<c:out value="${summary.statHtmlRequest eq 0 ? '-' : htmlRequest}" />
										</td>
										<td>
											<c:set var="jsRequest" value="${summary.statJsRequest}" />
											<c:out value="${summary.statJsRequest eq 0 ? '-' : jsRequest}" />
										</td>
										<td>
											<c:set var="cssRequest" value="${summary.statCssRequest}" />
											<c:out value="${summary.statCssRequest eq 0 ? '-' : cssRequest}" />
										</td>
										<td>
											<c:set var="imageRequest" value="${summary.statImageRequest}" />
											<c:out value="${summary.statImageRequest eq 0 ? '-' : imageRequest}" />
										</td>
										<td>
											<c:set var="flashRequest" value="${summary.statFlashRequest}" />
											<c:out value="${summary.statFlashRequest eq 0 ? '-' : flashRequest}" />
										</td>
										<td>
											<c:set var="textRequest" value="${summary.statTextRequest}" />
											<c:out value="${summary.statTextRequest eq 0 ? '-' : textRequest}" />
										</td>
										<td>
											<c:set var="otherRequest" value="${summary.statOtherRequest}" />
											<c:out value="${summary.statOtherRequest eq 0 ? '-' : otherRequest}" />
										</td>
									</tr>
									</c:when>
								</c:choose>
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