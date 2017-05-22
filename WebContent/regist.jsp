<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.app-cam 

.OutOfTheSelect{border:5px solid  #C0C0C0;width:300px;height:19px;clip:rect(0px,181px,18px,0px);}
 
 .MiddleOfTheSelect{ width: 300px;
  padding: 15px;
  color:Black;
  font-size: 0.85em;
  outline: none;
  font-weight: 300;
  font-size: 0.85em;
  border-color: #66ff66;
    background-color: rgba(247, 247, 247, 0.5);
 height:20px;
  margin:0 0 1em 0;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;}
 select{position:relative;left:-2px;top:0px;  font-size:18px;width:235px;line-height:14px;border:0px;color:#909993;}

input[type="text"] {
  width: 300px;
  padding: 15px;
  color:#999;
  font-size: 0.85em;
  outline: none;
  font-weight: 300;

  border-color: #66ff66;
    background-color: rgba(247, 247, 247, 0.5);
    border: 30px;
  margin:0 0 1em 0;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
}
.app-cam 
input[type="answer"] {
  width: 300px;
  padding: 15px;
  color:#999;
  font-size: 0.85em;
  outline: none;
  font-weight: 300;

  border-color: #66ff66;
    background-color: rgba(247, 247, 247, 0.5);
    border: 30px;
  margin:0 0 1em 0;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
}
.app-cam 
input[type="password"] {
  width: 300px;
  padding: 15px;
  color:#999;
  font-size: 0.85em;
  outline: none;
  font-weight: 300;

  border-color: #66ff66;
    background-color: rgba(247, 247, 247, 0.5);
    border: 30px;
  margin:0 0 1em 0;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
}
.app-cam 
input[type="confirmpassword"] {
  width: 300px;
  padding: 15px;
  color:#999;
  font-size: 0.85em;
  outline: none;
  font-weight: 300;

  border-color: #66ff66;
    background-color: rgba(247, 247, 247, 0.5);
    border: 30px;
  margin:0 0 1em 0;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 2px;
  -o-border-radius: 2px;
}

#btn2_mouseover {
   BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: 
#2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: 
progid:DXImageTransform.Microsoft.Gradient(GradientType=0, 
StartColorStr=#ffffff, EndColorStr=#D7E7FA); BORDER-LEFT: #2C59AA 
1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; 
BORDER-BOTTOM: #2C59AA 1px solid
}

#btn2_mousedown
{
   BORDER-RIGHT: #FFE400 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: 
#FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: 
progid:DXImageTransform.Microsoft.Gradient(GradientType=0, 
StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #FFE400 
1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; 
BORDER-BOTTOM: #FFE400 1px solid
} 

#btn2_mousedown {
   BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: 
#2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: 
progid:DXImageTransform.Microsoft.Gradient(GradientType=0, 
StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #2C59AA 
1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; 
BORDER-BOTTOM: #2C59AA 1px solid
} 
</style>
<center>

<div>
<div style="float:left;"><h1><i><font size=2 ><a href = "index.jsp" style="display:block;text-decoration: none;color="blue";font-weight=lighter">登入界面<a/></font></i></h1></div>
<div style="float:left;"><h1><i><font size=2>&nbsp>&nbsp忘记密码？</font></i></h1></div>
</div>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新用户注册</title>

<script type="text/javascript" src="jquery-3.1.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	   $("#regist").click(function () {
			   var pwd = $("#password").val();
			   var cfmPwd = $("#cfmPwd").val();
			   if( pwd == cfmPwd){
					  $.ajax({ 
				           type: "post", 
				           url: "./RegisteServlet", 
						   data:{stuname:$("#stuname").val(),
							     password:$("#password").val(),
						         }, 
				           //dataType:"json",
				           contentType: "application/x-www-form-urlencoded",
				           success: function (data) { 
				        	  if(data == "success"){
				        		  alert("注册成功");
				        		  window.location.href="index.jsp";
				        	  }else if(data == "stuNameFailed"){
				        		  
				        	  }else if(data == "passWordFailed"){
				        		  
				        	  }else if(data == "nullStuName"){
				        		  
				        	  }else if(data == "nullPassWord"){
				        		  
				        	  }
				           },  
				           error: function(XMLHttpRequest, textStatus, errorThrown) {
				        	   alert("出错了！");
				           }
					 	});
			       }else{
				   alert("两次密码输入不一致");
			  }
	   });
	   });</script>
</head>
<body  >
<img src="background3.jpg" width="100%" height="100%" style="background-size:100% 100%;position:fixed;top:0;left:0;right:100;z-index:-1">
<H1>新用户注册&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</H1>
<HR size="3" color = "brown">
    
<BR></BR>


<div id="box3" style="background-color:; height:250px; width:500px;display:'';align:center">
   

 <div class="app-cam">
 
 <input type="text" class="text" id="stuname" name="user_name" value="" placeholder="请输入用户名">
		<BR></BR>
		<input type="password" id="password" name="user_password" value="" placeholder="密码" >
		<BR></BR>
		<input type="password" id="cfmPwd" name="user_password" value="" placeholder="确认密码" >
        <BR></BR> 	    
		

  </div>

 
     



<div style="margin:0px 220px 0px 0px;height:100px;width:500px;right:600px">
<INPUT name="submit" id="regist" type="button" value="提交"   style="margin:0px 0px 0px 0px;width:100px;background-color:rgba(247, 247, 247, 0.5);height:40px;  border-radius: 10px;">
<INPUT name="submit" type="submit" value="清除" id="btn" onclick="btn()"  style="margin:0px 0px 0px 0px;width:100px;background-color:rgba(247, 247, 247, 0.5);height:40px;  border-radius: 10px;">
<INPUT name="submit" type="submit" value="返回" id="btn"   style="margin:0px 0px 0px 0px;width:100px;background-color:rgba(247, 247, 247, 0.5);height:40px;  border-radius: 10px;">
</div>

</div>


</SELECT><BR></BR>
        
</body>
<script type="text/javascript">



</script>
</center>
</html>