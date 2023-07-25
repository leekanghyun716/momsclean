<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.product-img {
	max-width: 300px;
	max-height: 300px;
	object-fit: cover;
}

.itemList {
	border-left: 1px solid black;
	border-right: 1px solid black;
	width: 1080px;
	height: 1800px;
	margin: auto;
}

table {
	float: left;
	margin-left: 50px;
}

footer {
	float: none;
}

.itemInfoImg{
	width: 530px;
}
.itemTable{
	float:none;
	margin:0px;
}
.option{
	width: 600px;
	margin-left:100px;
	
}
#optionDiv{
	float:left;
	width:100%;
	height:1130px;
	margin:auto;
}
hr{
border:1px solid black;
}
</style>

<div class="itemList">
<h2>상품정보</h2>
	<c:choose>
		<c:when test="${empty list}">
			<p>상품이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="item">
				<table>

					<tr>
						<td align="center"><img class="product-img"
							src="display?itemNo=${item.itemNo}" data-toggle="modal"
							alt="${item.itemNo}">
							 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				
			</div>
			<div class="modal-body">
				<table class="itemTable">
					<tr>
						<td>
							<img class="itemInfoImg"
							src="display2?itemNo=${item.itemNo}"  data-toggle="modal">
						</td>
					</tr>					
				</table>
			</div>
										<div class="modal-footer">
											<button id="modalSubmit" type="button"
												class="btn btn-success">예약하기</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
	</div>
</div></td>
					</tr>
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div id="optionDiv"><img class="option"
							src="display3"  data-toggle="modal"></div>
	
</div>
<script type="text/javascript">
	var action = '';
	var type = '';

	$(document).ready(function() {
			var itemName2;
		// 새 글 쓰기 버튼 클릭
		$(".product-img").click(function() {
			var itemName = $(this).attr("alt");
			itemName2= $(this).attr("alt");
			$(".itemInfoImg").attr("src", "display2?itemNo="+itemName);
			action = 'create';
			type = 'POST'
			$("#myModal").modal();
		});

		// Modal의 Submit 버튼 클릭
		$("#modalSubmit").click(function() {
			
			self.location = "../reserve/reserveRegister?itemNo="+itemName2;
		});

	});
</script>