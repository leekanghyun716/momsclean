<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 등록</title>
</head>
<body>
	<h2>
		<spring:message code="user.header.register" />
	</h2>
	<form:form modelAttribute="user" action="register">
		<table>
			<tr>
				<td><spring:message code="user.userId" /></td>
				<td><form:input path="userId" /></td>
				<td><font color="red"><form:errors path="userId" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userPw" /></td>
				<td><form:input path="userPw" /></td>
				<td><font color="red"><form:errors path="userPw" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userName" /></td>
				<td><form:input path="userName" /></td>
				<td><font color="red"><form:errors path="userName" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userPhone" /></td>
				<td><form:input path="userPhone" /></td>
				<td><font color="red"><form:errors path="userPhone" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userEmail" /></td>
				<td><form:input path="userEmail" /></td>
				<td><font color="red"><form:errors path="userEmail" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.emailAuth" /></td>
				<td><form:checkbox path="emailAuth" /></td>
				<td><font color="red"><form:errors path="emailAuth" /></font></td>
			</tr>
		</table>

		<tr>
			<td><spring:message code="user.userDivision" /></td>
			<td><form:input path="userDivision" /></td>
			<td><font color="red"><form:errors path="userDivision" /></font></td>
		</tr>

		<div>
			<button type="submit" id="btnRegister">
				<spring:message code="action.register" />
			</button>
		</div>
	</form:form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			var formObj = $("form");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
		});
		
		// 서버로부터 전달된 alertMessage 값이 있으면 Alert으로 메시지 출력 후 로그인 페이지로 이동
		var alertMessage = "${alertMessage}";
		if (alertMessage) {
			alert(alertMessage);
			window.location.href = "/client/login/login";
		}
	});
	</script>

</body>
</html>
