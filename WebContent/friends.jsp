<!--@author 贾岩琦-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>朋友们</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="jquery-3.1.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link href="css/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="css/font.css"/>






	<script src="js/owl.carousel.js"></script>
	<script>
		$(document).ready(function () {
			$("#owl-demo").owlCarousel({
				items: 4,
				lazyLoad: true,
				autoPlay: false,
				pagination: true,
			});
		});
	</script>
<script type="text/javascript">
$(document).ready(function(){
	  $.ajax({ 
          type: "post", 
          url: "./FriendListServlet", 
		   data:{}, 
          dataType:"json",
          contentType: "application/x-www-form-urlencoded",
          success: function (data) {
        	  for(var i=0; i<data.length; i++){ 
        	  var stuName=data[i].stuName;
        	  var school=data[i].school;
        	  var province=data[i].province;
        	  var photo = data[i].photo;
        	 

        	  var newDiv='<div id="d1" class="col-md-3 bottom-grid">'+
				'<div class="btm-right">'+
				'<img   style="width:250px; height:250px;" src="'+photo+'" alt=" " />'+
				'<div class="captn">'+
				'<a id="' + "recive" + stuName + '" onClick="openChat(this)" class="pull-left" href="javascript:void(0);" style="border-color: #3CAFE6; width: 20px; height: 25px; margin-left: 10px; margin-top: 10px;">'+
				                                            '<img  src="images/messageS.png">'+
				                                        '</a>'+
					'<h4 id="nameOne"><b>' + stuName + '</b></h4>'+
					'<p><big>' + province + '&nbsp-&nbsp' + school + '</big></p>'+
					'<div class="disk-right wow bounceInRight" style="padding-top: 35px;" data-wow-delay="0.3s">'+
						'<a id="' + stuName + '" href="javascript:void(0)" style="width: 245px; height: 50px;"><big><strong>走！瞅瞅->他/她</strong></big></a>'+
					'</div>'+
				'</div>'+
				'</div>'+
				'</div>'
				$("#d1").before(newDiv);												
        	  }
        	  
        	         	  
        	  
        	  
        	   $("a").click(function (e) { 
       		   
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
$(document).ready(function(){
	$.ajax({ 
        type: "get", 
        url: "./FriendListServlet", 
		   data:{}, 
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
      	  for(var i=0; i<data.length; i++){ 
      	  var stuName=data[i].stuName;
      	  var school=data[i].school;
      	  var province=data[i].province;
      	  var photo = data[i].photo;

      	 

      	var newDiv='<div id="d1" class="col-md-3 bottom-grid">'+
		'<div class="btm-right">'+
		'<img   style="width:250px; height:250px;" src="'+photo+'" alt=" " />'+
		'<div class="captn">'+
			'<h4 id="nameOne"><b>' + stuName + '</b></h4>'+
			'<p><big>' + province + '&nbsp-&nbsp' + school + '</big></p>'+
			'<div class="disk-right wow bounceInRight" style="padding-top: 35px;" data-wow-delay="0.3s">'+
				'<a id="' + stuName + '" href="javascript:void(0)" style="width: 245px; height: 50px;"><big><strong>走！瞅瞅->他/她</strong></big></a>'+
			'</div>'+
		'</div>'+
		'</div>'+
		'</div>'
		$("#g1").before(newDiv);											
      	  }
      	  
      	  
      	  
      	 $("a").click(function (e) { 
     		   
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
      	  
      	  
        }
	   });
});</script>









<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/font.css">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
	<!--<link href='http://fonts.useso.com/css?family=Lato:400,300,700,900' rel='stylesheet' type='text/css'>-->
<!-- animated-css -->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
<!-- animated-css -->

<!--侧滑栏CSS布局（放在HEAD里）-->
<style type="text/css">
		a:hover,a:focus{
			text-decoration: none;
			outline: none;
		}
		#accordion .panel{
			border: none;
			box-shadow: none;
			border-radius: 0;
			margin-bottom: -5px;
		}
		#accordion .panel-heading{
			padding: 0;
			border-radius: 0;
			border: none;
			text-align: center;
		}
		#accordion .panel-title a{
			display: block;
			padding: 25px 30px;
			font-size: 16px;
			font-weight: bold;
			color: #fff;
			background: #3CAFE6;
            border-top: 1px solid #afdefa;
			border-bottom: 1px solid #afdefa;
			position: relative;
			transition: all 0.5s ease 0s;
		}
		#accordion .panel-title a:hover{
			background: #258ecd;
		}
		#accordion .panel-title a:after,
		#accordion .panel-title a.collapsed:after{
			content: "\f067";
			font-size: 15px;
			font-weight: 200;
			position: absolute;
			top: 25px;
			left: 15px;
			transform: rotate(135deg);
			transition: all 0.5s ease 0s;
		}
		#accordion .panel-title a.collapsed:after{
			transform: rotate(0deg);
		}
		#accordion .panel-body{
			background: #3CAFE6;
			padding: 0 0 0 15px;
			border: none;
			position: relative;
		}
		#accordion .panel-body p.wo{
			font-size: 17px;
			color: #fff;
			line-height: 25px;
			background: #258ecd;
			padding: 15px;
			margin: 15px 10px 10px 60px;
		}
		#accordion .panel-body p.ta{
			font-size: 17px;
			color: #fff;
			line-height: 25px;
			background: #258ecd;
			padding: 15px;
			margin: 5px 60px 10px 0px;
		}
        #accordion .panel-body p.mes{
            font-size: 17px;
            color: #fff;
            line-height: 25px;
            background: #258ecd;
            padding: 15px;
            margin: 15px 30px 10px 30px;
        }

		#accordion .panel-collapse .panel-body p{
			opacity: 0;
			transform: scale(0.9);
			transition: all 0.5s ease-in-out 0s;
		}
		#accordion .panel-collapse.in .panel-body p{
			opacity: 1;
			transform: scale(1);
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
					 <li><a href="Zooms.jsp"><b><big>圈子</big></b></a></li>
					 <li><a class="active" href="friends.jsp"><b><big>朋友</big></b></a></li>
					 <li><a href="gallery.jsp"><b><big>相册</big></b></a></li>
					 <li><a href="about.jsp"><b><big>关于我们</big></b></a></li>
					 <a href="javascript:void(0);" id="showRightPush" class="col-md-offset-1 fade in" style="padding-bottom: 0px;">
						 <img src="images/message.png" style="width: 50px; height: 50px;">
						 <!-- <span class="badge" style="background-color: #3cafe6;">3</span> -->
					 </a>
				 </ul>
			 </nav>
							
	   </div>
	    <div class="clearfix"> </div>
      </div>
    </div>
  </div>
