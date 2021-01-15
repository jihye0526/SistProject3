<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>악세사리 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/dw.css">
	</head>
	<body class="category">
		<section class="category_menu">
			<div class="category_top_menu">
				<h2>악세사리</h2>
				<div class="filter_top">
					<ul>
						<li>
							<label>배송</label>
							<input type="checkbox" name="free" value="무료배송" class="f"><span class="rchk">무료배송</span>
						</li>
						<li>
							<label>가격대</label>
							<input type="checkbox" name="price" value="1만원미만"><span class="rchk">1만원미만</span>
							<input type="checkbox" name="price" value="1만원대"><span class="rchk">1만원대</span>
							<input type="checkbox" name="price" value="2만원대"><span class="rchk">2만원대</span>
							<input type="checkbox" name="price" value="3만원대"><span class="rchk">3만원대</span>
							<input type="checkbox" name="price" value="4만원대"><span class="rchk">4만원대</span>
							<input type="checkbox" name="price" value="5만원 이상"><span class="rchk">5만원 이상</span>
						</li>
					</ul>
				</div>
				
				<div class="filter_bottom">
					<div class="check_images">
						<button class="img_btn">
							<div>
								<input type="checkbox" name="image" value="false">
								<span class="rchk">이미지만 볼래요</span>
							</div>
						</button>
					</div>
					
					<div class="selector">
						<select id="selector">
							<option value="popular">인기순</option>
							<option value="new_product">최신순(NEW)</option>
							<option value="favorite">즐겨찾기 많은 순</option>
							<option value="review">구매후기 많은 순</option>
							<option value="purchase">판매수 많은 순</option>
							<option value="low_price">낮은 가격 순</option>
							<option value="high_price">높은 가격 순</option>
						</select>
					</div>
				</div>
			</div>
		</section>
		
		<section class="category_content">
			<div class="category_content">
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<button class="favorite_btn">
									<img src="http://localhost:9000/sistproject3/images/favorite.png">
								</button>
							</div>
							<div>
								<img src="http://localhost:9000/sistproject3/images/accessory1.jpg">
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">투링❤️커플각인반지샵</div>
							<div class="prod_info_title">[무료배송] 각인 써지컬 3mm반지 커플 우정 선물</div>
							<div class="prod_info_price">7,900원</div>
							<div class="prod_info_review">
								<div class="rv">후기</div>
								<div class="rv2">반지 사이즈도 잘 맞고, 각인 새긴 것도 마음에 들어요</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<button class="favorite_btn">
									<img src="http://localhost:9000/sistproject3/images/favorite.png">
								</button>
							</div>
							<div>
								<img src="http://localhost:9000/sistproject3/images/accessory2.jpg">
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">투링❤️커플각인반지샵</div>
							<div class="prod_info_title">[무료배송] 각인 써지컬 3mm반지 커플 우정 선물</div>
							<div class="prod_info_price">7,900원</div>
							<div class="prod_info_review">
								<div class="rv">후기</div>
								<div class="rv2">반지 사이즈도 잘 맞고, 각인 새긴 것도 마음에 들어요</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<button class="favorite_btn">
									<img src="http://localhost:9000/sistproject3/images/favorite.png">
								</button>
							</div>
							<div>
								<img src="http://localhost:9000/sistproject3/images/accessory1.jpg">
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">투링❤️커플각인반지샵</div>
							<div class="prod_info_title">[무료배송] 각인 써지컬 3mm반지 커플 우정 선물</div>
							<div class="prod_info_price">7,900원</div>
							<div class="prod_info_review">
								<div class="rv">후기</div>
								<div class="rv2">반지 사이즈도 잘 맞고, 각인 새긴 것도 마음에 들어요</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<button class="favorite_btn">
									<img src="http://localhost:9000/sistproject3/images/favorite.png">
								</button>
							</div>
							<div>
								<img src="http://localhost:9000/sistproject3/images/accessory2.jpg">
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">투링❤️커플각인반지샵</div>
							<div class="prod_info_title">[무료배송] 각인 써지컬 3mm반지 커플 우정 선물</div>
							<div class="prod_info_price">7,900원</div>
							<div class="prod_info_review">
								<div class="rv">후기</div>
								<div class="rv2">반지 사이즈도 잘 맞고, 각인 새긴 것도 마음에 들어요</div>
							</div>
						</div>
					</a>
				</div>
			
		</section>
	</body>
</html>