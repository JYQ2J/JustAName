<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Home</title>
<script src="jquery-3.1.0.js"></script>
<script type="text/javascript">
//用于显示出下拉的评论框
function commentDisplay(obj){
    //alert(obj.id);
	$("#c" + obj.id).toggle();
}
</script>    
<script type="text/javascript"> 
$(document).ready(function(){

		var stu;
		   $("#addFriendBtn").click(function () {  
	 		 	  $.ajax({ 
		           type: "get", 
		           url: "./SendFriendRequestServlet", 
		           data:{resultName:stu,			     
				         }, 
		           //dataType:"json",
		           contentType: "application/x-www-form-urlencoded",

					success: function (data) {
						if(data == "alreadyFriends"){
			        		  alert("已经是好友");
			        	  }else if(data == "alreadySend"){
			        		  alert("已经发送过请求");		        		  
			        	  }else if(data == "sendSuccess"){
			        		  alert("发送成功");
			        		  
			        	  }else if(data == "failed"){
			        		  alert("发送失败");
			        		  
			        	  }
		        		   
	             
		           },  
		           error: function(XMLHttpRequest, textStatus, errorThrown) {
		        	   alert("出错了！");
		           }
	 		 	});
		   });

	    
		   $.ajax({ 
	           type: "post", 
	           url: "./ToUserHomepageServlet", 
	           data:{}, 
	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",

	        	   success: function (data) {        		   
	        		    stu=data.stuInfo.stuName;
	        		    $("#userName").html(stu);
	        		    $("#userName2").html(stu);
	        		    var nickName = data.stuInfo.nickName;
		  				var school = data.stuInfo.school;
		  				var birthday = data.stuInfo.birthday;
		  				var province = data.stuInfo.province;
		  				var photo = data.stuInfo.photo;
		  				var isFriend=data.isFriend;
		  				
		  				if(isFriend==true)
		  					$("#addFriendDiv").hide();
		  				
		  				$("#nick").html(nickName);
		  				$("#sch").html(school);
		  				$("#birth").html(birthday);
		  				$("#pro").html(province);
		  				$("#photo").attr("src",photo);
		  				 

		  				for(var i=0; i<data.passageList.length; i++){ 
		  	  	      		var content = data.passageList[i].content;
		  	  	      		var stuName = stu;
		  	  	      		var time=data.passageList[i].time;
		  	  	      		var id = data.passageList[i].id;
		  	  	      		var newcomment = "";
		  	  	      		commentNum = 0;
		  	  	      		for(var j=0; j<data.passageList[i].commentList.length; j++){      			
		  	  	    			commentNum++;
		  	  	      			var userName = data.passageList[i].commentList[j].stuName;
		  	  	      			var userNameClick = '<p class="smith"><a id="' + userName + '" href="javascript:void(0)">'+ userName + '</a></p>';
		  	  	      			var commentContent = data.passageList[i].commentList[j].content;
		  	  	      			newcomment += '<h5 style="color: #9d9d9d; margin-bottom: 8px">&nbsp;&nbsp;&nbsp;&nbsp;<span>'+ userName + ":" + commentContent +'<span></h5>';
		  	  	      		}
		  	  	      	var newdiv = '<div class="media wow fadeInLeft animated" id="' + "div" + id + '" data-wow-delay=".5s">'+
		  					'<div class="code-in">'+
		  					'<p class="smith"><a id="' + stuName + '" href="javascript:void(0)">'+ stuName + '</a></p>'+
		  					'<p class="reply"><a href="#"><i class="glyphicon glyphicon-repeat"> </i>REPLY</a></p>'+
		  					'<div class="clearfix"> </div>'+
		  					'</div>'+
		  					'<div class="media-left">'+
		  					'<a href="#">'+
		  					'<img class="img-circle" style="width:90px; height:90px;" src="'+ photo +'" alt="" style="width:50px; height:50px; border-radius:50%; overflow:hidden;">'+
		  					'</a>'+
		  					'</div>'+
		  					'<div class="media-body">'+
		  				'<p>' + content + '</p>'+
		  				'<ul class="grid-blog">'+
		  					'<li><span><i class="glyphicon glyphicon-time"> </i>'+ time +'</span></li>'+
		  					'<li><a href="javascript:void(0);" id="'+  id +'" onClick="commentDisplay(this)"><i class="glyphicon glyphicon-comment"></i><span id="'+"commentNum"+id+'">'+ commentNum +'</span>Comment</a></li>'+
		  					'<li><a href="#"><i class="glyphicon glyphicon-share"> </i>Share</a></li>'+
		  					'<div style="padding-top: 20px;" id="' + "c" + id + '" class="col-md-offset-0" align="left" hidden="hidden">'+ newcomment +    								
		  					'<span id="' + "s" + id + '"></span>'+
		  					'<form class="col-md-10" style="margin-top: 13px">'+
		  						'<textarea id="' + "content" + id + '"class="form-control" placeholder="评论" style="resize: none; float: left"></textarea>'+
		  					'</form>'+
		  					'<button id="' + "publish"+ id + '"class="btn btn-primary" style="margin-top: 13px; width: 60px; height: 55px" onClick="comment(this)"><big>评&nbsp论</big></button>'+
		  					'</div>'+
		  				'</ul>'+
		  				'</div>'+
		  				'</div>' 
		  	 
		  	        	$("#h1").after(newdiv);
		  	          	}
		  	         	  $("[href='javascript:void(0)']").click(function (e) { 
		  	          		   
		  	          		   var stuID= $(e.target).attr('id').toString();
		  	          		   
		  	          		 	  $.ajax({ 
		  	          	           type: "get", 
		  	          	           url: "./ToUserHomepageServlet", 
		  	          			   data:{stuID:stuID,
		  	          			         }, 
		  	          	           dataType:"json",
		  	          	           contentType: "application/x-www-form-urlencoded",
		  	          	           success: function (data) { 
		  	          	        	   
		  	          	        	   window.location.href="userHomepage.jsp";
		  	          	           },  
		  	          	           error: function(XMLHttpRequest, textStatus, errorThrown) {
		  	          	        	   alert(XMLHttpRequest.status);
		  	          	        	   alert(XMLHttpRequest.readyState);
		  	          	        	   alert(textStatus);
		  	          	           }
		  	          		 	});
		  	          	   });		  				
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	           }
 		 	}); 
	   
	   });
