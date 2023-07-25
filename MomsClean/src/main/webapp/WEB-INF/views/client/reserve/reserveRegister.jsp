<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
img {
	width: 500px;
}

.reserveDiv {
	width: 1080px;
	height: 800px;
	margin: auto;
}

.itemFont {
	font-size: 25px;
	font-weight: bold;
}
</style>
<div class="reserveDiv">
	<h2>예약</h2>
	<form:form modelAttribute="reserve" action="reserveRegister">

		<form:hidden path="reserveNo" id="reserveNo" />
		<form:hidden path="userNo" id="userNo" />
		<form:hidden path="userId" id="userId" />
		<form:hidden path="userName" id="userName" />
		<form:hidden path="itemNo" id="itemNo" />
		<form:hidden path="reserveItemName" id="reserveItemName" />
		<form:hidden path="reserveItemPrice" id="reserveItemPrice" />

		<table border="1">
			<tr>
				<td rowspan="3"><img src="display?itemNo=${item.itemNo}"></td>
			</tr>
			<tr>
				<td width="400px" colspan="5"><font class="itemFont">당신만을
						위한 Mom's clean의 ${item.itemName} 아이템입니다.<br>
						${item.itemName}는 ${item.itemNo}평의 공간을 구석구석 청소해 사용자분의 집의 상쾌함을
						책임지겠습니다.
				</font></td>
			</tr>
			<tr>

			</tr>
			<tr>
				<td><form:select path="reserveOptionName6" id="homeOption">
						<c:choose>
							<c:when test="${empty room}">
								<form:option path="reserveOptionName6" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName6" value="">-선택없음-</form:option>
								<c:forEach items="${room}" var="option">
									<form:option path="reserveOptionName6"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td><form:select path="reserveOptionName" id="homeOption">
						<c:choose>
							<c:when test="${empty yang}">
								<form:option path="reserveOptionName" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName" value="">-선택없음-</form:option>
								<c:forEach items="${yang}" var="option">
									<form:option path="reserveOptionName"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td><form:select path="reserveOptionName2" id="homeOption">
						<c:choose>
							<c:when test="${empty gimchi}">
								<form:option path="reserveOptionName2" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName2" value="">-선택없음-</form:option>
								<c:forEach items="${gimchi}" var="option">
									<form:option path="reserveOptionName2"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td><form:select path="reserveOptionName3" id="homeOption">
						<c:choose>
							<c:when test="${empty common}">
								<form:option path="reserveOptionName3" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName3" value="">-선택없음-</form:option>
								<c:forEach items="${common}" var="option">
									<form:option path="reserveOptionName3"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>



				<td><form:select path="reserveOptionName4" id="homeOption">
						<c:choose>
							<c:when test="${empty smart}">
								<form:option path="reserveOptionName4" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName4" value="">-선택없음-</form:option>
								<c:forEach items="${smart}" var="option">
									<form:option path="reserveOptionName4"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td><form:select path="reserveOptionName5" id="homeOption">
						<c:choose>
							<c:when test="${empty home}">
								<form:option path="reserveOptionName5" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName5" value="">-선택없음-</form:option>
								<c:forEach items="${home}" var="option">
									<form:option path="reserveOptionName5"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
			</tr>

			<tr>
				<td><input type="button" name="bth" id="btn"
					onclick="sample6_execDaumPostcode()" value="주소 검색"></td>
				<td><form:input path="reserveAddr" id="member_post"
						readonly="true" /></td>
				<td><form:input path="reserveAddr" id="member_addr"
						readonly="true" /><b>기본주소</b></td>
				<td><form:input path="reserveAddr" id="zonecode"
						readonly="true" /><b>읍면동</b></td>
				<td><form:input path="reserveAddr" id="sang" /><b>상세주소</b></td>
			</tr>
			<tr>
				<td><font>청소 날짜 선택</font></td>
				<td><form:input type="date" id="date" path="cleanDate" /></td>
			</tr>
		</table>
	</form:form>
	<div>
		<!-- 구매하기 버튼 추가 -->
		<button type="submit" id="btnBuy">예약하기</button>
		<button type="submit" id="btnList">취소하기</button>
	</div>
</div>
<script>
	$(document).ready(
			function() {
				var now_utc = Date.now();
				var timeOff = new Date().getTimezoneOffset() * 60000;
				var today = new Date(now_utc - timeOff).toISOString()
						.split("T")[0];
				document.getElementById("date").setAttribute("min", today);

				// 오늘로부터 5일 후의 날짜 구하기
				var fiveDaysLater = new Date(now_utc - timeOff + 5 * 24 * 60
						* 60 * 1000);
				var fiveDaysLaterString = fiveDaysLater.toISOString()
						.split("T")[0];
				document.getElementById("date").setAttribute("min",
						fiveDaysLaterString);

				var formObj = $("#reserve");
				// 구매하기 버튼 이벤트 처리
				$("#btnBuy").on("click", function() {
					// reserveAddr 값 읽기
					var reserveAddrValue = $("#member_post").val();

					// cleanDate 값 읽기
					var cleanDateValue = $("#date").val();

					// 값이 없을 경우 alert 띄우기
					if (!reserveAddrValue) {
						alert("주소검색 버튼을 눌러 값을 입력해주세요.");
						return;
					}

					if (!cleanDateValue) {
						alert("청소날짜를 입력해주세요.");
						return;
					}
					formObj.submit();
				});
				$("#btnList").on("click", function() {
					self.location = "../item/itemInfo";
				});
			});
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = datajibynAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("zonecode").value = extraAddr;
				} else {
					document.getElementById("zonecode").value = '';
				}
				document.getElementById('member_post').value = data.zonecode;
				document.getElementById("member_addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("chamgo").focus();

			}
		}).open();
	}
</script>