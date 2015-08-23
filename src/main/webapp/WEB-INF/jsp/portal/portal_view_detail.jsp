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
			<h1 class="page-header">${stats.get(0).portalName } Result <a href="portalViewList.sk?pCode=${stats.get(0).portalCode }" class="btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span> Back to List</a></h1>
		
			<div class="panel panel-default small">
				<div class="panel-body">
					<dl class="dl-horizontal" style="margin-bottom:0">
						<dt>CHECK DATE</dt>
						<dd>${stats.get(0).checkDate }</dd>
						<dt>FROM</dt>
						<dd>${stats.get(0).checkBaseLocation } - ${stats.get(0).checkBaseBrowser } - ${stats.get(0).checkBaseConnection }</dd>
						<dt>CHECK URL</dt>
						<dd><a href="${stats.get(0).checkUrl }" target="_new">${stats.get(0).checkUrl }</a></dd> 
					</dl>
				</div>
				<div class="panel-footer">
					<strong>Information for table row colors : </strong>
					<span class="label label-default">Document Complete</span>
					<span class="label label-warning">Fully Load</span>
					<span class="label label-danger">3XX Response</span>
				</div>
			</div>
			
			<h2>Summary</h2>

			<div class="table-responsive" style="margin-top:30px">
				<table class="table table-condensed table-bordered text-center small">
					<thead>
						<tr>
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
		
			<h2>Resources</h2>
			
			<div class="table-responsive">
				<table class="table table-bordered table-condensed small text-center">
					<thead>
						<tr>
							<th class="active text-center" style="vertical-align:middle">Stat</th>
							<th class="active text-center" style="vertical-align:middle">Resource</th>
							<th class="active text-center" style="vertical-align:middle">Content Type</th>
							<th class="active text-center" style="vertical-align:middle">Start Offset</th>
							<th class="active text-center" style="vertical-align:middle">DNS Lookup</th>
							<th class="active text-center" style="vertical-align:middle">Initial Connection</th>
							<th class="active text-center" style="vertical-align:middle">SSL Negotiation</th>
							<th class="active text-center" style="vertical-align:middle">Time to First Byte</th>
							<th class="active text-center" style="vertical-align:middle">Content Download</th>
							<th class="active text-center" style="vertical-align:middle">Bytes Downloaded</th>
							<th class="active text-center" style="vertical-align:middle">Error/Status Code</th>
							<th class="active text-center" style="vertical-align:middle">IP</th>
							<th class="active text-center" style="vertical-align:middle">Location</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="stats" items="${stats }" varStatus="status">
								<c:choose>
									<c:when test="${stats.statEventType > 6 }">
										<tr class="danger">
									</c:when>
									<c:when test="${stats.statEventType > 4 }">
										<tr class="warning">
									</c:when>
									<c:otherwise>
										<tr>
									</c:otherwise>
								</c:choose>
									<td style="vertical-align:middle"><small>${stats.statNo }</small></td>
									<td style="vertical-align:middle" class="text-left"><small><a href="${stats.statResource }" target="_blank">${stats.modifiedStatResource }</a></small></td>
									<td style="vertical-align:middle"><small>${stats.statType }</small></td>
									<td style="vertical-align:middle"><small>${stats.statOffset } s</small></td>
									<td style="vertical-align:middle"><small>${stats.statDNS } ms</small></td>
									<td style="vertical-align:middle"><small>${stats.statConn } ms</small></td>
									<td style="vertical-align:middle"><small>${stats.statSSL } ms</small></td>
									<td style="vertical-align:middle"><small>${stats.statTTFB } ms</small></td>
									<td style="vertical-align:middle"><small>${stats.statContent } ms</small></td>
									<td style="vertical-align:middle"><small>${stats.statByte } kb</small></td>
									<td style="vertical-align:middle"><small>${stats.statCode }</small></td>
									<td style="vertical-align:middle"><small>${stats.statIP }</small></td>
									<td style="vertical-align:middle"><small>${stats.statLocation }</small></td>
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