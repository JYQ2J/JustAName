<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>关于我们</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/font.css"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
	<!--<link href='http://fonts.useso.com/css?family=Lato:400,300,700,900' rel='stylesheet' type='text/css'>-->
<!-- //end-smoth-scrolling -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<!-- animated-css -->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
<!-- animated-css -->
</head>
<body>
<!--header start here-->
 <div class="header">
   <div class="container">
     <div class="header-main">
	   <div class="logo wow bounceInLeft" data-wow-delay="0.3s">
		   <a href="Home.html"><h1 style="color: #f4f5f7"><b>Just A Name</b></h1><img src="" alt=""></a>
	   </div>
		 <div class="top-navg autoHeight">
			 <span class="menu"> <img src="images/icon.png" alt=""/></span>
			 <nav class="cl-effect-13">
				 <ul class="res">
					 <li><a href="Home.jsp"><b><big>地盘</big></b></a></li>
					 <li><a href="Zooms.jsp"><b><big>圈子</big></b></a></li>
					 <li><a href="friends.jsp"><b><big>朋友</big></b></a></li>
					 <li><a href="gallery.jsp"><b><big>相册</big></b></a></li>
					 <li><a class="active" href="about.jsp"><b><big>关于我们</big></b></a></li>
				 </ul>
			 </nav>
			<!-- script-for-menu -->
				 <script>
				   $( "span.menu" ).click(function() {
					 $( "ul.res" ).slideToggle( 300, function() {
					 // Animation complete.
					  });
					 });
				</script>					
	   </div>
	    <div class="clearfix"> </div>
      </div>
    </div>
  </div>
<!--header end here-->
<!--about start here-->
<div class="about">
	<div class="container">
		<div class="about-main">
			 <h1>About</h1>
			 <span class="lft-bar-about"> </span>
			 <span class="rit-bar-about"> </span>
           <div class="col-md-6 about-left wow bounceInLeft" data-wow-delay="0.3s">
           	   <img src="images/ab.jpg" alt="" class="img-responsive">          	
           </div>
           <div class="col-md-6 about-right wow bounceInRight" data-wow-delay="0.3s">
           	 <h4> 开发者的话</h4>
           	 <p>沛神：我也想砸瓶子<br>豪神：恋爱循环一千次，砸一万个瓶子<br>贾神：搞！<br>韩添：日均砸十个瓶子<br>柱哥：让我做个安静的美男子</p>
             <div class="about-list">
	             	<div class="ab-list-left">
		               <ul>
		               	
		               	<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> </span>GroupName: JustAName</li>
		               	<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> </span>School: SEU</li>
		               	
		               </ul>
	               </div>
	               <div class="ab-list-right">
		               <ul>
		               	<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> </span>中国，江苏，南京</li>
		               	<li><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> </span>COSE</li>
		               </ul>
		          </div>
		        <div class="clearfix"> </div>
              </div>
           </div>
          <div class="clearfix"> </div>
		</div>
	</div>
</div>
<div class="about-middle">
	<div class="container">
		      <div class="testimo">
				 	   <h3>Just A Name</h3>
				 	   <span class="lft-bar-testi"> </span>
				 	   <span class="rit-bar-testi"> </span>
			  </div>
		   <section class="slider">
		 <div class="flexslider">
			<ul class="slides">
			  <li>
			  	<div class="banner-bottom">			  		
					<div class="about-midd-main">
					<h3>Our Slogan</h3>
					<br>
							<p>只需要一个名字就可以“搞事情”的社交系统</p>
					</div>
			 	</div>
			  </li>
			  <li>
			 	<div class="banner-bottom">				 	
					<div class="about-midd-main">
					<h3>Our Slogan</h3>
					<br>
							<p>只需要一个名字就可以分享见闻的交互平台</p>
					</div>
			 	</div>
			  </li>
			  <li>
			 	<div class="banner-bottom">			 	
					<div class="about-midd-main">
					<h3>Our Slogan</h3>
					<br>
							<p>只需要一个名字就可以勾搭起来的大圈子</p>
					</div>
			 	</div>
			  </li>
		    </ul>
		 </div>
		 <div class="clearfix"> </div>
	  </section>
	</div>
</div>


<!-- FlexSlider -->
				  <script defer src="js/jquery.flexslider.js"></script>
				  <script type="text/javascript">
					$(function(){
					 
					});
					$(window).load(function(){
					  $('.flexslider').flexslider({
						animation: "slide",
						start: function(slider){
						  $('body').removeClass('loading');
						}
					  });
					});
				  </script>
			<!-- FlexSlider -->


<!--footer end here-->
 <div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
	  <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
   </div>	
</body>
</html>