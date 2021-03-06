<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>검색 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script>
			$(document).ready(function(){
				var uemail = "${sessionScope.svo.uemail}";
				search_list("new");
				
				$("#selector").on('change',function(){
					var sname = $("#selector").val();
					
					search_list(sname);
				});
				
				function search_list(sname){
					$.ajax({
						url:"search_ajax_list.do?search=${search}&sname="+sname+"&uemail=${sessionScope.svo.uemail}",
						success:function(result){
							var jdata = JSON.parse(result);
							var output = "";
							
							for(var i in jdata.jlist){ 
								output += "<div class='product'>";
								output += "<div class='prod_img'>";
								output += "<div>";
								output += "<button class='favorite_btn' value='" + jdata.jlist[i].pid + "'>";
								var n = 0;
								for(var j in jdata.jlist2){
									if(jdata.jlist[i].pid == jdata.jlist2[j].pid){
										output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
										output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="'+jdata.jlist[i].pid+'_star">';
										output += '</button>';
										n = 1;
									}
								}
								if(n != 1){
									output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
									output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="'+jdata.jlist[i].pid+'_star">';
									output += '</button>';
								}
								output += "</button>";
								output += "</div>";
								output += "<a href='http://localhost:9000/sistproject3/product.do?pid="+ jdata.jlist[i].pid +"'>";
								output += "<div>";
								output += "<img src='http://localhost:9000/sistproject3/resources/upload/"+ jdata.jlist[i].psfile1 +"'>";
								output += "</div>";
								output += "<div class='product_info'>";
								output += "<div class='prod_info_name'>"+ jdata.jlist[i].sname +"</div>";
								output += "<div class='prod_info_title'>"+ jdata.jlist[i].ptitle +"</div>";
								output += "<div class='prod_info_price'>"+ jdata.jlist[i].pprice_char +"원</div>";
								output += "<div class='prod_info_review'>";
								output += "<div class='rv'>후기</div>";
								output += "<div class='rv2'>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>";
								output += "</div>";
								output += "</div>";
								output += "</a>";
								output += "</div>";
								output += "</div>";
							}
							
							$("div.search_content").text("").append(output);
						}
					});
				}
				
				$(document).on("click",".favorite_btn",function(){
					var btn_pid = $(this).val(); 
					var wish_img_id = "#"+btn_pid+"_star";
					var wish_img_attr = $(wish_img_id).attr("src"); 
					if(uemail !="") {
						if(wish_img_attr == "http://localhost:9000/sistproject3/images/favorite.png"){
							$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/star2.png');
							$.ajax({
								url:"wish_insert.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
								success:function(result){
									if(result == 1){
										//$("div.category_content").text("");
										ajax_list();
									}		 
								}
							});//ajax
						}else{
							$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/favorite.png');
							$.ajax({
								url:"wish_delete.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
								success:function(result){
								 
								}
							});//ajax
						}
					}else {
						alert("로그인을 먼저 진행해 주세요!");
						location.href='http://localhost:9000/sistproject3/login.do';
					}
				});
				
				/* function search_list(sname){
					$.ajax({
						url:"search_ajax_list.do?search=${search}&sname="+sname,
						success:function(result){
							var jdata = JSON.parse(result);
		                  
							var output = "";
		                  
							for(var i in jdata.jlist){ 
								output += "<div class='product'>";
								output += "<a href='http://localhost:9000/sistproject3/product.do?pid="+ jdata.jlist[i].pid +"'>";
								output += "<div class='prod_img'>";
								output += "<div>";
								output += "<button class='favorite_btn'>";
								output += "<img src='http://localhost:9000/sistproject3/images/favorite.png'>";
								output += "</button>";
								output += "</div>";
								output += "<div>";
								output += "<img src='http://localhost:9000/sistproject3/resources/upload/"+ jdata.jlist[i].psfile1 +"'>";
								output += "</div>";
								output += "</div>";
								output += "<div class='product_info'>";
								output += "<div class='prod_info_name'>"+ jdata.jlist[i].sname +"</div>";
								output += "<div class='prod_info_title'>"+ jdata.jlist[i].ptitle +"</div>";
								output += "<div class='prod_info_price'>"+ jdata.jlist[i].pprice_char +"원</div>";
								output += "<div class='prod_info_review'>";
								output += "<div class='rv'>후기</div>";
								output += "<div class='rv2'>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>";
								output += "</div>";
								output += "</div>";
								output += "</a>";
								output += "</div>";
							}
							
							$("div.search_content").text("").append(output);
						}
					});
				} */
			});
		</script>
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
	 
		<section class="search_menu">
			<div class="search_top_menu">
				<h2>"${search}" 에 대한 작품 검색결과</h2>
				<div class="filter_bottom">
					<div class="selector">
						<select id="selector">
							<option value="new">최신순(NEW)</option>
							<option value="purchase">판매수 많은 순</option>
							<option value="low">낮은 가격 순</option>
							<option value="high">높은 가격 순</option>
						</select>
					</div>
				</div>
			</div>
		</section>
		
		<section class="search_content">
			<div class="search_content">
			</div>
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>




