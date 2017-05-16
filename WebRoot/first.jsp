<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首次登陆</title>
    <link rel="stylesheet" media="screen" href="css/zzsc.css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <body>
<form id="msform"  action="reflesh" method="post" style="margin-top:15%">
	<ul id="progressbar">
		<li class="active">基本信息</li>
		<li>导师信息</li>
		<li>实验室信息</li>
	</ul>
	<input type="hidden" name="SSN" value="<%=session.getAttribute("SSN")%>">
	<fieldset>
		<h2 class="fs-title">个人基本信息</h2>
		<h3 class="fs-subtitle">1/3</h3>
		<input type="text" name="name" placeholder="姓名" />
		<input type="text" name="salary" placeholder="薪水" />
		<input type="button" class="next action-button" value="下一步" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">导师信息</h2>
		<h3 class="fs-subtitle">2/3</h3>
		<input type="text" name="tutorssn" placeholder="导师SSN" />
		<input type="button"  class="previous action-button" value="上一步" />
		<input type="button"  class="next action-button" value="下一步" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">实验室信息</h2>
		<h3 class="fs-subtitle">3/3</h3>
		<input type="text" name="laboratoryno" placeholder="实验室编号" />
		<textarea name="comment" placeholder="评价"></textarea>
		<input type="button" name="previous" class="previous action-button" value="上一步" />
		<input type="submit" onclick="submitYouFrom('reflesh')" class="submit action-button" value="提交"/>
	</fieldset>
	</form>
	<script type="text/javascript" language="javascript">
function submitYouFrom(path){
 $('msform').action=path;
 $('msform').submit();
}
</script>
<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
<script src="js/jquery.easing.min.js" type="text/javascript"></script>
<script src="js/zzsc.js" type="text/javascript"></script>
  </body>
</html>
