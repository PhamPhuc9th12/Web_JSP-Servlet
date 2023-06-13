<!DOCTYPE html>
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese">
    <title>ClassicDeli_Demo</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
</head>
<body>
<!--  Begin Homepage -->
    <div id="main">
        <!-- Begin header -->
        <div id="header-home">
          <div class="language-content">
            <div class="language-choose">
              <button class="language">
                English
                <i class="ti-arrow-circle-down ticket-language"></i>
              </button>
                <ul class="language-info">
                    <li><a href="">English</a></li>
                </ul>
            </div>
          </div>
        </div>
        <!-- End header -->

        <!-- Begin content -->
        <div class="content-discription">
            <div class="content-logo">
               <img src="./assets/Img/homepage_logo/homepage-logo.png" alt="" class="hompage-logo">
            </div>
            <div class="content-body">
                <img class = "content-img" src="./assets/Img/homepage_logo/slide_homepage.jpg" alt="Welcome to ClassicDeli">
                <div class="text-content">
                    <h1>Welcome to Classic Deli Vietnam !</h1>
                <p>Please choose your city to discover our catalog</p>
                </div>
                <div class="content-location">
                  <a href="./mainpage.jsp" class="content-sub-location">Ho Chi Minh</a>
                  <a href="./mainpage.jsp" class="content-sub-location">Ha Noi</a>
                  <a href="./mainpage.jsp" class="content-sub-location">Da Nang & Hoi An</a>
                  <a href="./mainpage.jsp" class="content-sub-location">Phu Quoc</a>
                  <!-- <div class="content-sub-location">Ho Chi Minh</div>
                  <div class="content-sub-location">Ha Noi</div>
                  <div class="content-sub-location">Da Nang & Hoi An</div>
                  <div class="content-sub-location">Phu Quoc</div> -->
                </div>
                <p class="content-contact">We deliver whole Vietnam. If you are in other provinces, contact us at customerservice@classicfinefoods.com.vn</p>
            </div>
        </div>
        <!-- End content -->

        <!-- Bengin footer -->
        <footer id="footer-hompage">
           <div class="footer-container">
            <div class="restaurant-address">
                <h6 class="res-name">Ho Chi Minh</h6>
                <p class="res-address">Lot Vb.17b-19-21a, Street 22A, Tan Thuan EPZ,
                  Tan Thuan Dong Ward, District 7 Ho Chi Minh City, Vietnam
                  +84 28 3740 7104/05
                  Hotline : +84 (0) 909 808 367
                  hcmc-classicdeli@classicfinefoods.com.vn</p>
            </div>
            <div class="restaurant-address">
              <h6 class="res-name">Ha Noi</h6>
              <p class="res-address">1/196 Nguyen Son Street, Bo De Ward,
                Long Bien District, Hanoi City, Vietnam
                +84 24 3873 6079/ 80
                Hotline : +84 (0) 909 606 820
                hanoi-classicdeli@classicfinefoods.com.vn</p>
            </div>
            <div class="restaurant-address">
            <h6 class="res-name">DaNang & HoiAn</h6>
            <p class="res-address">C4-6 Tran Nhan Tong Street, Tho Quang Ward,
              Son Tra District, Da Nang City, Vietnam
              +84 236 3873 664/ 665 /666
              Hotline : +84 (0) 935 543 699
              danang-classicdeli@classicfinefoods.com.vn</p>
          </div>
          <div class="restaurant-address">
                <h6 class="res-name">Phu Quoc</h6>
                <p class="res-address">128 Tran Hung Dao Street, Duong Dong Ward,
                  Phu Quoc, Kien Giang, Vietnam
                  +84 236 3873 664/ 665 /666
                  Hotline : +84 (0) 983 400 065
                  phuquoc.deli@classicfinefoods.com.vn</p>
          </div>
            
        <div class="coppyRight">
          <p>Copyright © 2020 All Rights Reserved by Classic Fine Foods</p>
        </div>   
        </div>
        </footer> 
        <!-- End footer -->
    </div>
<!-- End Homepage -->
</body>
</html>