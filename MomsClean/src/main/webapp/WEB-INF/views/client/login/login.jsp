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
	<form action="login" method="post">
		
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
				<td colspan="2" align="center"><button type="button" id="sub">
						
						<spring:message code="action.login" />
					</button></td>
			</tr>
		</table>
	</form>
	
	  <!-- 아이디/비밀번호 찾기 링크 -->
    <p><a href="/client/login/findId">아이디/비밀번호 찾기</a></p>
    <!-- 회원가입 링크 -->
    <p><a href="/client/user/agreement">회원가입</a></p>
    
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        // 페이지가 로드된 후 실행될 함수
        $(document).ready(function() {
            // 로그인 버튼 클릭 이벤트 처리
            $('#sub').on('click',function(event){
            	 $.ajax({
                     type: 'POST',
                     url: $(this).attr('action'),
                     data: $('form').serialize(),
                     dataType:'text',
                     	 success: function(data) {
                     		alert("로그인 성공.마이페이지로 이동합니다.");
                  		window.location = "/client/mypage/myPageInfo";
                     	 },
                     	   error: function() {
                               alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.');
                               window.location.reload(); 
                               // 로그인 실패 시 페이지를 새로고침하여 다시 로그인 페이지로 이동
                     	    }
                     	});
                     	
            });
            
 
        });
    </script>
</body>
</html>

