<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
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
    
    <title>My JSP 'insert2.jsp' starting page</title>
    
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
  </head>
  
  <body bgcolor="#ffffff">
    <div id="base" class="">

      <!-- Unnamed (Flow Shape) -->
      <div id="u0" class="ax_flow_shape">
        <img id="u0_img" class="img " src="images/home/u0.png"/>
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (HTML Button) -->
      <div id="u2" class="ax_html_button">
        <input id="u2_input" type="submit" value="保存至数据库"/>
      </div>

      <!-- Unnamed (HTML Button) -->
      <div id="u3" class="ax_html_button">
        <input id="u3_input" type="submit" value="保存至文本"/>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u4" class="ax_horizontal_line">
        <img id="u4_line" class="img " src="images/insert/u4_line.png" alt="u4_line"/>
      </div>

      <!-- Unnamed (Flow Shape) -->
      <div id="u5" class="ax_flow_shape">
        <img id="u5_img" class="img " src="images/home/u2.png"/>
        <!-- Unnamed () -->
        <div id="u6" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Menu) -->
      <div id="u7" class="ax_menu">
        <img id="u7_menu" class="img " src="images/home/u4_menu.png" alt="u7_menu"/>

        <!-- Unnamed (Table) -->
        <div id="u8" class="ax_table">

          <!-- Unnamed (Menu Item) -->
          <div id="u9" class="ax_table_cell">
            <img id="u9_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u10" class="text">
              <p><span><a href="process/advancedSearch">查询</a></span></p>
            </div>
          </div>

          <!-- Unnamed (Menu Item) -->
          <div id="u11" class="ax_table_cell">
            <img id="u11_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u12" class="text">
              <p><span><a href="process/openInsert">流程图</a></span></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u13" class="ax_image">
        <a href="page/openHome"> <img src="images/home/touming.jpg" style="height: 60px; width: 350px; "/></a>
        <!-- Unnamed () -->
        <div id="u14" class="text">
          <p><span></span></p>
        </div>
      </div>
    </div>
    <br><br><br><br><br><br><br><br><br>
    <div id="header"></div>
    <div id="menu" style="width: 194px; "></div>
    <div id="content" align="center">
		<br>
			<%@ include  file="Insert.html"%>
		<br>
		<input id= fileDetail type="text" style="visibility:hidden; width: 70px" value=<%=request.getSession().getAttribute("processString")%> >
		
		<img id="" class="img " src="images/insert/u4_line.png" alt="u4_line"/>
		
		<form action="process/read" method="post" enctype="multipart/form-data" >
			<input type="file" id="file" class="ax_html_button" name="file" />
			<input type="submit" class="ax_html_button" value="Upload" />
		</form>
		</div>
		
	

  </body>
</html>