<!--header end here-->
<!--好友列表 start here-->
<div class="hotel">
	<div class="container">
		<div class="hotel-main">
             <div class="hotel-head">
             	<h1>我的朋友</h1>
             	<span class="lft-bar-welcom"> </span>
             	<span class="rit-bar-welcom"> </span>
             </div>
             <div class="hotel-bottom">
             	<!-- experts -->
				<div class="experts wow bounceInRight" data-wow-delay="0.3s">
						<div id="d1" class="col-md-3 bottom-grid">
							<div class="btm-right">
								<img src="images/photo1.jpg" alt=" " />
								<div class="captn">
									<h4 id="nameOne"><b>开发者小贾</b></h4>
									<p><big>JustAName&nbsp-&nbspSEU</big></p>
									<div class="disk-right wow bounceInRight" style="padding-top: 35px;" data-wow-delay="0.3s">
										<a href="about.jsp" style="width: 245px; height: 50px;"><big><strong>走！瞅瞅->他/她</strong></big></a>
									</div>
								</div>

							</div>
						</div>
						
						
						
						<div class="clearfix"> </div>

				</div>
				 <div class="experts wow bounceInLeft" style="padding-top: 13px;" data-wow-delay="0.3s">
					 
					 
					 
					 
					 <div class="clearfix"> </div>

				 </div>
				<!-- //experts -->
             </div>
		</div>
	</div>
</div>


<!--好友推荐-->
<div class="people" style="height: 550px" >
	<div class="container">
		<div class="people-main wow bounceInRight">
			<div class="people-top wow bounceInRight" data-wow-delay="0.3s" style="margin-bottom: 30px">
				<h1 style="margin-left: 10px; margin-right: 10px;">可能你也认识TA</h1>
				<span class="lft-bar-welcom"> </span>
				<span class="rit-bar-welcom"> </span>
				<p style="margin-top: 20px;">相知，相遇，相识</p>
			</div>
			<div class="experts wow bounceInRight" data-wow-delay="0.3s">
						<div id="g1" class="col-md-3 bottom-grid">
							
						</div>
						
						
						
						<div class="clearfix"> </div>

				</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!--侧滑栏-->
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
<button id="sliderC" type="button" class="close" data-dismiss="alert" style="margin-top: 20px; margin-right: 20px; color: white">×</button>
	<h3>消息</h3>
	<!--<a href="" target="_blank">Celery seakale</a>
	<a href="" target="_blank">Dulse daikon</a>
	<a href="" target="_blank">Zucchini garlic</a>
	<a href="" target="_blank">Catsear azuki bean</a>
	<a href="" target="_blank">Dandelion bunya</a>
	<a href="" target="_blank">Rutabaga</a>-->
	<div style="overflow-y:auto;  height:450px;" class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						<big>Online Circle</big>
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<div id="dwo"></div>
					
				</div>
			</div>
		</div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <big>留言板</big>
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                    <p class="mes">侧滑栏出错好气啊</p>
                </div>
            </div>
        </div>
	</div>
		<div class="container" style="position: absolute; bottom: 10px">
		<div style="width: 361px; border: 1px solid #3CAFE6; padding-top: 3px; padding-bottom: 3px;  background-color: #3CAFE6">
		<p style="font-size: large; color: white;"><span id="sendName">${sessionScope.stuname}</span>&nbsp;对&nbsp;<span id="reciveName"></span>&nbsp;说:</p>
		</div>		
			<textarea id="sendText" class="form-control"  style="height:70px; width:316px; resize: none; float:left"></textarea>
			<button id="sendMessage" onClick="send()" class="mybtn" align="center" style="margin-left: 5px; height:70px; width:50px;" type="submit"><big><b>发<br>送</b></big></button>
		</div>

