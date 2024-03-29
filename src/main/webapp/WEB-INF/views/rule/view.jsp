<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ page session="false"%>

<div class="page-header text-center">
	<h1>
		<spring:message code="rule.h1.rule" /> <small><spring:message code="rule.small.details" /></small>
	</h1>
</div>

<div class="container">
	<div class="row">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><spring:message code="rule.premise" /></th>
						<th><spring:message code="rule.conclusion" /></th>
						<th><spring:message code="rule.precision" /></th>
						<th><spring:message code="rule.support" /></th>
						<th>TPR</th>
						<th>FPR</th>
						<th>TP</th>
						<th>FP</th>
						<th>FN</th>
						<th>TN</th>
						<th>AUC</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<tr>
						<td>${rule.getPremise() }</td>
						<td>${rule.getConclusion() }</td>
						<td>${rule.getRulePrecision() }</td>
						<td>${rule.getSupport() }</td>
						<td>${rule.getTpr() }</td>
						<td>${rule.getFpr() }</td>
						<td>${rule.getTp() }</td>
						<td>${rule.getFp() }</td>
						<td>${rule.getFn() }</td>
						<td>${rule.getTn() }</td>
						<td>${rule.getAuc() }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-md-offset-2">
			<img alt="AUC Chart" src="${chart }" />
		</div>
		<div class="col-md-3">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <a href="${chart }"><button
					class="btn btn-primary btn-lg"><spring:message code="rule.download.chart" /></button></a>
		</div>
	</div>
</div>
