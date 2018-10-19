<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>年会酒店房间安排系统</title>
    <meta charset="utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="keywords" content="index" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /> 
	<meta name="renderer" content="webkit" /> 
	<link rel="icon" href="gea.ico" type="image/x-icon">
	<!-- 自动补全 -->
	<link rel="stylesheet" href="assets/css/jquery.autocompleter.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="leftmemu.jsp"></jsp:include>
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加角色</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<form class="am-form am-form-horizontal doc-vld-msg" method="post" action="/hotel/addGuser">
							<!-- <div class="am-form-group">
								<label for="company-name">公司名称：</label>
								<input type="text" name="company-name" id="company-name" placeholder="输入公司名，可自动补全" />
								
							</div> -->
							<div class="am-form-group">
								<label for="companyname" class="am-u-sm-3 am-form-label">单位名称</label>
								<div class="am-u-sm-9">
									<input type="text"  value="${param.uname}"  required id="company-name" disabled="disabled" placeholder="公司名" />
									<!-- <select name="companyname" id="companyname" required>
										<option value="">请选择单位名称</option>
										<option value="1">company1</option>
										<option value="2">company2</option>
										<option value="3">company3</option>
									</select>
									<span class="am-form-caret"></span> -->
								</div>
								<input id="unit_id" name="guser.unit_id" value="${param.id}" type="hidden">
							</div>
							<div class="am-form-group">
								<label for="hoteltype" class="am-u-sm-3 am-form-label">角色选择</label>
								<div class="am-u-sm-9">
									<select name="guser.grole" id="hoteltype" required>
										<option value="">请选择角色</option>
										<option value="1">校代</option>
										<option value="2">代理</option>
										<option value="3">GEA</option>
									</select>
									<span class="am-form-caret"></span>
								</div>
							</div>
							<div class="am-form-group">
								<label for="zhname" class="am-u-sm-3 am-form-label">中文名</label>
								<div class="am-u-sm-9">
									<input type="text" id="zhname" name="guser.name_zh" required placeholder="中文名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="enname" class="am-u-sm-3 am-form-label">英文名</label>
								<div class="am-u-sm-9">
									<input type="text" id="enname" name="guser.name_en" required placeholder="英文名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="sex" class="am-u-sm-3 am-form-label">性别</label>
								<div class="am-u-sm-9">
									<select name="guser.gender" required>
										<option value="">请选择性别</option>
										<option value="1">男</option>
										<option value="0">女</option>
									</select>
									<span class="am-form-caret"></span>
								</div>
							</div>
							<div class="am-form-group">
								<label for="phone" class="am-u-sm-3 am-form-label">电话号码</label>
								<div class="am-u-sm-9">
									<input type="text" id="phone" required name="guser.phone" placeholder="电话号码">
								</div>
							</div>
							<div class="am-form-group">
								<label for="email" class="am-u-sm-3 am-form-label">邮箱</label>
								<div class="am-u-sm-9">
									<input type="email" id="email" name="guser.email" placeholder="邮箱">
								</div>
							</div>
							
					<!-- 		<div class="am-form-group">
								<label for="agent" class="am-u-sm-3 am-form-label">跟进RR</label>
								<div class="am-u-sm-9">
									<input type="text" id="agent" required name="guser.epid" placeholder="跟进RR">
								</div>
							</div> -->
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-offset-3">
									<button type="submit" class="am-btn am-btn-success">提交</button>
								</div>
							</div>
						</form>
			        </div>
					
				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2018 08 14</p>
			</footer>
		</div>
		<!-- content end -->
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
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="assets/js/addpeople.js"></script>
</html>