</script>


<script type="text/javascript">
//发表评论
function comment(obj){
	var id = obj.id.substring(7);
	var content = document.getElementById("content" + id).value;
	  $.ajax({ 
          type: "get", 
          url: "./AddCommentServlet", 
          data:{   comment:content,
       	   			id:id
          },
     

          dataType:"json",
          contentType: "application/x-www-form-urlencoded",
          
          success: function (data) { 
        		var newComment = '<h5 style="color: #9d9d9d; margin-bottom: 8px">&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.stuname}:<span>'+ content +'<span></h5>';
        		alert("发表成功");
        		var num = $("#commentNum" + id).html();
        		var newNum = parseInt(num);
        		newNum++;
        		$("#commentNum" + id).html(newNum );
        		$("#s" + id).before(newComment);
        		$("#content" + id).html("");

         },

         error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("发表失败");
					  
        	   }
	 	});
}
</script>


    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.floatDiv.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/font.css">
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <!--Google Fonts-->
    <!--<link href='http://fonts.googleapis.com/css?family=Lato :400,300,700,900' rel='stylesheet' type='text/css'>-->
    <!-- //end-smoth-scrolling -->
    <script src="js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(window).load(function () {
            $("#slider2").responsiveSlides({
                auto: true,
                pager: true,
                speed: 300,
                namespace: "callbacks",
            });
        });
    </script>
    <!-- requried-jsfiles-for owl -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <script src="js/owl.carousel.js"></script>
    <script>
        $(document).ready(function () {
            $("#owl-demo").owlCarousel({
                items: 3,
                lazyLoad: true,
                autoPlay: false,
                pagination: true,
            });
        });
    </script>
    <!-- //requried-jsfiles-for owl -->
    <!-- animated-css -->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- animated-css -->
    <!--好友请求浮动层固定屏幕右下角-->

    <script type="text/javascript">
        $(function () {
            $("#request").floatdiv({right: "10px", top: "510px"});//设置浮动层靠右距离为0，靠上距离50px 根据需求调整
        });
    </script>
</head>
<body>
<!--header start here-->
<div class="banner">
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
                            <li><a href="#"><b><big>相册</big></b></a></li>
                            <li><a href="about.jsp"><b><big>关于我们</big></b></a></li>
                        </ul>
                    </nav>
                    <!-- script-for-menu -->
                    <script>
                        $("span.menu").click(function () {
                            $("ul.res").slideToggle(300, function () {
                                // Animation complete.
                            });
                        });
                    </script>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <!-- 好友请求浮动层 -->
    <div class="alert alert-info" id="request" style="width: 260px; height: 120px;" hidden="hidden">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4 style="margin-top: 0px;"><b>好友请求</b></h4>
        <p align="center" style="margin-top: 4px; margin-bottom: 8px;"><a href="#">xxx</a>&nbsp请求加您为好友</p>
        <button class="btn btn-primary col-md-offset-1">接受</button>
        <button class="btn btn-danger col-md-offset-4">拒绝</button>
    </div>

    <div class="banner-main">
        <div class="slider-bann wow bounceInRight" data-wow-delay="0.3s">
            <ul class="rslides" id="slider2">
                <li>
                    <h3>Welcome To <span id="userName"></span> 's Space</h3>
                    <h4>You Are Not Alone</h4>
                    <!--  <div class="ban-btn">
                    <a href="single.html" class="hvr-bounce-out">Load More</a>
                    </div>-->
                </li>
                <li>
                    <h3>发现 <span id="userName2"></span>的美</h3>
                    <h4>11 条个人动态</h4>
                    <!--<div class="ban-btn">
                    <a href="single.html" class="hvr-bounce-out">Load More</a>
                    </div>
                    </li>-->
                <li>
                    <h3>勾搭彼此的朋友</h3>
                    <h4>7 个朋友</h4>
                    <!--<div class="ban-btn">
                    <a href="single.html" class="hvr-bounce-out">Load More</a>
                    </div>-->
                </li>
            </ul>
            <div id="addFriendDiv" class="what-we-do-main  wow bounceInLeft" align="center" data-wow-delay="0.3s">
                <a id="addFriendBtn" href="javascript:void(0);" class="hvr-bounce-out">
                    <b><big>加&nbsp&nbsp为&nbsp&nbsp好&nbsp&nbsp友</big></b>
                </a>
            </div>
        </div>
    </div>
