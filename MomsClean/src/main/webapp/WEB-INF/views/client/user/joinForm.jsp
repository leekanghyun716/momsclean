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
            <td><form:input path="userId" id="userId" /></td>
            <td>
                <font color="red"><form:errors path="userId" /></font>
                <span id="duplicateIdMessage"></span>
            </td>
            <td>
                <button type="button" onclick="checkDuplicateId()">중복확인</button>
            </td>
			

			<tr>
				<td><spring:message code="user.userPw" /></td>
				<td><form:input path="userPw" /></td>
				<td><font color="red"><form:errors path="userPw" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.confirmPassword" /></td>
				<td><form:input path="confirmPassword" /></td>
				<td><font color="red"><form:errors
							path="confirmPassword" /></font></td>
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
			<!--   <tr>
                <td><spring:message code="user.userDivision" /></td>
                <td><form:input path="userDivision" /></td>
                <td><font color="red"><form:errors path="userDivision" /></font></td>
            </tr>  -->
		</table>
		 <div class="button-container">
            <button type="submit" id="btnRegister">
                <spring:message code="action.register" />
            </button>
            <!-- 돌아가기 버튼 -->
            <button type="submit" formaction="/client/user/agreement" class="next-button">돌아가기</button>
        </div>
	</form:form>

	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    function checkDuplicateId() {
        var userId = $("#userId").val().trim();
        if (userId === "") {
            alert("아이디를 입력해주세요.");
            return;
        }

        $.ajax({
            url: "/client/user/checkDuplicateId", // 중복확인을 위한 컨트롤러의 URL
            type: "GET",
            data: {
                userId: userId
            },
            success: function(data) {
                if (data) {
                    $("#duplicateIdMessage").text("입력하신 아이디는 사용이 가능합니다.");
                    $("#btnRegister").prop("disabled", false); // 등록 버튼 활성화
                } else {
                    $("#duplicateIdMessage").text("입력하신 아이디는 사용이 불가능합니다.");
                    $("#btnRegister").prop("disabled", true); // 등록 버튼 비활성화
                }
            },
            error: function(xhr, status, error) {
                alert("서버 오류로 중복 확인에 실패하였습니다.");
            }
        });
    }

    $(document).ready(function() {
        $("#btnRegister").on("click", function() {
            if ($("#duplicateIdMessage").text() === "") {
                alert("아이디 중복 확인을 해주세요.");
                return false; // 폼 제출을 막음
            }
        });
    });
</script>

</body>
</html>