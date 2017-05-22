<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link href="css/home.css?v=2" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="jquery-3.1.0.js"></script>
<link rel="stylesheet" href="css/font.css"/>
<script type="text/javascript">
$(document).ready(function(){
	   $("#login").click(function () {  
		 	  $.ajax({ 
	           type: "post", 
	           url: "./LoginServlet", 
			   data:{stuname:$("#stuname").val(),
				     password:$("#password").val(),
			         }, 
	           //dataType:"json",
	           contentType: "application/x-www-form-urlencoded",
	           success: function (data) { 
	        	  if(data == "success"){
	        		  window.location.href = "Home.jsp";
	        	  }else if(data == "stuNameFailed"){
	        		  $("#tip").html("没有该用户名！");
	        		  
	        	  }else if(data == "passWordFailed"){
	        		  $("#tip").html("密码错误！");
	        		  
	        	  }else if(data == "nullStuName"){
	        		  $("#tip").html("请输入用户名！");
	        		  
	        	  }else if(data == "nullPassWord"){
	        		  $("#tip").html("请输入密码！");
	        		  
	        	  }
	           },  
	           error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	   alert("出错了！");
	        	   
	           }
		 	});
	   });
	   });</script>

</head>
<body>
<div class="wrap">
  <div class="banner-show" id="js_ban_content">
    <div class="cell bns-01">
      <div class="con"> </div>
    </div>
    <div class="cell bns-02" style="display:none;">
      <div class="con"> <a target="_blank" class="banner-link"> <i>左</i></a> </div>
    </div>
    <div class="cell bns-03" style="display:none;">
      <div class="con"> <a  target="_blank" class="banner-link"> <i>右</i></a> </div>
    </div>
  </div>
  <div class="banner-control" id="js_ban_button_box"> <a href="javascript:;" class="left">左</a> <a href="javascript:;" class="right">左</a> </div>
  <script type="text/javascript">
                ;(function(){                  
                    var defaultInd = 0;
                    var list = $('#js_ban_content').children();
                    var count = 0;
                    var change = function(newInd, callback){
                        if(count) return;
                        count = 2;
                        $(list[defaultInd]).fadeOut(400, function(){
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                        $(list[newInd]).fadeIn(400, function(){
                            defaultInd = newInd;
                            count--;
                            if(count <= 0){
                                if(start.timer) window.clearTimeout(start.timer);
                                callback && callback();
                            }
                        });
                    }
                    
                    var next = function(callback){
                        var newInd = defaultInd + 1;
                        if(newInd >= list.length){
                            newInd = 0;
                        }
                        change(newInd, callback);
                    }
                    
                    var start = function(){
                        if(start.timer) window.clearTimeout(start.timer);
                        start.timer = window.setTimeout(function(){
                            next(function(){
                                start();
                            });
                        }, 5000);
                       
                        
                    }
                    
                    
                    
               
                    
                    $('#js_ban_button_box').on('click', 'a', function(){
                        var btn = $(this);
                        if(btn.hasClass('right')){
                            //next
                            next(function(){
                                start();
                     
                            });
                          
                        }
                        else{
                            //prev
                            var newInd = defaultInd - 1;
                            if(newInd < 0){
                                newInd = list.length - 1;
                            }
                            change(newInd, function(){
                                start();
                        
                            });
                        
                        }
                        return false;
                    });
                 
                })();
                
                
          
          
              function del(){
                  
                      parent.window.location="ForgetPassword.jsp";
                     return true;
         
               }  
              function dell(){
                   
                   parent.window.location="regist.jsp";
                  return true;
      
            }
              function delll(){
                  
                  parent.window.location="MasterLogin.jsp";
                 return true;
     
           }
             
              
            </script>
  <div class="container">
    <div class="register-box">
      <div class="reg-slogan"> 登陆界面</div>
      <div class="reg-form" id="js-form-mobile"> <br>
        <br>
        <div class="cell" >
        
          <input type="text" name="mobile" id="stuname" class="text" maxlength="11" placeholder="请输入用户名"/>
       
           <div style=" float:right;text-align:center;height:40px;line-height:40px;">
          <a  style="cursor:pointer" onclick="dell()">用户注册</a>
          </div>
        </div>
        <div class="cell">
 
          <input type="password" name="passwd" id="password" class="text" maxlength="20" placeholder="请输入密码"//>

           <div style=" float:right;text-align:center;height:40px;line-height:40px;">
           <a  style="cursor:pointer" onclick="del()">忘记密码</a>
          </div>
         </div>
   
          <div id="tip" style="text-align:left;height:40px;line-height:40px; font-size:16px;color:red; width:308x;height:40px;margin:0px 0px 20px 0px;"> </div>
        <div class="bottom"> <a id="login" href="javascript:;" class="button btn-green">登录</a></div>
         <div style=" margin:20px 0px 0px 0px; float:right;text-align:center;height:40px;line-height:40px;">
        <a onclick="delll()" style="cursor:pointer" >管理员登陆</a>
        
      </div>
      
    </div>
  </div>
</div>
</body>
</html>