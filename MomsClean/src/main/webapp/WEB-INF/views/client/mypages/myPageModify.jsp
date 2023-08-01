<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');

 @font-face {
   font-family: 'IBM Plex Sans KR', sans-serif;
    
}
 .modalSubmit {
        font-family: 'IBM Plex Sans KR', sans-serif;
        background-color: #00BFFF;
        color: #fff;
        border: solid 1px grey;
        cursor: pointer;
        font-size: 12px;
        margin-right: 10px;
        border-radius: 5px;
        padding: 10px 20px;
    }

    .modalSubmit:hover {
        background-color: #0056b3;
    }
 </style>

<div align="center" >
<br>
<h2 class="font"> <spring:message code="mypage.header.modify"/></h2>
<br>
<form:form modelAttribute="mypage">
<form:hidden path="userNo"/>
<form:hidden path="userDivision"/>
<form:hidden path="emailAuth"/>
<table> 

	<tr>
		<td><spring:message code="mypage.userId"/></td>
		<td><form:input path="userId" readonly ="true" /></td>
		
		
	</tr>
	<tr>
		<td><spring:message code="mypage.userPw"/></td>
		<td><form:input path="userPw" id="pwd"/> </td>
		
		
	</tr>
	<tr>
		<td><spring:message code="mypage.userName"/></td>
		<td><form:input path="userName" id="name" /></td>
		
		
	</tr>
	<tr>
		<td><spring:message code="mypage.userPhone"/></td>
		<td><form:input path="userPhone" id="phone" /></td>
		
		
	</tr>
	<tr>
		<td><spring:message code="mypage.userEmail"/></td>
		<td><form:input path="userEmail" id="email" /></td>
		
		
	</tr>
	
	<tr>
		<td><spring:message code="mypage.regDate"/></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mypage.regDate}" /></td>		
	</tr>
	
	
</table>
</form:form>
</div>
<br>
<div align="center">

 	<button type="submit" id="btnModifyComplete" class="modalSubmit" onclick="fn_sendMember">
 	 	<spring:message code="mypage.action.modifyComplete"/>
 	 </button>
 	 <button type="submit" id="btnGoback" class="modalSubmit">
 	 	<spring:message code="mypage.action.goback"/>
 	 </button>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#mypage");
		
		$("#btnModifyComplete").on("click", function() {
			
			if(confirm("내 정보를 수정하시겠습니까?")){
				formObj.submit();
				alert("수정이 완료되었습니다.");	
			}else {
				
			} 
			

	});
	    $("#btnGoback").on("click", function() {
		    window.location = "/client/mypages/myPageInfo";
	});
			
	});
</script>