<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <title>고객센터 메뉴 드롭다운</title>
    <style>
        /* 스타일링을 위한 CSS */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            padding: 12px;
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 8px;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        

       hr {
      
        border: 1px solid #ccc;
        margin: 20px 0;
    }
    
    .font{font-family: 'IBM Plex Sans KR', sans-serif;}
    </style>
   
</head>
<body>
<div align="center">
    <table>
        <tr>
            <td width="120" class="font"><a href="#">회사소개</a></td>
            <td width="120" class="font"><a href="#">공지사항</a></td>
            <td width="120" class="font"><a href="/client/item/itemInfo">상품&가격</a></td>
            <td width="120" class="font">
                <!-- 드롭다운 메뉴 -->
                <div class="dropdown">
                    <a href="#">고객센터</a>
                    <div class="dropdown-content" align="center">
                        <!-- 드롭다운 메뉴에 들어갈 항목들 -->
                        <a href="#">문의게시판</a>
                        <a href="../review/reviewList">리뷰게시판</a>
                    </div>
                </div>
            </td>
             <td width="120" class="font"><a href="#">마이페이지</a></td>
        </tr>
    </table>
    </div>
    <hr>
    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(document).ready(function() {
	  var uid = '<%=session.getAttribute("user")%>';
	  $("#btnMypage").click(function() {
			if(uid=="null"){ 
	             alert("로그인이 필요한 항목입니다. 회원 가입 또는 로그인을 해주세요"); 
	             window.location= "/client/page";
	             return;
	          }
			
		});
   
  });

    
  </script>
    
 
</body>
</html>