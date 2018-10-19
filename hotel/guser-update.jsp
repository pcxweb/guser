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
						<form class="am-form am-form-horizontal doc-vld-msg" method="post" action="/hotel/updateGuser">
							<input type="hidden" name="guser.gid" value="${guser.gid}">
							<input type="hidden" id="groleval"  value="${guser.grole}">
							<input type="hidden" id="genderval"  value="${guser.gender}">
							<div class="am-form-group">
								<label for="hoteltype" class="am-u-sm-3 am-form-label">角色选择</label>
								<div class="am-u-sm-9">
									<select name="guser.grole"  id="groleselect" required>
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
									<input type="text" id="zhname" value="${guser.nameZh}" name="guser.name_zh" required placeholder="中文名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="enname" class="am-u-sm-3 am-form-label">英文名</label>
								<div class="am-u-sm-9">
									<input type="text" id="enname" value="${guser.nameEn}" name="guser.name_en" required placeholder="英文名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="sex" class="am-u-sm-3 am-form-label">性别</label>
								<div class="am-u-sm-9">
									<select name="guser.gender" required id="genderselect">
										<option value="">请选择性别</option>
										<option value="0">女</option>
										<option value="1">男</option>
									</select>
									<span class="am-form-caret"></span>
								</div>
							</div>
							<div class="am-form-group">
								<label for="phone" class="am-u-sm-3 am-form-label">电话号码</label>
								<div class="am-u-sm-9">
									<input type="text" id="phone" required value="${guser.phone}" name="guser.phone" placeholder="电话号码">
								</div>
							</div>
							<div class="am-form-group">
								<label for="email" class="am-u-sm-3 am-form-label">邮箱</label>
								<div class="am-u-sm-9">
									<input type="email" id="email" value="${guser.email}" name="guser.email" placeholder="邮箱">
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-offset-3">
									<button type="submit" class="am-btn am-btn-success">修改并提交</button>
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
<script type="text/javascript">
$(function(){
	var groleval = $("#groleval").val()
        genderval = $("#genderval").val()
    genderval =  Number(genderval)+1;
    $("#groleselect option").eq(groleval).attr("selected",true)
    $("#genderselect option").eq(genderval).attr("selected",true)


})
</script>
</html>