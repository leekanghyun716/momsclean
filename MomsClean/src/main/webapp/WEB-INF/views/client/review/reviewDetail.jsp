<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container">

	<form:form modelAttribute="review">
		<form:hidden path="reviewNo" />

		<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
		<input type="hidden" name="page" value="${pqrq.page}">
		<input type="hidden" name="sizePerPage" value="${pqrq.sizePerPage}">

		<table class="table w-75">
			<thead >
				<th colspan="2" class="text-center p-3">
					<h2>
						<spring:message code="common.reviewBoard" />
					</h2>
				</th>
			</thead>
			
			<tbody class="table-group-divider">
				<tr>
					<td class="w-25"><spring:message code="review.serviceName" /></td>
					<td>${serviceName} SET</td>
				</tr>
				
				<tr>
					<td class="w-25"><spring:message code="review.grade" /></td>
					<td><span id="gradeContainer"></span>
					</td>
				</tr>
				
				<tr>
					<td class="w-25"><spring:message code="review.content" /></td>
					<td class="w-75"><form:textarea path="reviewContent"
							readonly="true" rows="20" cols="100" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</div>

<div>
	<button type="submit" class="btn btn-primary col-sm-1 mt-3" id="btnList">
		<spring:message code="common.list" />
	</button>
</div>


<script>
	$(document).ready(function() {
		var formObj = $("#reviewForm");

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		var reviewGrade = "${review.reviewGrade}";
		var stars = "★".repeat(reviewGrade);
		$("#gradeContainer").append('<font">' + stars + '</font>');

		$("#btnList").on("click", function() {
			self.location = "/client/review/reviewList";
		});
	});
</script>