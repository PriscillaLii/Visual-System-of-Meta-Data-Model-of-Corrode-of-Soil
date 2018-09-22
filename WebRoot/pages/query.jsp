<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'query2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>query</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/query/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="files/query/data.js"></script>
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
	div#menu {background-color:#ffffff; outline-color: ffffff; outline-width:2px; outline-style:solid; height:170px;width:170px;float:left;}
	div#content {height:400px;width:950px;float:left;}
	h1 {margin-bottom:0;}
	h2 {margin-bottom:0;font-size:18px;}
	ul {margin:0;}
	li {list-style:none;}
</style>
  </head>
  
  <body>
    <div id="base" class="">

      <!-- Unnamed (Flow Shape) -->
      <div id="u0" class="ax_flow_shape">
        <img id="u0_img" class="img " src="images/home/u0.png"/>
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u2" class="ax_shape">
        <img id="u2_img" class="img " src="images/query/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Flow Shape) -->
      <div id="u4" class="ax_flow_shape">
        <img id="u4_img" class="img " src="images/home/u2.png"/>
        <!-- Unnamed () -->
        <div id="u5" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Menu) -->
      <div id="u6" class="ax_menu">
        <img id="u6_menu" class="img " src="images/home/u4_menu.png" alt="u6_menu"/>

        <!-- Unnamed (Table) -->
        <div id="u7" class="ax_table">

          <!-- Unnamed (Menu Item) -->
          <div id="u8" class="ax_table_cell">
            <img id="u8_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u9" class="text">
              <p><span><a href="process/advancedSearch">查询</a></span></p>
            </div>
          </div>

          <!-- Unnamed (Menu Item) -->
          <div id="u10" class="ax_table_cell">
            <img id="u10_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u11" class="text">
              <p><span><a href="process/openInsert">流程图</a></span></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u12" class="ax_image">
        <a href="page/openHome"> <img src="images/home/touming.jpg" style="height: 60px; width: 350px; "/></a>
        <!-- Unnamed () -->
        <div id="u13" class="text">
          <p><span></span></p>
        </div>
      </div>
    </div>
    <br><br><br><br><br><br><br><br>
    <div id="header"></div>
    <div id="menu"></div>
      <div id="content">
  <jsp:include  page="/pages/queryHead.jsp"></jsp:include>
  <div align="center">
  <img src="images/insert/u51_line.png" align="center"/>
  </div>
  <div class="panel panel-primary">
   <div class="panel-body">
    <table class="table table-hover" align="center" cellpadding="10">
    <thead>
    <tr align="center">
    <th style="width: 35px; ">名称</th><th> 原始数据类型 </th><th> 输出数据类型 </th><th> 创建人 </th><th> 创建时间 </th><th> 当前状态 </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="process" items="${result}">
     <tr align="center">
      <td>${process.name}</td>
      <td>${process.input}</td>
      <td>${process.output}</td>
      <td>${process.contributor}</td>
      <td>${process.setupDate}</td>
      <td>${process.state}</td>
      <!-- 撸进insert页面修改之 --> 
      <td><a href="process/detail/${process.name}">修改</a></td>
      <td><a href="process/delete/${process.name}">删除</a></td>
      <td><a href="process/write/${process.name}">格式化输出</a></td>
      <!-- 上一语句还需修改 -->
     </tr>
    </c:forEach>
    </tbody>
   </table>
   <a href="process/javaToJs"><input type="button" value="java-json-js-jsp"></a>
   </div>
   </div>
   </div>
  </body>
</html>
