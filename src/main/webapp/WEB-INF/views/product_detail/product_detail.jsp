<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>제품상세페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<style>
	#product_payInfo .add {
		margin: 10px 0px;
  		width: 230px;
  	  	float: left;
  	  	font-size: 13px;
  	  	line-height: 17px;
  	  	display: block;
	}
	
	#optionCtn {
		margin-top: 15px; 
   		float: left;
    	width: 85px;
	}
	#optionCtn .cnt{
   		float: left;
   		padding: 3px 7px;
		border: solid 1px #aaaaaa;
	}
	
	#optionCtn .downBtn {
		all:unset;
		float: left;
		border-top: solid 1px #aaaaaa;
		border-bottom: solid 1px #aaaaaa;
		border-left: solid 1px #aaaaaa;
		padding: 4px 4px 5px 4px;
		text-align: center;
		font-size: 14px;
		color: #aaaaaa;
		font-weight: bold;
	}
	
	#optionCtn .upBtn {
		all:unset;
		float: left;
		border-top: solid 1px #aaaaaa;
		border-bottom: solid 1px #aaaaaa;
		border-right: solid 1px #aaaaaa;
		padding: 4px 4px 5px 4px;
		text-align: center;
		font-size: 14px;
		color: #aaaaaa;
		font-weight: bold;
	}
	
	 #opPrice {
		font-size: 14px;
   		color: #c80a1e;
    	margin: 16px 15px 0px 0px;
    	width: 85px;
    	line-height: 20px;
    	float: left;
    	text-align: right;
	}
	
	#total_price {
		margin-top:30px;
		width:460px;
	} 
		
	#opDelete {
	    background-color: white;
	    width: 20px;
	    height: 20px;
	    margin-top: 16px;
	    margin-left: 30px;
	    border: none;	
	    font-size: 13px;
	    text-align: center;
	}
	#opDelete:focus {
		outline: none;
	}
