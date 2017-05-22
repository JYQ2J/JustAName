<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%int messageNum=0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>地盘</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/font.css"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="jquery-3.1.0.js"></script>
<script src="jquery-1.11.0.min.js"></script>
<!--好友请求消息列表+搜索栏<script>-->
    <script type="text/javascript">
        $("#f_re").attr("z-index",999);
        $(document).ready(function(){
            $("#re_list").click(function(){
                $("#f_re").toggle();
            });
        });
    </script>
    

<!--好友搜索结果模态框<script>-->
<script>
    $('#modal_search').modal('hide');
    $('#')
</script>

<script type="text/javascript"> 
//查找好友
$(document).ready(function(){
	   $("#searchFriend").click(function () {  
 		 	  $.ajax({ 
	           type: "get", 
	           url: "./SearchFriendServlet", 
	           data:{searchName:$("#searchName").val(),			     
			         }, 
	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",

	        	   success: function (data) { 
	        		   $("#resultName").html("");
	  					$("#resultPro").html("");
	  					$("#resultSch").html("");
	               
	        		    
		  				/* var school = data.school;
		  				var birthday = data.birthday;
		  				var province = data.province; */
		  				if(data!=null){
		  					$("#resultTitle").html("你的有缘人");
		  					$("#displayRes").show();
		  					//$("#displayRes").remove();
		  					var stuName = data.stuName;
		  					var school=data.school;
		  					var province=data.province
		  					var photo=data.photo;
		  					$("#resultName").html(stuName);
		  					$("#resultPro").html(province);
		  					$("#resultSch").html(school); 
		  					$("#resultPhoto").attr("src",photo);
		  					
		  					$("a").click(function () { 
		  	          		   
		  	          		   //var stuID= $(e.target).attr('id').toString();
		  	          		   
		  	          		 	  $.ajax({ 
		  	          	           type: "get", 
		  	          	           url: "./ToUserHomepageServlet", 
		  	          			   data:{stuID:stuName,
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
		  					
		  				}
		  				else{		  					
		  					//$("#resultDiv").remove();
		  					//$("#displayRes").remove();
		  					$("#displayRes").hide();
		  					$("#resultTitle").html("没有该用户");
		  				}	               
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	           }
 		 	});
	   });
	   });

</script>

<script type="text/javascript"> 
//发送好友请求
$(document).ready(function(){
	   $("#addFriend").click(function () {  
 		 	  $.ajax({ 
	           type: "get", 
	           url: "./SendFriendRequestServlet", 
	           data:{resultName:$("#resultName").html(),			     
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
	   });

</script>

<script type="text/javascript"> 
//显示好友请求等消息
$(document).ready(function(){
 
 		 	  $.ajax({ 
	           type: "get", 
	           url: "./NotifyFriendMesServlet", 
	           data:{		     
			         }, 
	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",

	        	   success: function (data) {
	        		   messageNum=data.askStus.length+data.denyStus.length+data.agreeStus.length;
	        		   $("#messageNum").html(messageNum);
	        		   for(var i=0;i<data.askStus.length; i++){
	        			   var name=data.askStus[i];
	        			   //var agree=data.agreeStus[i];
	        			  //var deny=data.denyStus[i];
	        			   var newDivAsk='<div class="row-fluid alert fade in" style="padding-right: 9px; padding-top: 60px;">'+
	        			   '<blockquote class="pull-right" style="padding-top: 0px; padding-bottom: 5px">'+
	        			   '<p style="color: #f4f5f7"><a href="javascript:void(0);" style="color: #3CAFE6">'+name+'</a>&nbsp请求加您为好友</p>'+
	                        '<button id="'+"agreeBtn"+name+'" onClick="agreeFunc(this)" class="btn btn-info" style="margin-top: 8px;" data-dismiss="alert">接受</button>'+
	                        '<button id="'+"denyBtn"+name+'" onClick="denyFunc(this)" class="btn btn-danger" style="margin-top: 8px; margin-left: 41px;" data-dismiss="alert">拒绝</button>'+
	                    '</blockquote>'+
	                '</div>'
	                        $("#d2").after(newDivAsk);  
	        		   }
	        		   
	        		   for(var i=0;i<data.denyStus.length; i++){
	        			   //var name=data.askStus[i];
	        			   //var agreeName=data.agreeStus[i];
	        			   var denyName=data.denyStus[i];
	        			   var newDivAsk='<div class="row-fluid alert fade in" style="padding-right: 19px; padding-top: 60px;">'+
	        			   '<blockquote class="pull-right" style="padding-top: 0px; padding-bottom: 0px;">'+
	        			   '<button type="button" onClick="subMesNum()" class="close" data-dismiss="alert" style="color: #f4f5f7">×</button>'+
	        			   '<p style="color: #f4f5f7;"><a href="javascript:void(0);" style="color: #3CAFE6; padding-right: 78px"><big>'+denyName+'</big></a><br>&nbsp&nbsp拒绝了您的好友请求</p>'+
	        			   '</blockquote>'+
	        			   '</div>'
	                        $("#d2").after(newDivAsk);  
	        		   }
	        		   
	        		   for(var i=0;i<data.agreeStus.length; i++){
	        			   //var name=data.askStus[i];
	        			   var agreeName=data.agreeStus[i];
	        			   //var deny=data.denyStus[i];
	        			   var newDivAsk='<div class="row-fluid alert fade in" style="padding-right: 19px; padding-top: 60px;">'+
	        			   '<blockquote class="pull-right" style="padding-top: 0px; padding-bottom: 0px;">'+
	        			   '<button type="button" onClick="subMesNum()" class="close" data-dismiss="alert" style="color: #f4f5f7">×</button>'+
	        			   '<p style="color: #f4f5f7;"><a href="javascript:void(0);" style="color: #3CAFE6; padding-right: 78px"><big>'+agreeName+'</big></a><br>&nbsp&nbsp成功添加您为好友</p>'+
	        			   '</blockquote>'+
	        			   '</div>'
	                        $("#d2").after(newDivAsk);  
	        		   }
	        			   
	               
	        		    
		  				/* var name=data.askStus[0];
		  				alert(name); */
		  				

	               
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	           }
 		 	});

	   });

</script>

<script type="text/javascript"> 
function agreeFunc(obj){
//接受好友请求
	var stuName = obj.id.substring(8);
	//var content = document.getElementById("content" + id).value;
	var flag="0";
	 $.ajax({ 
         type: "get", 
         url: "./AddFriendServlet", 
         data:{stuName:stuName,
      	   	 flag:flag,
		         }, 
         //dataType:"json",
         contentType: "application/x-www-form-urlencoded",

			success: function (data) {
				if(data == "agreeSuccess"){
	        		  alert("您已同意TA的好友请求！");
	        		  messageNum--;
	       		      $("#messageNum").html(messageNum);
	        	  }else if(data == "denySuccess"){
	        		  alert("您已拒绝TA的好友请求！");		        		  
	        	  }else if(data == "error"){
	        		  alert("出错了！");
	        		  
	        	  }
      		   
       
         },  
         error: function(XMLHttpRequest, textStatus, errorThrown) {
        	 alert("出错了！");
         }
	 	});
}
</script>

<script type="text/javascript"> 
function denyFunc(obj){
//拒绝好友请求
	var stuName = obj.id.substring(7);
	//var content = document.getElementById("content" + id).value;
	var flag="1";
	 $.ajax({ 
         type: "get", 
         url: "./AddFriendServlet", 
         data:{stuName:stuName,
      	   	 flag:flag,
		         }, 
         //dataType:"json",
         contentType: "application/x-www-form-urlencoded",

			success: function (data) {
				if(data == "agreeSuccess"){
	        		  alert("您已同意TA的好友请求！");
	        	  }else if(data == "denySuccess"){
	        		  alert("您已拒绝TA的好友请求！");
	        		  messageNum--;
	       		      $("#messageNum").html(messageNum);
	        	  }else if(data == "error"){
	        		  alert("出错了！");
	        		  
	        	  }
      		   
       
         },  
         error: function(XMLHttpRequest, textStatus, errorThrown) {
        	 alert("出错了！");
         }
	 	});
}
</script>

<script type="text/javascript"> 
function subMesNum(){
//处理消息数
	messageNum--;
	$("#messageNum").html(messageNum);
}
</script>

<script type="text/javascript"> 
$(document).ready(function(){
	//初始化个人资料
	    
 		 	  $.ajax({ 
	           type: "post", 
	           url: "./ModifyInfoServlet", 
	           data:{dipan:$("#dipan").val(),
			         }, 
	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",

	        	   success: function (data) { 
	        		    var photo = data.photo;
	        		    var nickName = data.nickName;
		  				var school = data.school;
		  				var birthday = data.birthday;
		  				var province = data.province;
		  				
		  				$("#nick").html(nickName);
		  				$("#sch").html(school);
		  				$("#birth").html(birthday);
		  				$("#pro").html(province);
		  				$("#photo").attr("src",photo);


	               
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	           }
 		 	});
	   
	   });
</script>
<script type="text/javascript"> 
$(document).ready(function(){	
	   $("#saveProInfo").click(function () {  
 		 	  $.ajax({ 
	           type: "get", 
	           url: "./ModifyInfoServlet", 
	           data:{nickName:$("#editNick").val(),
				     school:$("#editSch").val(),
				   	 birthday:$("#editBirth").val(),
				   	 province:$("#editPro").val()
			         }, 
	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",

	        	   success: function (data) { 
	               
	        		    var nickName = data.nickName;
		  				var school = data.school;
		  				var birthday = data.birthday;
		  				var province = data.province;
		  				
		  				$("#nick").html(nickName);
		  				$("#sch").html(school);
		  				$("#birth").html(birthday);
		  				$("#pro").html(province);

	               
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	           }
 		 	});
	   });
	   });
</script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />	
<link rel="stylesheet" href="css/font.css"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--@author 贾岩琦-->
<script src="js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
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
				$(document).ready(function() {
					$("#owl-demo").owlCarousel({
						items : 3,
						lazyLoad : true,
						autoPlay : false,
						pagination : true,
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
					<li><a class="active" href="Home.jsp"><b><big><span id="dipan">地盘</span></big></b></a></li>
					<li><a href="Zooms.jsp"><b><big>圈子</big></b></a></li>
					<li><a href="friends.jsp"><b><big>朋友</big></b></a></li>
					<li><a href="gallery.jsp"><b><big>相册</big></b></a></li>
					<li><a href="about.jsp"><b><big>关于我们</big></b></a></li>
					<!--导航栏好友请求提示标(显示数目)-->
    				<li role="presentation">
        			<a href="javascript:void(0);" id="re_list" class="col-md-offset-0 fade in">点我
            			<span id="messageNum" class="badge" style="background-color: #3cafe6">3</span>
        			</a>
    					</li>
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
  
 <!-- 好友请求列表+好友搜索栏（根据提示标数目添加请求栏个数）-->
    <div id="f_re" style="padding-top: 10px; padding-right: 10px; position: absolute; z-index: 999; top: 115px; right: 15px;" hidden="hidden">
        <blockquote id="d2" class="pull-right" style="padding-top: 0px; padding-bottom: 0px;">
            <input id="searchName" class="form-control" style="width:200px; display:inline;">
            <button id="searchFriend" class="btn btn-primary" style="display:inline;" data-toggle="modal" data-target="#modal_search">搜索</button>
        </blockquote>
        
       
        
    </div>
    
    <!--好友搜索结果模态框-->
    <div class="modal fade" id="modal_search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h1 class="modal-title" style="color: #515151"><b><span id="resultTitle">你的有缘人</span></b></h1>
                </div>
                <div class="modal-body">
                    <div  class="container">
                        
                        <div id="displayRes" class="col-md-3" style="padding-top:0px;">
                            <img id="resultPhoto" class="img-circle pull-left" style="width: 95px; height: 95px; margin-right: 15px;" src="">
                            <a href="javasript:void(0);" style="color: #3CAFE6; margin-left: 5px;"><big><span id="resultName"></span></big></a>
                            <p style="padding-bottom: 10px; color: #515151;">&nbsp;<span id="resultPro"></span>-<span id="resultSch"></span></p>
                            <button id="addFriend" class="btn btn-info"><b>加为好友</b></button>
                        </div>    

                    </div>
                </div>
            </div>
        </div>
    </div>
  
  <div class="banner-main">
	    <div class="slider-bann wow bounceInRight" data-wow-delay="0.3s">
	    <ul class="rslides" id="slider2">
	      <li>
	      	<h3>Welcome To ${sessionScope.stuname} 's Space</h3>
	      	<h4>You Are Not Alone</h4>
	      	  <!--<div class="ban-btn">
	      	   <a href="single.html" class="hvr-bounce-out">Load More</a>
	      	  </div>-->
	      </li>
	      <li>
	      	<h3>发现  ${sessionScope.stuname} 的美</h3>
	      	<h4>7 条个人动态</h4>
	      	  <!--<div class="ban-btn">
	      	  <a href="single.html" class="hvr-bounce-out">Load More</a>
	      	  </div>-->
	      	</li>
	      <li>
	      	<h3>勾搭彼此的朋友</h3>
	      	<h4>3 个朋友</h4>
	      	  <!--<div class="ban-btn">
	      	   <a href="single.html" class="hvr-bounce-out">Load More</a>
	      	  </div>-->
	      </li>
	    </ul>
    </div>
  </div>
</div>
<!--header end here-->
<!--what we do strat here-->
<div class="what-we-do">
 <div class="container">
    <div class="what-we-do-main  wow bounceInLeft" data-wow-delay="0.3s">
    	 <h2>最近动态</h2>
    	 <span class="lft-bar-we"> </span>
	     <span class="rit-bar-we"> </span>
    	 <p>不搞事情就摔杯zi！ </p>
    	 <a href="Zooms.jsp" class="hvr-bounce-out">Read More</a>
    	<div class="clearfix"> </div>
    </div>
 </div>
</div>
<!--what we do end here-->

<!--peoples strat here-->
<div class="people">
	<div class="container">
		<div class="people-main">
			  <div class="people-top wow bounceInRight" data-wow-delay="0.3s">
			  	<h1>朋友们</h1>
			  	<span class="lft-bar-team"> </span>
			  	<span class="rit-bar-team"> </span>
			  	<p>每一次相遇，都是彼此最大的幸运</p>
			  </div>
			  <div class="people-bottom">
			  	 <div id="owl-demo" class="owl-carousel text-center">
			  	 	  <div class="item g1">
							<img class="lazyOwl img-responsive" data-src="images/w.jpg" alt="name" >
							<div class="people-caption">
								<h3>张一一</h3>
								<span>南京 - 东南大学 </span>
								<ul class="people-icons">
									<li><a href="#"> <span class="fb"></span> </a></li>
									<li><a href="#"> <span class="tw"></span> </a></li>
									<li><a href="#"> <span class="google"></span> </a></li>
								</ul>
							</div>
						</div>
						<div class="item g1">
							<img class="lazyOwl img-responsive" data-src="images/w1.jpg" alt="name">
							<div class="people-caption">
								<h3>刘沛</h3>
								<span>南京 - 东南大学</span>
								<ul class="people-icons">
									<li><a href="#"> <span class="fb"></span> </a></li>
									<li><a href="#"> <span class="tw"></span> </a></li>
									<li><a href="#"> <span class="google"></span> </a></li>
								</ul>
							</div>
						</div>
						<div class="item g1">
							<img class="lazyOwl img-responsive" data-src="images/w2.jpg" alt="name">
							<div class="people-caption">
								<h3>方舟</h3>
								<span>南京 - 东南大学</span>
								<ul class="people-icons">
									<li><a href="#"> <span class="fb"></span> </a></li>
									<li><a href="#"> <span class="tw"></span> </a></li>
									<li><a href="#"> <span class="google"></span> </a></li>
								</ul>
							</div>
						</div>
						<div class="item g1">
							<img class="lazyOwl img-responsive" data-src="images/w3.jpg" alt="name">
							<div class="people-caption">
								<h3>Jason</h3>
								<span>北京 - 北京大学</span>
								<ul class="people-icons">
									<li><a href="#"> <span class="fb"></span> </a></li>
									<li><a href="#"> <span class="tw"></span> </a></li>
									<li><a href="#"> <span class="google"></span> </a></li>
								</ul>
							</div>
						</div>
						<div class="item g1">
							<img class="lazyOwl img-responsive" data-src="images/w4.jpg" alt="name">
							<div class="people-caption">
								<h3>方舟舟</h3>
								<span>南京 - 东南大学</span>
								<ul class="people-icons">
									<li><a href="#"> <span class="fb"></span> </a></li>
									<li><a href="#"> <span class="tw"></span> </a></li>
									<li><a href="#"> <span class="google"></span> </a></li>
								</ul>
							</div>
						</div>
																												
					</div>
			  </div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--peoples end here-->


<!--visit places end here-->
<!--disk bar strat here-->
<div class="disk">
  <div class="container">
  	<div class="disk-main">
  		   <div class="col-md-8 disk-left wow bounceInLeft" data-wow-delay="0.3s">
  		   	  <h1 class="text-center" style="color: #fcf8e3">瞅瞅最近圈子里都搞了哪些<big>&nbsp大&nbsp!&nbsp</big>新闻</h1>
  		   </div>
  		   <div class="col-md-4 disk-right wow bounceInRight" data-wow-delay="0.3s">
  		   	<a href="Zooms.jsp" >GO&nbsp!</a>
  		   </div>
  		<div class="clearfix"> </div>
  	</div>
  </div>
</div>
<!--disk bar end here  /*class="hvr-bounce-out"*/-->
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
	  		   
<!--编辑个人资料模态框-->	  		
				<div class="what-we-do-main wow bounceIn" data-wow-delay="0.3s" data-toggle="modal" data-target="#myModal" >
				<a href="#ziliao" class="hvr-bounce-out col-md-2 col-md-offset-5"><b><big>修&nbsp&nbsp改&nbsp&nbsp&nbsp一&nbsp&nbsp下</big></b></a>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">个人资料</h4>
						</div>
						<div class="modal-body">
							<div class="container ">
								
									<div class="col-md-12">
										<div class="form-group col-md-2">
											<label class="control-label"><strong>家乡</strong></label>
											<input id="editPro" type="text" class="form-control" placeholder="">
										</div>
										<div class="form-group col-md-2 col-md-offset-1">
											<label class="control-label"><strong>学校</strong></label>
											<input id="editSch" type="text" class="form-control" >
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group col-md-2">
											<label class="control-label"><strong>绰号</strong></label>
											<input id="editNick" type="text" class="form-control" placeholder="">
										</div>
										<div class="form-group col-md-2 col-md-offset-1">
											<label class="control-label"><strong>生日</strong></label>
											<input id="editBirth" type="text" class="form-control" >
										</div>
									</div>
									
									<div class="col-md-12" style="margin-top: 3px;">
                                            <div class="form-group col-md-2">
                                                <label class="control-label"><strong>上传你的头像</strong></label>  
                                                                                         
                                                <form action="./UploadServlet" enctype="multipart/form-data" method="post">                                                	
                                                	<input type="file" name="filepath" accept="image/*" id="filepath">
                                                	<button type="submit" class="btn btn-info" style="position:absolute; top:20px; left:291px;" id="saveP">保存头像</button>

                                                </form>
                                               
                                            </div>
                                   </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button id="saveProInfo" type="button" class="btn btn-primary" data-dismiss="modal" id="save">保存</button>
						</div>
					</div>
				</div>
			</div>   
<!--end模态框-->	  		   
	  		   
	  		   
	  		<div class="clearfix"> </div>
  		</div>
  	</div>
  </div>
</div>

<!--footer end here-->
 <div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
	  <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
   </div>	
   


<script>
	$('#myModal').modal('hide');
</script>
   
   
</body>
</html>