</nav>

<!--侧滑栏滑出标签-->
<script src="js/bootstrap.min.js"></script>
<script src="js/classie.js"></script>
<script>
	var menuRight = document.getElementById( 'cbp-spmenu-s2' );
			var showRightPush = document.getElementById( 'showRightPush' );
			var body = document.body;
			

	showRightPush.onclick = function() {
		classie.toggle( this, 'active' );
		//classie.toggle( body, 'cbp-spmenu-push-toleft' );
		classie.toggle( menuRight, 'cbp-spmenu-open' );
		//disableOther( 'showRightPush' );
	};
	
	
	
	
	//聊天
    var websocket = null;
     
    //判断当前浏览器是否支持WebSocket
    if('WebSocket' in window){
        websocket = new WebSocket("ws://115.159.49.167:8080/LoginDemo3/websocket");
    }
    else{
        alert('Not support websocket')
    }
     
    //连接发生错误的回调方法
    websocket.onerror = function(){
        setMessageInnerHTML("error");
    };
     
    //连接成功建立的回调方法
    websocket.onopen = function(event){
        setMessageInnerHTML("open");
    }
     
    //接收到消息的回调方法
    websocket.onmessage = function(){
  	  addMessage(event.data);
    }
     
    //连接关闭的回调方法
    websocket.onclose = function(){
        setMessageInnerHTML("close");
    }
     
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onunload = function(){
        websocket.close();
    }
     
    //将消息显示在网页上
    /* function setMessageInnerHTML(innerHTML){
        document.getElementById('message').innerHTML += innerHTML + '<br/>';
    } */
    
    function addMessage(content){
  	  content = JSON.parse(content);
  	  if(content.sendName==$("#sendName").html()){
  		//||content.reciveName==document.getElementById('sendName').value
  	    var neirong=" To "+content.reciveName+" : "+content.message;
  		var newP='<p class="wo">'+neirong+'</p>';
  		$("#dwo").after(newP);
  		
  	  //setMessageInnerHTML(neirong);
  	  }
  	  if(content.reciveName==$("#sendName").html()){
  		var neirong=content.sendName+" : "+content.message;
  		var newP='<p class="ta">'+neirong+'</p>';
  		$("#dwo").after(newP);
  	  }
  	  
    }
     
    //关闭连接
    function closeWebSocket(){
        websocket.close();
    }
     
    //发送消息
    function send(){
  	  //var message[];
  	  var sendName=$("#sendName").html();
  	  var reciveName=$("#reciveName").html();
  	  if(reciveName=="")
  		  alert("请点击好友头像上聊天按钮选择聊天对象");
  	  else{
  		  var message = document.getElementById('sendText').value;
          websocket.send(JSON.stringify({
      	  sendName : sendName,
      	  reciveName : reciveName,
      	  message:message
        }));
        $("#sendText").val("");
  	  }
    }
</script>


<script>
    var menuRight = document.getElementById( 'cbp-spmenu-s2' ),
            sliderC = document.getElementById( 'sliderC' ),
            body = document.body;

    sliderC.onclick = function() {
        classie.toggle( this, 'active' );
        classie.toggle( body, 'cbp-spmenu-push-toleft' );
        classie.toggle( menuRight, 'cbp-spmenu-open' );
        disableOther( 'sliderC' );
    };
</script>

<script type="text/javascript">
//
var menuRight = document.getElementById( 'cbp-spmenu-s2' );
	var showRightPush = document.getElementById( 'showRightPush' );
	var body = document.body;
function openChat(e){
    //alert(obj.id);
    //alert("open");
    var reciveName= e.id.substring(6);
    //alert(reciveName);
    $("#reciveName").html(reciveName);

	
	classie.toggle( this, 'active' );
	classie.toggle( body, 'cbp-spmenu-push-toleft' );
	classie.toggle( menuRight, 'cbp-spmenu-open' );
	//disableOther( 'showRightPush' );
}
</script>

<div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
	 <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
</div>
</body>
</html>