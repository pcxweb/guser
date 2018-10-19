
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head> 
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="icon" href="gea.ico" type="image/x-icon"> 
	<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="assets/css/admin.css">
	<link rel="stylesheet" href="assets/css/index.css">
	<link rel="icon" href="gea.ico" type="image/x-icon">
	<script src="assets/js/jquery.min.js"></script> 
	<script src="assets/js/app.js"></script>
</head>
<body>
	<header class="am-topbar am-topbar-inverse admin-header">
		<div class="am-topbar-brand">
			<strong><img src="assets/i/logowhite.png" height="30" alt=""></strong> <small>酒店预定</small>
		</div>

		<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
				<li class="am-dropdown" data-am-dropdown>
					<a class="am-dropdown-toggle" id="user_namebox"  href="javascript:;">
						<span class="am-icon-user"></span> <b class="user_name">${sessionScope.geauser.name}</b>
					</a>
				</li>
				<li class="am-hide-sm-only"><a href="javascript:;" id="loginbox"><button type="button" class="am-btn am-btn-xs am-btn-primary" id="clicklogin">登录</button></a></li>
				
				<li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
			</ul>
		</div>
	</header>
	<!-- 登录模态框 -->
	<div class="am-g">
		<div class="am-u-sm-12">
			<div class="am-modal" tabindex="-1" id="loginModal">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">登录
			      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			    </div>
			    <div class="am-modal-bd am-u-sm-12 ">

			    	
			    		<form method="post" id="loginform" action="/hotel/login" >
			    			<div class="am-form-group">
								<label for="email">账号:</label>
			    				<input type="text" name="name" id="name" value="" placeholder="账号">
							</div>
							<div class="am-form-group">
								<label for="password">密码:</label>
			    				<input type="password" name="password" id="password" value="" placeholder="密码">
							</div>
			    			<!-- <div class="am-cf">
			    				<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
			    			</div> -->
			    		</form>
			      	
			    </div>
			    <div class="am-modal-footer">
			    	<span class="js-model-btn am-btn" id="cancellogin">取消</span>
					<span class="js-model-btn am-btn" id="sublogin" type=submit>登录</span>
			    </div>
			  </div>
			</div>
		</div>

	</div>

</body>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 
<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script> 
<!--<![endif]-->  
<script type="text/javascript">
	$(function(){
		$("#clicklogin").click(function(){

			$("#loginModal").modal('open')
		})
		//取消
		$("#cancellogin").click(function(){
			$("#loginModal").modal("close");
		}) 
		$("#sublogin").click(function(){
			$("#loginform").submit();
			// $("#loginModal").modal("close");
		})

		var user_name = $(".user_name").text();
		if(user_name!=""){
			// console.log(1)
			$("#loginbox").css('display','none')
			$("#user_namebox").css('display','block')
		}else{
			$("#loginbox").css('display','block')
			$("#user_namebox").css('display','none')
		}
	})
</script>
</html>
