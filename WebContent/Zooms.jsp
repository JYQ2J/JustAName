<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%int commentNum = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>圈子</title>

<script type="text/javascript" src="jquery-3.1.0.js"></script>

<script type="text/javascript">
//用于显示出下拉的评论框
function commentDisplay(obj){
    //alert(obj.id);
	$("#c" + obj.id).toggle();
}
</script>
<script type="text/javascript">
//初始化动态
$(document).ready(function(){
	  $.ajax({ 
          type: "post", 
          url: "./AddPassageServlet", 
		   data:{}, 
          dataType:"json",
          contentType: "application/x-www-form-urlencoded",
          success: function (data) { 
          	for(var i=0; i<data.length; i++){ 
  	      		var content = data[i].content;
  	      		var stuName = data[i].stuName;
  	      		var time=data[i].time;
  	      		var id = data[i].id;
  	      		var photo = data[i].photo;

  	      		var newcomment = "";
  	      		commentNum = 0;
  	      		for(var j=0; j<data[i].commentList.length; j++){      			
  	    			commentNum++;
  	      			var userName = data[i].commentList[j].stuName;
  	      			var userNameClick = '<p class="smith"><a id="' + userName + '" href="javascript:void(0)">'+ userName + '</a></p>';
  	      			var commentContent = data[i].commentList[j].content;
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
 
        				$("#a2").after(newdiv);
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
          	        	 alert("出错了！");
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
          data:{ 
        	  	  comment:content,
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
        		$("#content" + id).val("");

         },

         error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("发表失败");
        	   }
	 	});
}
</script>


<script type="text/javascript"> 
//发布动态
$(document).ready(function(){
	   $("#submit").click(function () {  
 		 	  $.ajax({ 
	           type: "get", 
	           url: "./AddPassageServlet", 
	           data:{content:$("#content").val(),
	        
 		 	  
	           },
	      

	           dataType:"json",
	           contentType: "application/x-www-form-urlencoded",
	           
	           success: function (data) { 
	        	    var time=data[data.length-1].time;
		  			alert("发布成功！");
		  			commentNum = 0;
		  			var content = $("#content").val();
		  			var id = data[data.length-1].id;
		  			var photo=data[data.length-1].photo;
					var newdiv = '<div class="media wow fadeInLeft animated" id="'+ "div" + id +'" data-wow-delay=".5s">'+
					'<div class="code-in">'+
					'<p class="smith"><a id="' +${sessionScope.stuname} + 'href="javascript:void(0)">${sessionScope.stuname}</a></p>'+
					'<p class="reply"><a href="#"><i class="glyphicon glyphicon-repeat"> </i>REPLY</a></p>'+
					'<div class="clearfix"> </div>'+
				'</div>'+
				'<div class="media-left">'+
					'<a href="#">'+
					'<img class="img-circle" style="width:90px; height:90px;" src='+ photo +' alt="">'+
					'</a>'+
				'</div>'+
				'<div class="media-body">'+
					'<p>'+ content +'</p>'+
					'<ul class="grid-blog">'+
						'<li><span><i class="glyphicon glyphicon-time"> </i>'+ time +'</span></li>'+
						'<li><a href="javascript:void(0);" id="'+ id +'" onClick="commentDisplay(this)"><i class="glyphicon glyphicon-comment"> </i><span id="'+ "commentNum" + id +'">'+ commentNum +'</span>Comment</a></li>'+
						'<li><a href="#"><i class="glyphicon glyphicon-share"> </i>Share</a></li>'+
						'<div style="padding-top: 20px;" id="'+ "c" + id +'" class="col-md-offset-0" align="left" hidden="hidden">'+
						'<span id="' + "s" + id + '"></span>'+
							'<form class="col-md-10" style="margin-top: 13px">'+
								'<textarea id="' + "content" + id + '"class="form-control" placeholder="评论" style="resize: none; float: left"></textarea>'+
							'</form>'+
							'<button id="' + "publish"+ id + '" class="btn btn-primary" style="margin-top: 13px; width: 60px; height: 55px" onClick="comment(this)"><big>评&nbsp论</big></button>'+
						'</div>'+
					'</ul>'+
				'</div>'+
			'</div>'
					$("#a2").after(newdiv);
					$("#content").val("");

	          },
 
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("发布失败！");
	           }
 		 	});
	   });	   
	   });
</script>


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
<!-- animated-css -->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
<!-- animated-css -->
	<style>
		.inGap1{
			padding-top: 50px;
			padding-bottom: 0px;
	}
		.inGap2{
			padding-top: 0px;
			padding-bottom: 70px;
		}
	</style>
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
					 <li><a class="active" href="Zooms.jsp"><b><big>圈子</big></b></a></li>
					 <li><a href="friends.jsp"><b><big>朋友</big></b></a></li>
					 <li><a href="gallery.jsp"><b><big>相册</big></b></a></li>
					 <li><a href="about.jsp"><b><big>关于我们</big></b></a></li>
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
<!--single start here-->
<!--<div class="single">-->

	<div class="container">
		<div class="single-top wow bounceInLeft inGap1" data-wow-delay="0.3s">
			<h1 class="col-md-offset-1">今&nbsp天&nbsp我&nbsp想&nbsp说&nbsp......<br>&nbsp</h1>
			<div class="container">
				<form action="AddPassageServlet" method="get">
				<textarea name="content"  id="content" class="form-control col-md-offset-2"  style="height:120px; width:620px; resize: none; float:left"></textarea>
				&nbsp;&nbsp;&nbsp;
				<button id="submit" class="btn btn-primary col-md-2" style="margin-left: 10px; height:120px; width:100px;" type="button" onClick="addItem()"><b><big>发&nbsp&nbsp&nbsp布</big></b></button>
				</form>
			</div>
			<div class="lone-line inGap2">
				<p class="wow fadeInLeft animated" data-wow-delay=".5s">
                    <span style="text-align: center">&nbsp&nbsp&nbsp&nbsp&nbsp当你的眼睛眯着笑,当你喝可乐当你吵
						<br>我想对你好,你从来不知道
						<br>想你想你,也能成为嗜好<br>当你说今天的烦恼,当你说夜深你睡不着
						<br>我想对你说</span></p>
			</div>
		</div>
		<div class="comment wow bounceInRight inGap2" data-wow-delay="0.3s">
			<h3 id="a2">圈子动态</h3>
			<div class="media wow fadeInLeft animated" data-wow-delay=".5s">
				
				
				
			</div>
		</div>
		<!--<div class="leave wow bounceInLeft" data-wow-delay="0.3s">
			<h3>Leave a comment</h3>
			<form>
				<div class="single-grid wow fadeInLeft animated" data-wow-delay=".5s">

					<input type="text" value="Name" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Name';}">

					<input type="text" value="E-mail" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'E-mail';}">


					<input type="text" value="Web site" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Web site';}">

					<textarea value=" " onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Comment';}">Comment</textarea>
					<label class="hvr-rectangle-out">
						<input type="submit" value="Send">
					</label>
				</div>
			</form>
		</div>-->
	</div>

<!--footer end here-->
 <div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
	 <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
   </div>	
</body>
</html>

