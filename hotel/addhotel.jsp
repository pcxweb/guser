<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<title>年会酒店房间安排系统</title> 
	<link rel="icon" href="gea.ico" type="image/x-icon">
	<meta name="keywords" content="index" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /> 
	<meta name="renderer" content="webkit" /> 
	<meta http-equiv="Cache-Control" content="no-siteapp" /> 
	
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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加新房间</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<form class="am-form am-form-horizontal doc-vld-msg addhotelform" action="/hotel/addhotel">
							<div class="am-form-group">
								<label for="doc-ipt-3" class="am-u-sm-3 am-form-label">酒店名称</label>
								<div class="am-u-sm-9">
									<select name="hid" id="hid" required>
										<option value="">请选择酒店</option>
										
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="doc-ipt-3" class="am-u-sm-3 am-form-label">房间类型</label>
								<div class="am-u-sm-9">
									<select name="hoteltype" id="" required>
										<option value="">请选择房间类型</option>
										<option value="1">单人间</option>
										<option value="2">双人间</option>
										<option value="3">加床房</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="doc-ipt-3" class="am-u-sm-3 am-form-label">日期</label>
								<div class="am-u-sm-9">
									<div class="am-form-group am-form-icon">
									    <i class="am-icon-calendar" style="transform: translateY(-50%);margin-top: 1px"></i>
									    <input id="date" name="date" required type="date" class="am-form-field" required placeholder="日期">
									</div>
								</div>
							</div>
							<div class="am-form-group homeBox">
								<label for="doc-ipt-pwd-2" class="am-u-sm-3 am-form-label">房间上限数</label>
								<div class="am-u-sm-9">
									<input type="number" name="doc1" id="doc1" required placeholder="房间上限数">
								</div>
							</div>
							<div class="am-form-group homeBox">
								<label for="doc-ipt-pwd-2" class="am-u-sm-3 am-form-label">房间下限数</label>
								<div class="am-u-sm-9">
									<input type="number" name="doc2" id="doc2" required placeholder="房间下限数">
								</div>
							</div>

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
<script type="text/javascript" src="assets/js/hotelhid.js"></script>
</html>