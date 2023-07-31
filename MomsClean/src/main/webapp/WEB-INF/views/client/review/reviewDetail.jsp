<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<h2><spring:message code="common.reviewBoard" /></h2>

<form:form modelAttribute="review">
	<form:hidden path="reviewNo" />
	
	
<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
<input type="hidden" name="page" value="${pqrq.page}">
<input type="hidden" name="sizePerPage" value="${pqrq.sizePerPage}">

	<table>
		<tr>
			<td><spring:message code="review.serviceName" /> &nbsp;&nbsp;</td>
			<td>${serviceName} SET</td>
			<td><font color="red"></font></td>
		</tr>
		<tr>
			<td><spring:message code="review.grade" /></td>
			<td>
				<div id="gradeContainer"></div>
			</td>
		</tr>
		<tr>
			<td><spring:message code="review.content" /></td>
			<td><form:textarea path="reviewContent" readonly="true" rows="20" cols="80" /></td>
			<td><font color="red"><form:errors path="reviewContent" /></font></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnList"><spring:message code="common.list" /></button>
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