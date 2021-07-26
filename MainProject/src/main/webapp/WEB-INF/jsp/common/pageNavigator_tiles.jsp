<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-sm-12 col-md-5">
		<div class="dataTables_info" id="dataTable_info" role="status"
			aria-live="polite">Showing ${1+(resultPage.currentPage-1)*10} to ${resultPage.currentPage*resultPage.pageSize} of ${resultPage.totalCount } entries</div>
	</div>
	<div class="col-sm-12 col-md-7">
		<div class="dataTables_paginate paging_simple_numbers"
			id="dataTable_paginate">
			<ul class="pagination">
				<li class="paginate_button page-item previous 
					<c:if test='${ resultPage.currentPage == 1}'>disabled</c:if>"
					id="dataTable_previous"><a href="javascript:fncGetList('${resultPage.currentPage-1}')" aria-controls="dataTable"
					data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
				
				<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
					<li class="paginate_button page-item <c:if test='${ resultPage.currentPage == i }'>active</c:if> ">
						<a href="javascript:fncGetList('${i}')" aria-controls="dataTable" 
							data-dt-idx="1" tabindex="0"
							class="page-link">${ i }
						</a>
					</li>
				</c:forEach>
				
				<li class="paginate_button page-item next <c:if test='${ resultPage.currentPage == resultPage.maxPage }'>disabled</c:if>" id="dataTable_next">
					<a href="javascript:fncGetList('${resultPage.currentPage+1}')" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">
						Next
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>



