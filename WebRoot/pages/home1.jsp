<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home1.jsp' starting page</title>
    
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
    <link href="files/home/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="files/home/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
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

      <!-- Unnamed (Flow Shape) -->
      <div id="u2" class="ax_flow_shape">
        <img id="u2_img" class="img " src="images/home/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Menu) -->
      <div id="u4" class="ax_menu">
        <img id="u4_menu" class="img " src="images/home/u4_menu.png" alt="u4_menu"/>

        <!-- Unnamed (Table) -->
        <div id="u5" class="ax_table">

          <!-- Unnamed (Menu Item) -->
          <div id="u6" class="ax_table_cell">
            <img id="u6_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u7" class="text">
              <p><span><a href="process/advancedSearch">查询</a></span></p>
            </div>
          </div>

          <!-- Unnamed (Menu Item) -->
          <div id="u8" class="ax_table_cell">
            <img id="u8_img" class="img " src="images/home/u6.png"/>
            <!-- Unnamed () -->
            <div id="u9" class="text">
              <p><span><a href="process/openInsert">流程图</a></span></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u10" class="ax_image">
        <a href="page/openHome"> <img src="images/home/touming.jpg" style="height: 60px; width: 350px; "/></a>
        <!-- Unnamed () -->
        <div id="u11" class="text">
          <p><span></span></p>
        </div>
      </div>
    </div>
    <div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <table class="table table-hover" align="center" cellpadding="15">
				 <thead>
    				<tr align="center">
  					  <th style="width: 35px; ">用户名</th><th style="width: 107px; "> 密码 </th>
    				</tr>
   				 </thead>
   				 <tbody>
    				<c:forEach var="user" items="${user}">
     				<tr align="center">
     					<td>${user.name}</td>
     					<td>${user.password}</td>
     				</tr>
     				</c:forEach>
			</table>
		</div>
  </body>
</html>
