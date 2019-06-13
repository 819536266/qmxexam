<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>企明星考核系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/css/404.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var h = $(window).height();
		$('body').height(h);
		$('.mianBox').height(h);
		centerWindow(".tipInfo");
	});

	//2.将盒子方法放入这个方，方便法统一调用
	function centerWindow(a) {
		center(a);
		//自适应窗口
		$(window).bind('scroll resize',
				function() {
					center(a);
				});
	}

	//1.居中方法，传入需要剧中的标签
	function center(a) {
		var wWidth = $(window).width();
		var wHeight = $(window).height();
		var boxWidth = $(a).width();
		var boxHeight = $(a).height();
		var scrollTop = $(window).scrollTop();
		var scrollLeft = $(window).scrollLeft();
		var top = scrollTop + (wHeight - boxHeight) / 2;
		var left = scrollLeft + (wWidth - boxWidth) / 2;
		$(a).css({
			"top": top,
			"left": left
		});
	}
</script>
</head>
<body>
<div class="mianBox">
	<img src="<%=path %>/images/yun0.png" alt="" class="yun yun0" />
	<img src="<%=path %>/images/yun1.png" alt="" class="yun yun1" />
	<img src="<%=path %>/images/yun2.png" alt="" class="yun yun2" />
	<img src="<%=path %>/images/bird.png" alt="" class="bird" />
	<img src="<%=path %>/images/san.png" alt="" class="san" />
	<div class="tipInfo">
		<div class="in">
			<div class="textThis">
				<h2>操作失误！</h2>
				<p><span><a id="href" href="<%=path %>/login.jsp">跳转至登录页面</a>或者<a  href="javascript:history.go(-1);">返回上一页</a></span></p>
			</div>
		</div>
	</div>
</div>

</body>
</html>
