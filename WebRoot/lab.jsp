<%@ page language="java" import="java.util.*,java.sql.*,uno.meng.db.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>实验室|实验室管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/iziModal.css">
	<!--[if IE]>
		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
    <link rel="shortcut icon" href="favicons/1.png">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo2.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/zeroModal.js"></script>
  </head>
  <body class="body">
  <div class="header" id="demo">
  <%
String User=String.valueOf(session.getAttribute("SSN")).trim();
if(String.valueOf(session.getAttribute("SSN")).equals("null")){
	String name=request.getParameter("SSN");  
	session.setAttribute("SSN",name);
	User=String.valueOf(session.getAttribute("SSN")).trim();
}
%>
  <header class="header" id="header" style="height:50px">
    <div class="header-top">
      <div class="container">
        <a href="#" class="header-logo"></a>
        <nav class="header-nav">
          <a href="index.jsp" class="item">发现</a>
          <a href="lab.jsp" class="item  item-cur">实验室</a>
          <a href="projects.jsp" class="item">项目</a>
          <a href="course.jsp" class="item">课程</a>
        </nav>
        <div class="header-user">
        <a href="main.jsp" class="login trigger-custom"><%=User %></a>
        </div>
      </div>
    </div>
  </header>
  <script src="js/jquery.js"></script>
  <script src="js/script.js"></script>
<div class="container">
	<div class="component">
		<table style="text-align:center;">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
					<th>新建时间</th>
					<th>成员数量</th>
					<th>所长</th>
				</tr>
			</thead>
			<tbody>
			<%
			  String sql = "select * from LABORATORY";//SQL语句  
              DBHelper db = new DBHelper(sql);//创建DBHelper对象  
              ResultSet ret = db.pst.executeQuery();//执行语句，得到结果集  
              while (ret.next()){  
			 %>
				<tr>
				<td class="user-name"><a href="javascript:_iframe(<%=ret.getInt(1) %>)"><%=ret.getInt(1) %></a></td>
				<td class="user-email"><%=ret.getString(2) %></td>
				<td class="user-phone"><%=ret.getDate(3) %></td>
				<td class="user-phone"><%=ret.getInt(4) %></td>
				<td class="user-phone"><a href="javascript:_iframe2(<%=ret.getInt(5) %>)"><%=ret.getInt(5) %></a></td>
				</tr>
				<%
				}
				 %>
				 <script>
				   function _iframe(name) {
       					 zeroModal.show({
            				title: '实验室'+name+'详情',
            				iframe: true,
           				 url: 'labmain.jsp?no='+name,
            			width: '80%',
            			height: '80%',
           				 cancel: true
        });
    }
    function _iframe2(name) {
       					 zeroModal.show({
            				title: 'Leader'+name+'详情',
            				iframe: true,
           				 url: 'leader.jsp?name='+name,
            			width: '80%',
            			height: '80%',
           				 cancel: true
        });
    }
				 </script>
			</tbody>
		</table>
	</div>
</div><!-- /container -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.ba-throttle-debounce.min.js"></script>
<script src="js/jquery.stickyheader.js"></script>
</div>
</body>
</html>
