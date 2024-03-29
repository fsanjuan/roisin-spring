<form:form method="post" action="processData" modelAttribute="form"
	role="form">
	<form:hidden path="algorithm" />
	<form:hidden path="filePath" />
	<form:hidden path="exampleSetSize" />
	<!-- Ripper Hidden -->
	<%@include file="/WEB-INF/views/includes/ripperHidden.jsp"%>
	<!-- Subgroup Hidden -->
	<%@include file="/WEB-INF/views/includes/subgroupHidden.jsp"%>
	<!-- Tree2Rules Hidden -->
	<%@include file="/WEB-INF/views/includes/tree2rulesHidden.jsp"%>
	<c:if test="${error == true}">
		<div class="row">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<strong>Error! </strong>
				<form:errors path="label" />
				<form:errors path="deletedRows" />
				<form:errors path="attributeSelection" />
			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col-md-3">
			<h3><spring:message code="data.label.selection" /></h3>
			<br />
			<form:select path="label" class="form-control">
				<c:forEach items="${attributes }" var="attribute">
					<form:option value="${attribute.getName() }" />
				</c:forEach>
			</form:select>
		</div>
		<div class="col-md-7">
			<h3><spring:message code="data.filter.condition" /></h3>
			<br />
			<div class="col-md-3">
				<form:select path="filterAttribute" class="form-control">
					<c:forEach items="${attributes }" var="attribute">
						<form:option value="${attribute.getName() }" />
					</c:forEach>
				</form:select>
			</div>
			<div class="col-md-3">
				<form:select path="filterOperator" class="form-control">
					<form:option value="eq"><spring:message code="data.equals" /></form:option>
					<form:option value="neq"><spring:message code="data.non.equals" /></form:option>
					<form:option value="goe"><spring:message code="data.greater.equals" /></form:option>
					<form:option value="gt"><spring:message code="data.greater" /></form:option>
					<form:option value="soe"><spring:message code="data.smaller.equals" /></form:option>
					<form:option value="st"><spring:message code="data.smaller" /></form:option>
				</form:select>
			</div>
			<div class="col-md-6">
				<form:input path="filterValue" type="text" class="form-control"
					placeholder="value" />
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				<form:button type="submit" name="export" value="Export"
					class="btn btn-primary btn-lg"><spring:message code="data.export.data" /></form:button>
			</div>
			<div class="row">
				<form:button type="submit" name="process" value="Process"
					class="btn btn-success btn-lg"><spring:message code="data.process.data" /></form:button>
			</div>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<c:forEach items="${attributes }" var="attribute">
							<th>${attribute.getName() }<form:checkbox
									path="attributeSelection" value="${attribute.getName() }" /></th>
						</c:forEach>
						<th><spring:message code="data.delete" /></th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach items="${examples }" var="example" varStatus="loop">
						<tr>
							<td>${loop.index+1 }</td>
							<c:forEach items="${attributes }" var="attribute">
								<td>${example.getValueAsString(attribute) }</td>
							</c:forEach>
							<td><form:checkbox path="deletedRows" value="${loop.index }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-1">
			Total <span class="badge">${examples.size()}</span>
		</div>
		<div class="col-md-10 text-center">
			<ul class="pagination pagination" id="myPager"></ul>
		</div>
	</div>

</form:form>