<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div align="center">

<h1><spring:message code="header.logo"/></h1>
</div>

<div align="right">

<table>

	<tr> 
	     <td width="80"><a href="../login/login"><spring:message code="header.login"/></a></td>
	     <td width="80"><a href=""><spring:message code="header.joinMember"/></a></td>
	</tr>
</table>


</div>
<hr>