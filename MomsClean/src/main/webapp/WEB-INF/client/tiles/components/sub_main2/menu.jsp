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
    </style>
</head>
<body>
<div align="center">
    <table>
        <tr>
            <td width="120"><a href="../intro/commpanyintr"><spring:message code="header.intro"/></a></td>
            <td width="120"><a href="../notice/noticeList?page=1&perPageNum=10"><spring:message code="header.notice"/></a></td>
            <td width="120"><a href="#"><spring:message code="header.item"/></a></td>
            <td width="120"><a href="#"><spring:message code="header.reserve"/></a></td>
            <td width="120">
                <!-- 드롭다운 메뉴 -->
                <div class="dropdown">
                    <a href="#"><spring:message code="header.board"/></a>
                    <div class="dropdown-content" align="center">
                        <!-- 드롭다운 메뉴에 들어갈 항목들 -->
                        <a href="#"><spring:message code="header.reference"/></a>
                        <a href="#"><spring:message code="header.review"/></a>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    </div>
    <hr>
</body>
</html>