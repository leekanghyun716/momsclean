<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<style>


 hr{
        border: none;
        border-top: 1px solid #ccc;
        margin: 20px 0;
    }
    
    </style>
    
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
<div align="center">

	<h1>
		<a href="../../client/page">MOM'S CLEAN</a>
	</h1>

</div>

<div align="right">

	<table>

		<!-- 로그인을 하지 않은 경우 로그인 페이지로 이동할 수 있게 한다. -->
		<sec:authorize access="!isAuthenticated()">
			
			<!-- 로그인을 메뉴에 추가한다. -->
			<td width="80"><a href="/client/login/login"><spring:message code="header.login" /></a></td>
			
			<td width="80"><a href="/user/joinForm"><spring:message code="header.joinMember" /></a></td>
			
		</sec:authorize>
		
		<!-- 로그인을 거친 인증된 사용자인 경우 사용자명을 보여주고 로그아웃 페이지로 이동할 수 있게 한다. -->
		<sec:authorize access="isAuthenticated()">
			<td width="180"><sec:authentication property="principal.username" />
				님 <a href="/client/mypages/logout"> <spring:message code="mypage.action.logout" /></a></td>

		</sec:authorize>
	</table>
</div>
<hr>