<!--@author 贾岩琦-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
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
<!-- //end-smoth-scrolling -->
<link rel="stylesheet" href="css/base.css">
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.fitvids.js"></script>
<script src="js/script.js"></script>

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
	   <a href="Home.html"><img src=""  alt=""></a>
   </div>
	 <div class="top-navg autoHeight">
		 <span class="menu"> <img src="images/icon.png" alt=""/></span>
		 <nav class="cl-effect-13">
			 <ul class="res">
				 <li><a href="Home.jsp"><b><big>地盘</big></b></a></li>
				 <li><a href="Zooms.jsp"><b><big>圈子</big></b></a></li>
				 <li><a href="friends.jsp"><b><big>朋友</big></b></a></li>
				 <li><a class="activjsp" href="gallery.jsp"><b><big>相册</big></b></a></li>
				 <li><a href="about.html"><b><big>关于我们</big></b></a></li>
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
<!--content-->
<div class="gallery">
<div class="container">
	<div class="projectThumbnail">
		<div class="projectThumbnailHover projcet-ro">
			<h4>Tour</h4>
			<h5>Nam libero tempore cum</h5>
		</div>
		</div>
	<div  class="hotel-head">
		<h1>相册</h1>
		<span class="lft-bar-welcom"> </span>
		<span class="rit-bar-welcom"> </span>
	</div>
	<div class="project-top wow fadeInUp animated" data-wow-delay="0.3s">
	<div class="col-md-4 project">
			<div class="projectThumbnail">
				<div data-toggle="modal" data-target="#myModal">
					<a href="javascript:void(0);" id="addImage">
						<img style="width: 265px; height: 263px; margin-left: 45px" src="images/addPhoto.png" alt="Project 01" class="img-responsive thumbnailImage" />
					</a>
				</div>
			</div>
		</div>
	
		<div  id="div0" class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title1" style="margin-top: 85px;"></h4>
					<h5 id="content1" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>
				<img id="photo1" style="width: 350px; height: 263px;" src="" class="img-responsive thumbnailImage" />
			</div>
		</div>
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title2" style="margin-top: 85px;"></h4>
					<h5 id="content2" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>			
				<img id="photo2" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title3" style="margin-top: 85px;"></h4>
					<h5 id="content3" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>	
				<img id="photo3" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title4" style="margin-top: 85px;"></h4>
					<h5 id="content4" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>
				<img id="photo4" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title5" style="margin-top: 85px;"></h4>
					<h5 id="content5" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>	
				<img id="photo5" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4  id="title6" style="margin-top: 85px;"></h4>
					<h5 id="content6" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>	
				<img id="photo6" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		<div class="col-md-4 project">
			<div class="projectThumbnail">
			<div class="projectThumbnailHover projcet-ro">
					<h4 id="title7" style="margin-top: 85px;"></h4>
					<h5 id="content7" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>
			
				<img id="photo7" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div>
		<div class="col-md-4 project">
			<div class="projectThumbnail">
				<div class="projectThumbnailHover projcet-ro">
					<h4  id="title8" style="margin-top: 85px;"></h4>
					<h5 id="content8" class="col-md-11" style="padding-top: 128px;"></h5>
				</div>	
				<img id="photo8" src="" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />
			</div>
		</div> 
		

		
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传照片</h4>
				</div>
				<div class="modal-body">
					<div class="container ">
						<form  action="./UploadPhotoServlet" enctype="multipart/form-data" method="post">
							<div class="container ">
							 <div class="col-md-12">
									<label class="control-label"><strong>光影名称</strong></label>
								</div>
								<textarea name="title"  id="title" class="form-control center-block" style="height:34px; width:480px; resize: none; margin-left: 16px; margin-bottom: 12px"></textarea>
							
							<div class="col-md-12">
								<label class="control-label"><strong>在此留下你的照片故事<br></strong></label>
							</div>
							<textarea name="description"  id="description" class="form-control center-block" style="height:120px; width:480px; resize: none; margin-left: 16px"></textarea>
								</div>
							<div class="col-md-12" style="margin-top: 10px;">
								<div class="form-group col-md-2">
									<label class="control-label"><strong>上传你的光影记忆</strong></label>
									<input type="file" name="filepath" accept="image/*" id="filepath">
								</div>
								<button type="submit" class="btn btn-info col-md-offset-1" style="margin-top:21px; margin-left: 229px" >保存相片</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</div>
