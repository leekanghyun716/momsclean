<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--<input value="${serviceName1}" type="hidden" id="serviceValue" />  -->

<h2>
	<spring:message code="review.register" />
</h2>
<form:form id="reviewForm" modelAttribute="review"
	action="reviewRegister">
	<form:hidden path="reserveNo" value="${review.reserveNo}" />
	<form:hidden path="userNo" value="${review.userNo}" />
	<table>
		<tr>
			<td><spring:message code="review.serviceName" /> &nbsp;&nbsp;</td>
			<td>${serviceName} SET</td>
			<td><font color="red"></font></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="review.grade" /></td>
			<td><form:radiobutton path="reviewGrade" value="1" />★ 
			<form:radiobutton path="reviewGrade" value="2" />★★ 
			<form:radiobutton path="reviewGrade" value="3" />★★★ 
			<form:radiobutton path="reviewGrade" value="4" />★★★★ 
			<form:radiobutton path="reviewGrade" value="5" />★★★★★</td>
			<td><font color="red"><form:errors path="reviewGrade" /></font></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="review.content" /><br>(400자 제한)</td>
			<td><form:textarea path="reviewContent" rows="20" cols="80"
					id="reviewContent" /></td>
			<td><font color="red"><form:errors path="reviewContent" /></font></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnRegister">
		<spring:message code="review.save" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#reviewForm");

		var reviewGrade

		$("#btnRegister").on("click", function() {
			var reviewContent = $("#reviewContent");

			if ($("input[name='reviewGrade']:checked").length == 0) {

				alert("평점을 선택해주세요.");
				return;
			}

			if (reviewContent.val().length == 0 || reviewContent.val() == '') {
				alert('글 내용을 입력해 주세요.');
				return;
			}

			if (reviewContent.val().length > 400) {
				alert('400자 미만으로 입력해주세요');
				return;
			}

			formObj.submit();
		});
	});
</script>
