<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'query1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="panel panel-primary">
   <div class="panel-heading">
      <h3 class="panel-title" align="center">搜索</h3>
   </div>
   <div class="panel-body">
  <form action="process/advancedSearch" method="post">
    <table class="table table-hover" align="center">
    	<tbody>
    	<tr>
    	<td>
      		<input type="text" class="form-control" name="name" placeholder="名称">
      	</td>
      	<td style="width: 200px; ">
      		<input type="text" class="form-control" name="input" placeholder="输入项（多个项之间用空格隔开）" style="width: 194px; ">
      	</td>
      	<td style="width: 200px; ">
      		<input type="text" class="form-control" name="output" placeholder="输出项（多个项之间用空格隔开）" style="width: 194px; ">
      	</td>
      	<td>
        	<button class="btn btn-primary" type="submit">搜索</button>
        	</td>
        	</tr>
        	</tbody>
  		</table>
    </form>
    </div>
    </div>
  </body>
</html>