<!---->
<!--footer start here-->
<!--<div class="map">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d158858.182370726!2d-0.10159865000000001!3d51.52864165!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2sin!4v1431577187804"> </iframe>
<div class="footer">
<div class="container">
	<div class="footer-main">
		<div class="col-md-4 ftr-grids wow bounceIn" data-wow-delay="0.4s">
			<h4>Get in Touch</h4>
			<ul class="get-touch">
				<li><span class="share"> </span><a href="#">Tempor incididunt ut labore et dolore </a></li>
				<li><span class="email"> </span><a href="mailto:info@example.com">example@gmail.com</a> </li>
				<li><span class="phone"> </span>+613 1544 5578 </li>
			</ul>
		</div>
		<div class="col-md-4 ftr-grids wow bounceIn" data-wow-delay="0.4s">
			<h4>Follow Us</h4>
			<ul class="mid-grid">
				<li><a href="#"><span class="tw"> </span></a></li>
				<li><a href="#"><span class="gmail"> </span></a> </li>
				<li><a href="#"><span class="inst"> </span></a> </li>
				<li><a href="#"><span class="pri"> </span></a> </li>
			</ul>
		</div>
		<div class="col-md-4 ftr-grids wow bounceIn" data-wow-delay="0.4s">
			<h4>Popular Posts</h4>
			<div class="ftr-last">
			  <div class="ftr-month">
				 <h6>January</h6>
			  </div>
			  <div class="ftr-like">
				 <h6>3 likes</h6>
			  </div>
			  <div class="clearfix"> </div>
			</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sed</p>
			<div class="ftr-last">
			  <div class="ftr-month">
				 <h6>February</h6>
			  </div>
			  <div class="ftr-like">
				 <h6>5 likes</h6>
			  </div>
			  <div class="clearfix"> </div>
			</div>
			<p>Lorem ipsum dolor sit consectetur adipiscing eiusmod tempor</p>
			<div class="ftr-last">
			  <div class="ftr-month">
				 <h6>March</h6>
			  </div>
			  <div class="ftr-like">
				 <h6>2 likes</h6>
			  </div>
			  <div class="clearfix"> </div>
			</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sed</p>
			<div class="ftr-last">
			  <div class="ftr-month">
				 <h6>April</h6>
			  </div>
			  <div class="ftr-like">
				 <h6>7 likes</h6>
			  </div>
			  <div class="clearfix"> </div>
			</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sed</p>
		</div>
	   <div class="clearfix"> </div>
	</div>
</div>
</div>
</div>-->
<!--footer end here-->
<div class="copy-right wow bounceInLeft" data-wow-delay="0.3s">
 <p>Copyright &copy; 2016.Group JustAName All rights reserved.</p>
</div>

<script type="text/javascript">
//初始化相册
$(document).ready(function(){
	  $.ajax({ 
          type: "post", 
          url: "./GalleryServlet", 
		   data:{}, 
          dataType:"json",
          contentType: "application/x-www-form-urlencoded",
          success: function (data) { 
          	for(var i=1; i<=data.length; i++){ 
          		var title =  data[i-1].title;
  	      		var description = data[i-1].description;
  	      		var stuName = data[i-1].stuName;
  	      		var photo = data[i-1].photo;
/*    	      		 var newdiv = '<div id="'+ "divvv"+ i +'" class="">'+
			  				'<div id="'+ "div"+ i +'" class="">'+
			  				'<div  id="'+ "divv"+ i +'" class="">'+
			  						'<h4 id="title2" style="margin-top: 85px;">'+title+'</h4>'+
			  						'<h5 id="content2" class="col-md-11" style="padding-top: 128px;">'+description+'</h5>'+
			  					'</div>	'+
			  					'<img id="'+ "photoo"+ i +'" src="'+photo+'" style="width: 350px; height: 263px;" class="img-responsive thumbnailImage" />'+
			  				'</div>'+
			  			'</div>' 
                        $("#div0").before(newdiv);
                        var class11 = "col-md-4 project";
			  			var class12 = "projectThumbnail";
			  			var class13 = "projectThumbnailHover projcet-ro";
			  			var class14 ="img-responsive thumbnailImage";
			  			$("#divvv" +i).attr("class",class11);
                        $("#div" +i).attr("class",class12);
                        $("#divv" +i).attr("class",class13);
                        $("#photoo" +i).attr("class",class14);
                        $("#div" +i).addClass(class12); */
         			 	$("#photo" +i).attr("src",photo);
        				$("#title" +i).html(title);
        				$("#content" +i).html(description);  
			   	}
          },  
          error: function(XMLHttpRequest, textStatus, errorThrown) {
       	   alert(XMLHttpRequest.status);
       	   alert(XMLHttpRequest.readyState);
       	   alert(textStatus);
          }
	 	});
		
});

</script>

<script src="js/bootstrap.min.js"></script>
<script>
	$('#addImage').modal('hide');
	$('#')
</script>




</body>
</html>