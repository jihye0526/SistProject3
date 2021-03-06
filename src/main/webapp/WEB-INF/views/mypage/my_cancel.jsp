<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : "${dbCount}",
			pageSize : "${pageSize}",
			page : "${reqPage}",
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			$(location).attr('href','http://localhost:9000/sistproject3/my_cancel.do?rpage=' + e.page);
		});
	});
</script>
<style>
span.write_button{
border:1px solid rgb(204, 204, 204);padding: 5px 12px;
text-decoration:none;
}
table.my_cancel a{
text-decoration:none;
color:black;}
.p_img{
width:100px;
height:100px;}
.img_td{
width:80px;
}
.title_td{
text-indent:10px;
}
</style>

</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	<h2>취소내역</h2>
	<c:forEach var="vo" items="${list}">
	<table class="my_cancel">
	<tr>
	<td>
		<input type="hidden" name="uemail" value="${vo.uemail }">
		<input type = "hidden" name = "pid" value = "${vo.pid }">
		<input type = "hidden" name = "oid" value = "${vo.oid}">
		</td></tr>
		<tr>
			<td height ="40" colspan=2>주문날짜 : ${vo.rdate }  &nbsp;취소날짜 : ${vo.cdate }</td>
			<td colspan=1>${vo.total_price }원</td>
		</tr>

		<tr>
			<td class = "img_td"rowspan=2><img class = "p_img" src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"></td>
			<td class = "title_td"rowspan=2><b>${vo.ptitle }</b></td>
			<td width =100 rowspan =2><a href = "orderDelete.do?oid=${vo.oid}"><button type  ="submit" id = "cancelBtn" >내역삭제</button></a></td>
			
		</tr>
		


	</table>
	</c:forEach>
	<div class = "cancel_paging"><div id="ampaginationsm"></div></div>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>