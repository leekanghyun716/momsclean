<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ID 찾기</title>
</head>
<body>
    <h2>ID 찾기</h2>
    <form>
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required />
        <br />
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required />
        <br />
        <input type="button" value="찾기" onclick="findId()" />
    </form>

    <script>
        function showAlert(message) {
            alert(message);
        }

        // AJAX로 아이디 찾기 요청을 보냄
        function findId() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var requestData = {
                "name": name,
                "email": email
            };

            $.ajax({
                type: "POST",
                url: "/client/login/idFind",
                contentType: "application/json",
                data: JSON.stringify(requestData),
                success: function (response) {
                    showAlert("ID 찾기 성공\nID는 " + response + "입니다.");
                },
                error: function (xhr, textStatus, errorThrown) {
                    showAlert("아이디 찾기 실패\n" + xhr.responseText);
                }
            });
        }
    </script>
</body>
</html>

