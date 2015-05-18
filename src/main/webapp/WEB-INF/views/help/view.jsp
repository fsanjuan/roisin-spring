<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<%@ page session="false"%>


<div class="page-header text-center">
	<h1>
		<spring:message code="help.h1" /> <small><spring:message code="help.small" /></small>
	</h1>
</div>

<div class="container">
	<c:set var="localeCode" value="${pageContext.response.locale}" />
	<c:choose>
	  <c:when test="${localeCode == 'en' }">
	    <a href="${manualEn}"><spring:message code="help.manual.download" /></a>
	  </c:when>
	  <c:otherwise>
	    <a href="${manualEs}"><spring:message code="help.manual.download" /></a>
	  </c:otherwise>
	</c:choose>
</div>