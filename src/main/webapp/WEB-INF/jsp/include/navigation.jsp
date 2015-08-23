<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/PortalMonitor">Portal Monitor Tool</a>
			</div>
			<%
				String uri = (String )request.getAttribute("javax.servlet.forward.request_uri");
			%>
			<c:set var="uri" value="<%= uri %>"></c:set>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${uri.length() == 15 }">
							<li class="active"><a href="/PortalMonitor">Home</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/PortalMonitor">Home</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${uri.indexOf('insert') == -1 }">
							<li><a href="./insert.sk">Insert</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="./insert.sk">Insert</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${uri.indexOf('portalViewList') == -1 }">
							<li class="dropdown">
						</c:when>
						<c:otherwise>
							<li class="dropdown active">
						</c:otherwise>
					</c:choose>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Result <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">PC</li>
							<li><a href="./portalViewList.sk?pCode=0">NATE</a></li>
							<li><a href="./portalViewList.sk?pCode=1">DAUM</a></li>
							<li><a href="./portalViewList.sk?pCode=2">NAVER</a></li>
							<li class="divider"></li>
							<li class="dropdown-header disabled">Mobile</li>
							<li><a href="./portalViewList.sk?pCode=4">mNATE</a></li>
							<li><a href="./portalViewList.sk?pCode=5">mNATE News</a></li>
						</ul>
					</li>
					<c:choose>
						<c:when test="${uri.indexOf('summary') == -1 }">
							<li class="dropdown">
						</c:when>
						<c:otherwise>
							<li class="dropdown active">
						</c:otherwise>
					</c:choose>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="summaryView.sk">Result Summary</a></li>
							<li><a href="summaryKc.sk">Korean Click</a></li>
						</ul>
					</li>
					<!-- 
						<li class="active"><a href="summaryView.sk">Summary</a></li>
						<li><a href="summaryView.sk">Summary</a></li>
						 -->
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>