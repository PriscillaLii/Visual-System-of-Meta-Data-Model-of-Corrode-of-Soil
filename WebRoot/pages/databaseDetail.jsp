<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Controller.UserController" %> 
<%@ page import="Model.User" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	
	<title>Services - Black White HTML5 Template</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-treeview.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/jsplumb.css"/>
	 <link rel="stylesheet" type="text/css" href="css/buttons.css">	
	 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/insert/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/ie.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="files/insert/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
    
    <style type="text/css">
	div#container{width:500px}
	div#header {background-color:ffffff;}
	div#menu {background-color:#ffffff; outline-color: ffffff; outline-width:2px; outline-style:solid; height:170px;width:300px;float:left;}
	div#content {height:500x;float:left;}
	h1 {margin-bottom:0;}
	h2 {margin-bottom:0;font-size:18px;}
	ul {margin:0;}
	li {list-style:none;}
	body {background-color:#ffffff !important; }
</style>
<!--    <style type="text/css">
      body {
          padding-top: 60px;
          padding-bottom: 40px;
          float: center;
          background-color:#ffffff !important;
        }
    </style>  -->

    
     <style type="text/css">
	div#container{width:500px}
	div#header {background-color:#ffffff;}
	div#left {background-color:#ffffff; outline-color: ffffff;  height:400px;width:146px;float:left;}
	div#right {height:400px;width:700px;float:left;}
	h1 {margin-bottom:0;}
	h2 {margin-bottom:0;font-size:18px;}
	ul {margin:0;}
	li {list-style:none;}
</style> 
</head>
<body>
	<div class="templatemo-logo visible-xs-block">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg logo-left-container">
			<h1 class="logo-left">Black</h1>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg logo-right-container">
			<h1 class="logo-right">White</h1>
		</div>			
	</div>
	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h1 class="logo-left hidden-xs margin-bottom-60">Black</h1>	
			<div class="tm-left-inner-container">
								<ul class="nav nav-stacked templatemo-nav">
				  <li><a href="/pages/index.jsp"><i class="fa fa-home fa-medium"></i>主页</a></li>
				  <li><a href="process/advancedSearch"><i class="fa fa-shopping-cart fa-medium"></i>查询</a></li>
				  <li><a href="services.jsp" class="active"><i class="fa fa-send-o fa-medium"></i>流程图</a></li>
				  <li><a href="testimonials.jsp"><i class="fa fa-comments-o fa-medium"></i>Testimonials</a></li>
				  <li><a href="about.jsp"><i class="fa fa-gears fa-medium"></i>About Us</a></li>
				  <li><a href="contact.jsp"  ><i class="fa fa-envelope-o fa-medium"></i>Contact</a></li>
				</ul>
			</div>
		</div> <!-- left section -->
		<div class=" white-bg right-container">
			<h1 class="logo-right hidden-xs margin-bottom-60">White</h1>
			<div class="tm-right-inner-container">
				<h1 class="templatemo-header">Services</h1>
						
				 <div >
				 
		<br>
       
         <div class="col-md-2" style="height:600px; width:210px !important">
          <div class="panel panel-default" style="margin:2px;height:600px">
            <div class="panel-body">
              <div id="control-panel">
              </div>
            </div>
          </div>
        </div>
        
   <div style="position:absolute; top:145px; left:800;">
        <input id="u2_input" type="submit"  style = "height:50px;" class="button green serif back xl glass icon" onclick="window.location.href='process/advancedSearch.action'" value="保存至数据库"/>
      </div>

      <!-- Unnamed (HTML Button) -->
      <div style="position:absolute; top:145px; left:1200;">
        <input id="u3_input" type="submit" style = "height:50px;" class="button blue back xl glass icon" onclick="javaScript:alert('Done');  " value="保存至文本"/>
      </div>
      
        <div class="col-md-6" style="height:600px; width:952px !important; position:absolute; top:215px; left:560;" >
          <div class="panel panel-default" style="margin:2px;height:600px;width:950px !important">
            <div class="panel-body">
              <div id="flow-panel" class='col-md-12' style="position:absolute;height:100%">
              </div>
            </div>
          </div>
        </div> 

		<br>
		
<!-- 		<div style="position:absolute; top:250px; left:1550;">
        <input id="u2_input" type="submit"  style = "height:50px;" class="button blue brackets" onclick="window.location.href='process/advancedSearch.action'" value="保存至数据库"/>
      </div>

      Unnamed (HTML Button)
      <div style="position:absolute; top:350px; left:1550;">
        <input id="u3_input" type="submit" style = "height:50px;" class="button blue brackets" onclick="window.location.href='process/process/openInsert'" value="保存至文本"/>
      </div> -->
      
		<input id= fileDetail type="text" style="visibility:hidden; width: 70px" value=<%=request.getSession().getAttribute("processString")%> >
		
		<img id="" class="img " src="images/insert/u4_line.png" alt="u4_line"/>
		
		<form action="process/read" method="post" enctype="multipart/form-data" style="position:absolute; top:855px; left:600;">
			<input type="file" id="file"   style = "height:50px; " class="button blue brackets" name="file" />
			<input type="submit" style = "margin-left:100px; " class="button pink serif skew glossy"  value="Upload" />
		</form>
		</div>
				

			</div>	
		</div> <!-- right section -->
	</div>	
	
	<script type='text/javascript'></script>
    <script type="text/javascript" src="./libs/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="./libs/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="./libs/d3.min.js"></script>
    <script type="text/javascript" src="./libs/bootstrap.min.js"></script>
    <script type="text/javascript" src="./libs/bootstrap-treeview.min.js"></script>
    <script type="text/javascript" src="./libs/json2.js"></script>
    <script type="text/javascript" src="./libs/jquery.jsPlumb-1.7.2.js"></script>
    <script type="text/javascript" src="./libs/biltong-0.2.js"></script>
    <script type="text/javascript" src="./libs/jsBezier-0.6.js"></script>
    
    <script type="text/javascript" src="./libs/main.js"></script>
</body>
</html>