</div>

<!--header end here-->
<!--what we do strat here-->
<div class="hotel">
    <div class="container">
        <div class="hotel-main">
            <div id="h1" class="hotel-head" style="padding-bottom: 0px">
                <h1 align="center">他/她的曾经</h1>
                <span class="lft-bar-welcom"> </span>
                <span class="rit-bar-welcom"> </span>
            </div>
            <div class="hotel-bottom" style="padding-top: 0px; margin-top: 0px">
                <!-- experts -->
                <div class="wow bounceInRight" data-wow-delay="0.3s">
                    <div class="media wow fadeInLeft animated" data-wow-delay=".5s">
                        
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <!-- //experts -->
            </div>
        </div>
    </div>
</div>
<!--what we do end here-->

<!--disk bar strat here-->
<div class="disk">
    <div class="container">
        <div class="disk-main">
            <div class="col-md-8 disk-left wow bounceInLeft" data-wow-delay="0.3s">
                <h1 class="text-center" style="color: #fcf8e3"><b><big>WOW！&nbsp</big></b>他/她一定与你有交集</h1>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--disk bar end here  /*class="hvr-bounce-out"*/-->
<!--个人资料 strat here-->
<!--features strat here-->
<div class="features">
  <div class="container">
  	<div class="features-main">
  		<div class="features-top wow bounceInDown">
  			<h3>&nbsp;&nbsp;&nbsp;个人资料&nbsp;&nbsp;&nbsp;</h3>
  			<span class="lft-bar-fea"> </span>
			<span class="rit-bar-fea"> </span>
  		</div>
  		<div class="features-bottom wow">
			<br>
			<div class="features-left wow bounceIn" data-wow-delay="0.3s">
                    <img id="photo" src="" class="col-md-offset-5 img-circle" style="left: 25px; position: absolute; height: 145px; width: 145px; z-index: 999"/>
            </div>
	  		 <div class="col-md-offset-1 col-md-6 features-left wow bounceInLeft" data-wow-delay="0.3s">
	  		   	 <div class="feature-grids">
		  		   	  <div class="fea-img">
		  		   	  	<img src="images/fe1.png" alt=""> 
		  		   	  </div>
		  		   	  <div class="fea-text">
		  		   	  	<h4>家乡</h4>
		  		   	  	<p><span id="pro">未编辑</span></p>
		  		   	  </div>
		  		   	<div class="clearfix"> </div>
	  		   	  </div>
	  		   	  <div class="feature-grids">
					  <div class="fea-img">
						  <img src="images/fe3.png" alt="">
					  </div>
					  <div class="fea-text">
						  <h4>绰号</h4>
						  <p><span id="nick">未编辑</span></p>
					  </div>
	  		   	  </div>
	  		   </div>
	  		   <div class="col-md-3 col-md-offset-2 features-right wow bounceInRight" data-wow-delay="0.3s">
	  		   	 <div class="feature-grids">
					 <div class="fea-img">
						 <img src="images/fe4.png" alt="">
					 </div>
					 <div class="fea-text">
						 <h4>学校</h4>
						 <p><span id="sch">未编辑</span></p>
					 </div>
		  		   	<div class="clearfix"> </div>
	  		   	  </div>
	  		   	  <div class="feature-grids">
					  <div class="fea-img">
						  <img src="images/fe2.png" alt="">
					  </div>
					  <div class="fea-text">
						  <h4>生日</h4>
						  <p><span id="birth">未编辑</span></p>
					  </div>
					  <div class="clearfix"> </div>
		  		   	<div class="clearfix"> </div>
	  		   	  </div>
	  		   </div>
               

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
    <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
</div>
<!--<script src="js/jquery-1.11.0.min.js"></script>-->
<script src="js/bootstrap.min.js"></script>

<script>
    $('#myModal').modal('hide');
    $('#')
</script>
</body>
</html>