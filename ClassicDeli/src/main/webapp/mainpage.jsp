<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Cart> cartList =(ArrayList<Cart> )session.getAttribute("cart-list");
	if(cartList != null){
	request.setAttribute("cart_list", cartList);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
    <title>Classic Deli</title>
</head>
<body>
    <div class="mainpage">
         <%@ include file="/includes/header.jsp"%>
        <!-- Slider + block -->
        <div class="slider-block_container">
        	<div class="slider">
		        <div class="aspect-ratio-169">
		            <img class="slide" src="assets/Img/slider/slide1.png" alt="">
		            <img class="slide" src="assets/Img/slider/slide2.jpg" alt="">
		            <img class="slide" src="assets/Img/slider/slide3.jpg"  alt="">
		        </div>
		        <div class="prev-next_container">
		            <div class="prev"><i class="ti-angle-left"></i></div>
		            <div class="next"><i class="ti-angle-right"></i></div>
		        </div>
    		</div>
    		
    		<div class="block-list">
    			<div class="row-1">
	    			<div class="block-item">
	    				<div class="block-img_around"><img src="assets/Img/block/block1.png" alt="" class="block-img"></div>
	            		<span class="block-header">Secured payment</span>
	            		<span class="block-desc">Bank transfer or cash-on-delivery payments</span>
	    			</div>
	    			<div class="block-item">
	    				<div class="block-img_around"><img src="assets/Img/block/block2.png" alt="" class="block-img"></div>
	            		<span class="block-header">Quality products</span>
	            		<span class="block-desc">Only the best prodcuts from all the world</span>
	    			</div>		
    			</div>
    			<div class="row-2">
	    			<div class="block-item">
	    				<div class="block-img_around"><img src="assets/Img/block/block3.png" alt="" class="block-img"></div>
	            		<span class="block-header">Quick deals</span>
	            		<span class="block-desc">Promo Codes and sales all year long</span>
	    			</div>
	    			<div class="block-item">
	    				<div class="block-img_around"><img src="assets/Img/block/block4.png" alt="" class="block-img"></div>
	            		<span class="block-header">Fast delivery</span>
	            		<span class="block-desc">Order today, delivery tomorrow</span>
	    			</div>		
    			</div>
    		</div>
    		
        </div> 
        <div class="gift_card">
    		<div class="head">
    			<div class="head_info">
    				<p class="head_info-line1">The Classic Cards</p>
    				<p class="head_info-line2">Treat your friends with our gift cards !</p>
    				<a href="" class="head_info-line3">Purchase now</a>
    			</div>
    				
    			<div class="head_img">
    				<img alt="" src="./assets/Img/giftcard/img1.jpg">
    			</div>
    		</div>
    		
    		<div class="body">
    			<div class="body_info">
    				<a href="" class="body_info-line1">We select the best from the world & bring it to you</a>
    				<a href="" class="body_info-line2">Learn more about our partners </a>
    			</div>
    			
    			<div class="body_img">
    				<img alt="" src="./assets/Img/giftcard/img2.jpg">
    			</div>
    		</div>
    		
    		<div class="foot">
    			<div class="foot_info">
    				<p class="foot_info-line1">The Classic news</p>
    				<p class="foot_info-line2">You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.</p>
    			</div>
    			<input class="foot_input" placeholder="Your email address">
    			<button class="foot_btn">Subcribe</button>
    		</div> 
        
       <%@ include file="/includes/footer.jsp" %>
    
  
    
    
 
  <script type="text/javascript">
  
  var currentIndex = 0;
  var slides = document.getElementsByClassName('slide');
		
		  // Hiển thị slide hiện tại
		  function showSlide(index) {
		      for (var i = 0; i < slides.length; i++) {
		          slides[i].style.display = 'none';
		      }
		      slides[index].style.display = 'block';
		  }
		
		  // Chuyển đổi slide tiếp theo
		  function nextSlide() {
		      currentIndex++;
		      if (currentIndex >= slides.length) {
		          currentIndex = 0;
		      }
		      showSlide(currentIndex);
		  }
		
		  // Chuyển đổi slide trước đó
		  function prevSlide() {
		      currentIndex--;
		      if (currentIndex < 0) {
		          currentIndex = slides.length - 1;
		      }
		      showSlide(currentIndex);
		  }
		
		  // Thiết lập hành động khi nhấp vào nút next và prev
		  document.getElementsByClassName('next')[0].addEventListener('click', function() {
		      nextSlide();
		  });
		
		  document.getElementsByClassName('prev')[0].addEventListener('click', function() {
		      prevSlide();
		  });
		
		  // Tự động chuyển đổi slide sau mỗi 5 giây
		  setInterval(function() {
		      nextSlide();
		  }, 4000);
		
		  // Hiển thị slide ban đầu
		  showSlide(currentIndex);


  </script>
  
</body>
</html>
