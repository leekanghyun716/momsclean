<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
	<h2>
		<spring:message code="auth.header.login" />
	</h2>
	<form id="loginForm" action="/client/login/login" method="post">
		<!-- 수정된 부분 -->
		<table>
			<tr>
				<td><label for="username">아이디:</label></td>
				<td><input type="text" id="username" name="username" /></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호:</label></td>
				<td><input type="password" id="password" name="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" id="rememberMe" name="rememberMe" />
					<label for="rememberMe"><spring:message
							code="auth.rememberMe" /></label></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" id="sub">
						<!-- 수정된 부분 -->
						<spring:message code="action.login" />
					</button></td>
			</tr>
		</table>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        // 페이지가 로드된 후 실행될 함수
        $(document).ready(function() {
            // 로그인 버튼 클릭 이벤트 처리
            
            $('#sub').on('click',function(event){
            	 $.ajax({
                     type: 'POST',
                     url: $('#loginForm').attr('action'),
                     data: $('form').serialize(),
                     dataType:'text',
                     	 success: function(data) {
                     		alert("로그인 성공.마이페이지로 이동합니다.");
                     		window.location = "/client/item/itemInfo";
                     	 },
                     	    error: function() {
                     	        // 서버와의 통신 오류 시 에러 메시지 표시
                     	        alert('서버와 통신하는 중에 오류가 발생했습니다.');
                     	    }
                     	});
                     	
            });
            
 
        });
    </script>
</body>
</html>

