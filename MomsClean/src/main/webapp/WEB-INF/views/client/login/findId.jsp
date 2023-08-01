<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ID 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function findId() {
            var userName = $("#userName").val();
            var userEmail = $("#userEmail").val();

            $.ajax({
                type: "POST",
                url: "/client/login/findId",
                data: {
                    userName: userName,
                    userEmail: userEmail
                },
                success: function(data) {
                    alert("ID는 " + data + " 입니다.");
                },
                error: function() {
                    alert("ID를 찾을 수 없습니다.");
                }
            });
        }
        
        function findPw() {
            var userId = $("#userId").val();
            var userName = $("#userNameForPw").val();
            var userEmail = $("#userEmailForPw").val();

            $.ajax({
                type: "POST",
                url: "/client/login/findPw",
                data: {
                    userId: userId,
                    userName: userName,
                    userEmail: userEmail
                },
                success: function(data) {
                    alert("비밀번호는 " + data + " 입니다.");
                },
                error: function() {
                    alert("비밀번호를 찾을 수 없습니다.");
                }
            });
        }
        
        function goToLoginPage() {
            window.location.href = "/client/login/login";
        }
        
        function resetForm() {
            $("#userName").val("");
            $("#userEmail").val("");
            $("#userId").val("");
            $("#userNameForPw").val("");
            $("#userEmailForPw").val("");
        }
    </script>
</head>
<body>
    <h1>ID 찾기</h1>
    <form>
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName"><br>
        <label for="userEmail">이메일:</label>
        <input type="text" id="userEmail" name="userEmail"><br>
        <input type="button" value="ID 찾기" onclick="findId()">
    </form>
    
    <h1>비밀번호 찾기</h1>
    <form>
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId"><br>
        <label for="userNameForPw">이름:</label>
        <input type="text" id="userNameForPw" name="userNameForPw"><br>
        <label for="userEmailForPw">이메일:</label>
        <input type="text" id="userEmailForPw" name="userEmailForPw"><br>
        <input type="button" value="PW 찾기" onclick="findPw()">
    </form>
    
    <br>
    <input type="button" value="로그인 하기" onclick="goToLoginPage()">
    <input type="button" value="다시 입력" onclick="resetForm()">
</body>
</html>
