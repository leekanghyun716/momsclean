<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');

 @font-face {
    font-family: 'IBM Plex Sans KR', sans-serif;
    
}


</style>


<br>
<div align="center">
<h2 class="font">
	<spring:message code="mypage.header.reserveList" />
</h2>
<br>
<form:form modelAttribute="list" >

<table border="1">
   
	<tr>
	    
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.reserveNo" /></th>

		<th align="center" style="font-size: 18px;" ><spring:message code="mypage.userName" /></th>

		<th align="center" style="font-size: 18px;" ><spring:message code="mypage.itemInfo" /></th>
		
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.itemOption" /></th>

		<th align="center" style="font-size: 18px;"><spring:message code="mypage.cleanDate" /></th>
		
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.reserveRequest"/><th>
	</tr>
	<c:choose>
	   <c:when test="${empty list}">
	    <tr>
	         <td colspan="5">
	                 <spring:message code="mypage.listEmpty"/>
	                 </td>
	   </tr>
	  </c:when>
	  
	  <c:otherwise>
	        <c:forEach items="${list}" var="list">
	            <tr>
	                 
	                   <td  align="left" style="font-size: 18px;"><a href="/client/mypages/myPageReserveInfo${pagination.makeQuery(pagination.pageRequest.page)}&reserveNo=${list.reserveNo}">${list.reserveNo}</a></td>
	                   <td  align="center" style="font-size: 18px;">${list.userName}</td>
	                   <td  align="center" style="font-size: 18px;">${list.reserveItemName}</td>
	                   <td  align="center" style="font-size: 18px;">${list.reserveOptionName}</td>
	                   <td  align="center" style="font-size: 18px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.cleanDate}"/></td>
	                   <td  align="center" width="80" style="font-size: 18px;">${list.reserveRequest}</td>
	           </tr>
	        </c:forEach>       
	  </c:otherwise>
	 </c:choose>
	  </table>
	
	  </form:form>
	
	  <!-- 페이징 네비게이션 -->
	  <br>
	  <div class="pagination">
	  <c:if test="${pagination.prev }">
	        <a href="${pagination.startPage -1}">&laquo;</a>
	  </c:if>
	  
	  <c:forEach  begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	        <a href="/client/mypages/myPageReserveList${pagination.makeQuery(idx) }" style="font-size: 20px;">${idx}</a> 
	  </c:forEach>
	  
	  <c:if test="${pagination.next && pagination.endPage > 0 }">
	       <a href="${pagination.endPage + 1}">&raquo;</a>
	  </c:if>
	  </div>
</div>





