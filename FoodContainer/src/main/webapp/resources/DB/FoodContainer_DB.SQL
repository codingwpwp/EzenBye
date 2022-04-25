-- 회원
CREATE TABLE member
(
	member_index INT AUTO_INCREMENT PRIMARY KEY,
	id VARCHAR(255) NOT NULL,
	pw VARCHAR(500) NOT NULL,
	name VARCHAR(255) NOT NULL,
	nickname VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	point INT DEFAULT 0,
	join_date DATETIME DEFAULT NOW(),
	recommender VARCHAR(255),
	event_ticket INT DEFAULT 0,
	position VARCHAR(255) DEFAULT '일반',
	address VARCHAR(500),
 	del_yn CHAR(1) DEFAULT 'N',
 	del_date DATETIME,
 	del_reason VARCHAR(500)
);

-- 쪽지함
CREATE TABLE message
(
	message_index INT AUTO_INCREMENT PRIMARY KEY,
 	member_index INT NOT NULL,
 	title VARCHAR(255) NOT NULL,
 	contents VARCHAR(500) NOT NULL,
 	send_date DATETIME DEFAULT NOW(),
 	read_yn CHAR(1) DEFAULT 'N',
 	del_yn CHAR(1) DEFAULT 'N',
 	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 쿠폰
CREATE TABLE coupon
(
	coupon_index INT AUTO_INCREMENT PRIMARY KEY,
 	member_index INT NOT NULL,
 	coupon_title VARCHAR(255) NOT NULL,
 	discount_percent INT NOT NULL,
 	make_date DATETIME DEFAULT NOW(),
 	used_yn CHAR(1) DEFAULT 'N',
 	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 상품
CREATE TABLE product
(
	product_index VARCHAR(255) PRIMARY KEY,
	bigSort VARCHAR(255) NOT NULL,
	middleSort VARCHAR(255) NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	origin_price INT NOT NULL,
	sale_price INT,
	brand VARCHAR(255) NOT NULL,
	inventory INT NOT NULL,
	quantity INT DEFAULT 0,
	delivery_free_YN CHAR(1) NOT NULL,
	thumbnail_image VARCHAR(500) NOT NULL,
	detail_image VARCHAR(500) NOT NULL,
	product_date DATETIME DEFAULT NOW(),
	del_YN CHAR(1) DEFAULT 'N'
);

-- 관심상품
CREATE TABLE dibs
(
	product_index VARCHAR(255),
	member_index INT,
	dib_date DATETIME DEFAULT NOW(),
	FOREIGN KEY(product_index) REFERENCES product (product_index),
	FOREIGN KEY(member_index) REFERENCES member (member_index),
	PRIMARY KEY(product_index, member_index)
);

-- 장바구니
CREATE TABLE cart
(
	cart_index INT AUTO_INCREMENT PRIMARY KEY,
	product_index VARCHAR(255) NOT NULL,
	member_index INT NOT NULL,
	cart_count INT NOT NULL,
	cart_date DATETIME DEFAULT NOW(),
	FOREIGN KEY(product_index) REFERENCES product (product_index),
	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 회원 주문정보
CREATE TABLE orders
(
	member_order_index VARCHAR(255) PRIMARY KEY,
	member_index INT NOT NULL,
	address VARCHAR(500) NOT NULL,
	reciever VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NOT NULL,
	request VARCHAR(500) DEFAULT '없음',
	delivery_free_YN CHAR(1) NOT NULL,
	coupon_index INT,
	used_point INT DEFAULT 0,
	pay_price INT NOT NULL,
	order_date DATETIME DEFAULT NOW(),
	FOREIGN KEY(member_index) REFERENCES member (member_index),
	FOREIGN KEY(coupon_index) REFERENCES coupon (coupon_index)
);

-- 비회원 주문정보
create table no_member_orders
(
	no_member_order_index VARCHAR(255) PRIMARY KEY,
	pw VARCHAR(500) NOT NULL,
	name VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	address VARCHAR(500) NOT NULL,
	reciever VARCHAR(255) NOT NULL,
	reciever_phone VARCHAR(255) NOT NULL,
	request VARCHAR(500) DEFAULT '없음',
	delivery_free_YN CHAR(1) NOT NULL,
	pay_price INT NOT NULL,
	order_date DATETIME DEFAULT NOW()
);

-- 주문 상세정보
CREATE TABLE order_product
(
	member_order_index VARCHAR(255),
	no_member_order_index VARCHAR(255),
	orderItem_index VARCHAR(255) NOT NULL,
	product_index VARCHAR(255) NOT NULL,
	order_quantity INT NOT NULL,
	price INT NOT NULL,
	order_status VARCHAR(255) DEFAULT '배송준비중',
	point INT NOT NULL,
	buy_YN CHAR(1) DEFAULT 'N',
	review_YN CHAR(1) DEFAULT 'N',
	FOREIGN KEY(member_order_index) REFERENCES orders (member_order_index),
	FOREIGN KEY(no_member_order_index) REFERENCES no_member_orders (no_member_order_index),
	FOREIGN KEY(product_index) REFERENCES product (product_index)
);

-- 리뷰
CREATE TABLE review
(
	review_index INT AUTO_INCREMENT PRIMARY KEY,
	product_index VARCHAR(255) NOT NULL,
	member_index INT NOT NULL,
	image VARCHAR(500),
	star_count INT NOT NULL,
	contents VARCHAR(500) NOT NULL,
	review_date DATETIME DEFAULT NOW(),
	del_YN CHAR(1) DEFAULT 'N',
	FOREIGN KEY(product_index) REFERENCES product (product_index),
	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 레시피
CREATE TABLE recipe
(
	recipe_index INT AUTO_INCREMENT PRIMARY KEY,
 	member_index INT NOT NULL,
  	title VARCHAR(255) NOT NULL,
  	thumbnail_image VARCHAR(500) NOT NULL,
  	contents LONGTEXT NOT NULL,
  	product_index1 VARCHAR(255) NOT NULL,
  	product_index2 VARCHAR(255),
  	product_index3 VARCHAR(255),
  	hit INT DEFAULT 0,
  	thumb INT DEFAULT 0,
   	write_date DATETIME DEFAULT NOW(),
   	best_rank INT,
   	del_yn CHAR(1) DEFAULT 'N',
	FOREIGN KEY(member_index) REFERENCES member (member_index),
	FOREIGN KEY(product_index1) REFERENCES product (product_index),
	FOREIGN KEY(product_index2) REFERENCES product (product_index),
	FOREIGN KEY(product_index3) REFERENCES product (product_index)
);

-- 댓글
CREATE TABLE reply
(
	reply_index INT AUTO_INCREMENT PRIMARY KEY,
	recipe_index INT NOT NULL,
	member_index INT NOT NULL,
	contents VARCHAR(500) NOT NULL,
	reply_date DATETIME DEFAULT NOW(),
	del_yn CHAR(1) DEFAULT 'N',
	FOREIGN KEY(recipe_index) REFERENCES recipe (recipe_index),
	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 추천
CREATE TABLE thumb
(
	recipe_index INT,
	member_index INT,
	FOREIGN KEY(recipe_index) REFERENCES recipe (recipe_index),
	FOREIGN KEY(member_index) REFERENCES member (member_index),
 	PRIMARY KEY(recipe_index, member_index)
);

-- 공지사항
CREATE TABLE notice
(
   notice_index INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   hit INT DEFAULT 0,
   contents LONGTEXT NOT NULL,
   write_date DATETIME DEFAULT NOW(),
   del_YN char(1) DEFAULT 'N'
);

-- 고객센터
CREATE TABLE serviceCenter
(
	serviceCenter_index INT AUTO_INCREMENT PRIMARY KEY,
	member_index INT NOT NULL,
	sort1 VARCHAR(255) NOT NULL,
	sort2 VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL,
	contents LONGTEXT NOT NULL,
	progress VARCHAR(255) DEFAULT '처리중',
	write_date DATETIME DEFAULT NOW(),
	del_YN CHAR(1) DEFAULT 'N',
	FOREIGN KEY(member_index) REFERENCES member (member_index)
);

-- 고객센터 답변
CREATE TABLE serviceCenter_reply
(
	serviceCenter_reply_index INT AUTO_INCREMENT PRIMARY KEY,
	serviceCenter_index INT NOT NULL,
	contents VARCHAR(500) NOT NULL,
	reply_date DATETIME DEFAULT NOW(),
	FOREIGN KEY(serviceCenter_index) REFERENCES serviceCenter (serviceCenter_index)
);

-- 배너
CREATE TABLE banner
(
	banner_index INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	image VARCHAR(500) NOT NULL,
	link_YN CHAR(1) DEFAULT 'N',
	link VARCHAR(1500),
	register_date DATETIME DEFAULT NOW()
);


-- 상품 백업용
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01A','즉석식품','국','돼지고기 김치찌개',10000,5000,'CJ',100,'Y','돼지고기 김치찌개.png','돼지고기 김치찌개 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01B','즉석식품','국','소고기 미역국',10000,'CJ',100,'N','소고기 미역국.png','소고기 미역국 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01C','즉석식품','국','수삼갈비탕',10000,5000,'CJ',100,'Y','수삼갈비탕.png','수삼갈비탕 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02A','즉석식품','반찬','메추리알 장조림',10000,'CJ',100,'Y','메추리알 장조림.png','메추리알 장조림 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02B','즉석식품','반찬','무말랭이 무침',10000,5000,'CJ',100,'N','무말랭이 무침.png','무말랭이 무침 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02C','즉석식품','반찬','소고기 장조림',10000,5000,'CJ',100,'N','소고기 장조림.png','소고기 장조림 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02D','즉석식품','반찬','오징어채 볶음',10000,5000,'CJ',100,'Y','오징어채 볶음.png','오징어채 볶음 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01A','냉동식품','볶음밥','깍두기 볶음밥',10000,'CJ',100,'N','깍두기 볶음밥.png','깍두기 볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01B','냉동식품','볶음밥','새우 볶음밥',10000,5000,'CJ',100,'N','새우 볶음밥.png','새우 볶음밥 상세.png');
insert into product(product_index,bigsort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01C','냉동식품','볶음밥','스팸 김치 볶음밥',10000,'CJ',100,'N','스팸 김치 볶음밥.png','스팸 김치 볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01D','냉동식품','볶음밥','중화게살 볶음밥',10000,5000,'CJ',100,'Y','중화게살 볶음밥.png','중화게살 볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02A','냉동식품','치킨,만두','김치 왕교자',10000,5000,'CJ',100,'N','김치 왕교자.png','김치 왕교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02B','냉동식품','치킨,만두','납작 군만두',10000,'CJ',100,'Y','납작 군만두.png','납작 군만두 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02C','냉동식품','치킨,만두','매운 왕교자',10000,5000,'CJ',100,'N','매운 왕교자.png','매운 왕교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02D','냉동식품','치킨,만두','왕교자',10000,'CJ',100,'N','왕교자.png','왕교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03A','즉석식품','컵밥,햇반','BIG 스팸 김치덮밥',10000,5000,'CJ',100,'N','BIG 스팸 김치덮밥.png','BIG 스팸 김치덮밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03B','즉석식품','컵밥,햇반','버터장조림 비빔밥',10000,5000,'CJ',100,'N','버터장조림 비빔밥.png','버터장조림 비빔밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03C','즉석식품','컵밥,햇반','철판 제육덮밥',10000,'CJ',100,'N','철판 제육덮밥.png','철판 제육덮밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03D','즉석식품','컵밥,햇반','햇반 큰 공기',10000,5000,'CJ',100,'N','햇반 큰 공기.png','햇반 큰 공기 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03E','즉석식품','컵밥,햇반','햇반 흑미밥',10000,'CJ',100,'N','햇반 흑미밥.png','햇반 흑미밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR03F','즉석식품','컵밥,햇반','황태국밥',10000,5000,'CJ',100,'N','황태국밥.png','황태국밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01E','즉석식품','국','남도식 한우미역국',10000,5000,'오뚜기',100,'N','남도식 한우미역국.png','남도식 한우미역국 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01F','즉석식품','국','마포식 차돌된장찌개',10000,5000,'오뚜기',100,'N','마포식 차돌된장찌개.png','마포식 차돌된장찌개 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01G','즉석식품','국','수원식 우거지갈비탕',10000,'오뚜기',100,'N','수원식 우거지갈비탕.png','수원식 우거지갈비탕 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR01H','즉석식품','국','옛날 설렁탕',10000,'오뚜기',100,'Y','옛날 설렁탕.png','옛날 설렁탕 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02E','즉석식품','반찬','고추참치',10000,'오뚜기',100,'N','고추참치.png','고추참치 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PR02F','즉석식품','반찬','오뚜기 햄',10000,'오뚜기',100,'N','오뚜기 햄.png','오뚜기 햄 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01E','냉동식품','볶음밥','맛있는 김치볶음밥',10000,'오뚜기',100,'N','맛있는 김치볶음밥.png','맛있는 김치볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01F','냉동식품','볶음밥','맛있는 쇠고기볶음밥',10000,5000,'오뚜기',100,'N','맛있는 쇠고기볶음밥.png','맛있는 쇠고기볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01G','냉동식품','볶음밥','베이컨 치즈볶음밥',10000,'오뚜기',100,'N','베이컨 치즈볶음밥.png','베이컨 치즈볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI01H','냉동식품','볶음밥','오즈키친 철판 낙지볶음밥',10000,'오뚜기',100,'N','오즈키친 철판 낙지볶음밥.png','오즈키친 철판 낙지볶음밥 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02E','냉동식품','치킨,만두','교자 새우&홍게살',10000,5000,'오뚜기',100,'Y','교자 새우&홍게살.png','교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02F','냉동식품','치킨,만두','교자 고기&제주마늘',10000,'오뚜기',100,'N','교자 고기&제주마늘.png','교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,sale_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02G','냉동식품','치킨,만두','미니 군만두 고기',10000,5000,'오뚜기',100,'N','미니 군만두 고기.png','교자 상세.png');
insert into product(product_index,bigSort,middleSort,product_name,origin_price,brand,inventory,delivery_free_YN,thumbnail_image,detail_image)
values('PI02H','냉동식품','치킨,만두','오즈키친 마늘간장치킨',10000,'오뚜기',100,'N','오즈키친 마늘간장치킨.png','오즈키친 마늘간장치킨 상세.png');

-- 테이블삭제쿼리
/*
drop table banner;
drop table serviceCenter_reply;
drop table serviceCenter;
drop table notice;
drop table thumb;
drop table reply;
drop table recipe;
drop table review;
drop table order_product;
drop table no_member_orders;
drop table orders;
drop table cart;
drop table dibs;
drop table message;
drop table product;
drop table coupon;
drop table member;
*/