</style>
<script>
$(document).ready(function(){
	$("#product_colors").change(function(){		
		var price = "<%= vo.getPprice()%>";	
		if($("#product_colors option:selected").val() != "선택"){				
			$("#total_price span").text(price+"원"); 
			//$("#total_price").css("margin-left","300px");		
			$(".add_content").css("display","block");
		} else {
			$("#total_price span").text("0원"); 
			//$("#total_price").css("margin-left","354px");
		}
	});
	
	const price = parseInt($("#opPrice").text().replace(/ /gi,"").replace(/,/gi,""));
	let cnt = 1;
	let total = 0;
	
	$(".downBtn").click(function(){
		if(cnt == 1) {
			alert("최소 주문수량은 1개 이상입니다.");
			return;
		} else {
			cnt = cnt - 1;
			$(".cnt").text(cnt);
			total = price * cnt;
			$("#opPrice").text(comma(total+" 원"));
			$("#total_price span").text(comma(total+" 원"));
		}
	});
	
	$(".upBtn").click(function(){
		cnt = cnt + 1;
		$(".cnt").text(cnt);
		total = price * cnt;
		$("#opPrice").text(comma(total+" 원"));
			$("#total_price span").text(comma(total+" 원"));
	});
	
	$("#opDelete").click(function(){
		$(".add_content").css("display","none");	
		triggerChange();
		cnt = 1;
		$(".cnt").text(cnt);
		total = price * cnt;
		$("#opPrice").text(comma(total+" 원"));
		$("#total_price span").text("0원");
	});
	
	$("#payBtn").click(function(){
		if($("#product_colors option:selected").val() == "선택"){	
			alert("주문 옵션을 선택해주세요.");
			return;
		} else {
			<%if(mid !="") {%>
			alert("주문확인 페이지로 이동합니다.");		
			location.href='http://localhost:9000/sist_project_2/cart/order_form.jsp?pid=<%= vo.getPid()%>&id=<%=mid%>&cnt='+cnt;
			<%}else {%>
			alert("로그인 해주세요!");
			<%}%>
		}
	});
	
	$("#cartBtn").click(function(){
		if($("#product_colors option:selected").val() == "선택"){	
			alert("장바구니에 넣을 옵션을 선택해주세요.");
			return;
		} else {
			<%if(mid !="") {%>
				var info = confirm("장바구니 페이지로 이동할까요?");
				if(info) {
					alert("장바구니 페이지로 이동합니다.");
					location.href='http://localhost:9000/sist_project_2/cart/cartProc.jsp?pid=<%= vo.getPid()%>&id=<%=mid%>&cnt='+cnt;
				} else {
					$.ajax({
						url : 'http://localhost:9000/sist_project_2/cart/cartProc.jsp?pid=<%= vo.getPid()%>&id=<%=mid%>&cnt='+cnt,
						success : function(result) {
							if(result) {
								alert("장바구니에 상품이 등록되었습니다.");
							} else {
								alert("장바구니에 상품이 등록되지 않았습니다.")
							}
						}
					});
				}
			<%}else {%>
			alert("로그인 해주세요!");
			<%}%>
		}
        
     });
</script>
<body>
   <!-- header -->
    <jsp:include page="../header.jsp" />
    
    <!-- content -->
    <div class="product_detail_content"> 
       <div class="detail_wrapper">
          <div class="content-left" id="PD_content-left">
          	<section class="img-section">
          		<div class="productmain_img">
          			<img src="http://localhost:9000/sistproject3/images/제품상세1.jpg">
          		</div>
          		<div class="productmini_img">
	          		<ul>
	          			<li><img src="http://localhost:9000/sistproject3/images/제품상세1.jpg"></li>
	          			<li><img src="http://localhost:9000/sistproject3/images/제품상세2.jpg"></li>
	          			<li><img src="http://localhost:9000/sistproject3/images/제품상세3.jpg"></li>
	          			<li><img src="http://localhost:9000/sistproject3/images/제품상세4.jpg"></li>
	          		</ul>
          		</div>
          	 </section>
          	 <nav class="detail_nav_style">
          	 	<a href="#PD_product-info">작품정보</a>
          	 	<a href="#PD_product_delivery">배송/교환/환불</a>
          	 	<a href="#PD_product_review">구매후기</a>
          	 </nav>
          	 <section class="product-info" id="PD_product-info">
          	 	<p>
          	 		❤️레터링마카롱케이크의 🌟원조🌟맘대롱❤️
					<br>
					<br>
					🙅‍♀️🚫디자인도용 금지🚫🙅‍♀️
					<br>
					<br>
					💡주문전 꼭 읽어주세용💡
					<br>
					<br>
					⚠️공지⚠️
					<br>코로나로 배송환경이 좋지 않아 지연될 수 있으니
					<br>희망하는날보다 하루전으로 요청해주세요!
					<br>
					<br>✔️2인용 사이즈입니다✌️
					<br>(파티초서비스로 드려요)
					<br>
					<br>💜메인사진💜
					<br>스프링클디자인
					<br>2단레터링
					<br>
					<br>✔️ 출고후 1-2일내 수령
					<br>
					<br>영어는 기본:필기체
					<br>전부대문자기재시 고딕체
					<br>
					<br>고딕체원하시면 꼭 요청해주세요❗️
					<br>
					<br>✔️레터링색상: 빨/주/노/초/파/하/남/보/민트/흰/핑
					<br>
					<br>✔️택배수령
					<br>화•수•목•금
					<br>( 많은우체국이 이제 토요일에 배달하지않아요!)
					<br>
					<br>✔️도착시간 문의 및 요청은 받을 수 없어요!
					<br>(지역,기사님마다 다르답니다)
					<br>
					<br>✔️배송
					<br>택배사:우체국
					<br>
					<br>운송장은 5시부터 입력드립니다😊
					<br>
					<br>✔️제주,산간지역은 평균 2일배송소요됩니다!
					<br>
					<br>✔️묶음배송
					<br>2개이상구매시 같은날만 묶음배송가능합니다!
					<br>2개이상 픽업구매시 하나만 픽업옵션으로 선택해주세요!
					<br>
					<br>✔️배송중 파손에 의한
					<br>교환 및 환불이 불가능한 상품입니다
					<br>아이스박스+아이스팩+뽁뽁이로
					<br>꼼꼼하게 포장해드려요❤️
					<br>
					<br>✔️사이즈
					<br>약 16*14포장박스에 들어가는 사이즈입니다!
					<br>(햄버거박스에 들어가는사이즈보다 훨씬 큽니다)
					<br>
					<br>✔️“사이즈업”은 중량2배로 체크하며 제작되며
					<br>전체적으로 (상하좌우) 2-3센티씩 커집니다!
					<br>*참고*
					<br>기본사이즈 : 미니케이크
					<br>사이즈업 : 1호케이크
					<br>
					<br>✔️픽업장소
					<br>‼️제기동아니에요‼️
					<br>서울시 은평구 갈현동 406-1 2층
					<br>(짝태호프건물)
					<br>13:00-20:00
					<br>
					<br>✔️픽업배송비문의
					<br>배송비가 “자동결제” 시스템이라
					<br>픽업 옵션 선택시 배송비가 없어지는게아니라
					<br>배송비만큼 ”상품금액”에서
					<br>차감되도록 설정해 놓았습니다!
					<br>
					<br>❄️보관방법❄️
					<br>수령후 냉동보관2주내 섭취
					
					<br>취소는 “발송일”로부터 4일전까지만 가능합니다!
          	 	</p>
          	 	<div class="hashtag-box">
          	 		<div class="hashtag-box-txt">
          	 			<span>Category & Keyword</span>
          	 			<a href="">
          	 				<strong>음식</strong>
          	 			</a>
          	 		</div>
          	 	</div>
          	 	<div class="tab-style">
          	 		<div class="tab_split"></div>
          	 		<div class="tab_split"></div>
          	 		<div class="tab_split"></div>
          	 	</div>
          	 </section>
          	 <section class="product_delivery" id="PD_product_delivery">
          	 	<div class="title-style-sub-delivery">
          	 		<h3>배송/교환/환불 안내</h3>
          	 	</div>
          	 	<div>
          	 		<div class="PD_table">
          	 			<div class="product_delivery_th">
          	 				<p>배송비</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>기본료 : 3,000원</p>
          	 				<p>배송비 무료 조건 : 100,000원</p>
          	 			</div>
          	 		</div>
          	 		<div class="PD_table">
          	 			<div class="product_delivery_th">
          	 				<p>제작 / 배송</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>7일 이내</p>
          	 				<p>주문 후 제작에 들어가는 작품입니다.</p>
          	 			</div>
          	 		</div>
          	 		<div class="PD_table"  style="border-bottom: 1px solid #d9d9d9;">
          	 			<div class="product_delivery_th">
          	 				<p>교환 / 환불</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>불가</p>
          	 				<p>주문 전 판매 작가님과 연락하여 확인해주세요.</p>
          	 			</div>
          	 		</div>
          	 	</div>
          	 </section>
          	 <section class="product_review" id="PD_product_review">
          	 	<div class="title-style-sub">
          	 		<h3>구매후기</h3>
          	 	</div>
          	 	<ul class="PD_list-style-review">
          	 		<li>
          	 			<div class="PD_review_user">
          	 				<div>
          	 					<div class="PD_review_user_img">
          	 						<img src="http://localhost:9000/sistproject3/images/icon_review_user.jpg">
          	 					</div>
          	 					<div class="PD_review_user_txtbox">
          	 						<p>user</p>
          	 						<p  style="color: #999;">2021년 1월 24일</p>
          	 					</div>
          	 					<div class="PD_review_rating">
          	 						<span class="span_ui_rating">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
									</span>	
          	 					</div>
          	 				</div>
          	 				<span></span>
          	 			</div>
          	 			<div class="PD_review_txt_area">
          	 				<div class="PD_review_cell">
          	 					<img src="http://localhost:9000/sistproject3/images/제품상세1.jpg">
          	 				</div>
          	 				<div class="PD_review_cell_txt">
          	 					<span>
          	 					달지 않고 크림치즈는 진짜 맛있고 초코도 달지 않고 진짜 짱이에요. 하나 더 지금 시키려구 해요.
          	 					예쁘고 깨진곳 없이와서 좋 아요!
								지정발송일 다음날에 바로와서
								친구생일에 딱맞춰서 줬어요b
          	 					</span>
          	 				</div>
          	 			</div>
          	 		</li>
          	 	</ul>
          	 </section>
          </div>
          <div class="product_sidebar">
	          	<div class="artist_card">
	          		<div class="artist_card_split">
	          			<a href="" class="artist_card_link">
	          				<div class="artist_card_img">
	          					<img src="http://localhost:9000/sistproject3/images/맘대롱.jpg">
	          				</div>
	          				<span class="artist_card_label">맘대롱 스튜디오 ></span>
	          			</a>
	          		</div>
	          	</div>
	          	<h2 class="aside_product-title">레터링 마카롱 케이크 ❤️생일선물 기념일 새해</h2>
	          	<div class="aside_product-info">
	          		<div class="price_tag_detail">
	          			<span class="price_tag_strong">
	          				<strong>18,900</strong>원
	          			</span>
	          		</div>
	          		<div class="product-define-info">
	          			<div>
	          				<span class="span-title-txt">구매후기</span>
	          				<a href="">
		          				<span class="span_ui_rating">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
								</span>	
							</a>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">배송비</span>
	          				<span class="bold-txt">3000원</span>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">배송 시작</span>
	          				<span class="bold-txt">최대 7일 이내</span>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">수량</span>
	          				<span class="bold-txt">주문시 제작</span>
	          			</div>
	          			<div>
							<select name="product_colors" id="product_colors">
						  		<option value="선택">[필수] 색상을 선택해주세요</option>
						  		<%-- <option value="color"><%= vo.getColor() %> <%= vo.getPprice()%>원</option> --%>
						  		<option value="pink">핑크</option>
						  		<option value="blue">하늘</option>
						  	</select>
					  	</div>
						<li><hr style="margin:20px 0px;"></li>
					  	<li class="add_content" style="display: none;">
					  		<div class="add">
					  			<b>[필수]</b>
				 				&nbsp;&nbsp;
				 				<span style="line-height: 20px"><%=vo.getPinfo() %></span>
				 				<br>
				 				<span style="color:#AAAAAA; line-height:20px;"> 색상 : <%= vo.getColor() %></span>
				  			</div>
				  			<div id="optionCtn">
				  				<button class="downBtn"><</button>
				  				<div class="cnt">1</div>
				  				<button class="upBtn">></button>
				  			</div>
				  			<div id="opPrice"><%= vo.getPprice() %> 원</div>
							<button type="button" id="opDelete">❌</button>
						  	<hr style="margin-top:65px;">
				  		</li>
					  	<li class=total_price>
					  		<div id="total_price">
						  		총 구매가<span style="float:right;"> 0 원</span>
					  		</div>
					  	</li>
					  	
					  	
	          		</div>
	          	</div>
	          	<div class="tab-style">
	          	</div>
	          	<div>
	          		<div class="btn_box">
	          			<button class="btn_cart">장바구니</button>
	          			<button class="btn_buy">구매하기</button>
	          		</div>
	          	</div>
          </div> 
       </div>
    </div>
    
    
    <!-- footer -->
   <jsp:include page="../footer.jsp" />
</body>
</html>