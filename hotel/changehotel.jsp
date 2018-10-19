<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>

<%
	System.out.println("-=-=-=-=-=--"+request.getAttribute("guserInfo"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>年会酒店房间安排系统</title>
    <meta charset="utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="keywords" content="index" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /> 
	<meta name="renderer" content="webkit" /> 
	<meta charset="utf-8" /> 
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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">入住人信息</strong></div>
				</div>
				<div class="am-g" id="changehotel">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">中文名</span>
							<div class="am-u-sm-9">
								${guserInfo.name_zh}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">英文名</span>
							<div class="am-u-sm-9">
								${guserInfo.name_en}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">性别</span>
							<div class="am-u-sm-9" id="list_gender">
								${guserInfo.gender}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">公司名</span>
							<div class="am-u-sm-9">
								${guserInfo.cname}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">邮箱</span>
							<div class="am-u-sm-9">
								${guserInfo.email}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">手机号码</span>
							<div class="am-u-sm-9">
								${guserInfo.phone}
							</div>
						</div>
						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">跟进RR</span>
							<div class="am-u-sm-9">
								${guserInfo.name}
							</div>
						</div>

						<div class="liveinfo am-u-sm-12">
							<span class="am-u-sm-3 title">房间类型</span>
							<div class="am-u-sm-9" id="room_type">
								${guserInfo.room_type}
							</div>
						</div>
						<div class="livebtn am-u-sm-12">
							<button type="button" id="resetbtn" class="am-btn am-btn-warning am-btn-xs">重新绑定</button>
							<button type="button" id="untiebtn" class="am-btn am-btn-danger am-btn-xs">解除绑定</button>
						</div>
			        </div>
					
				</div>
				<div class="am-g">
					<div class="am-u-sm-12">
						<div class="am-modal" tabindex="-1" id="infomodal">
						  <div class="am-modal-dialog">
						    <div class="am-modal-hd">新的入住人信息
						      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						    	
						    	<form action="" id="changeEnterInfo">
									<input type="hidden" name="rid" id="rid" value="${guserInfo.rid}">
									<input type="hidden" name="gid" id="gid" value="${guserInfo.gid}">
									
									<div class="am-form-group">
										<label for="inname">入住人姓名：</label>
										<input type="text" name="inname" id="inname" placeholder="输入姓名，可自动补全" />
									</div>

						    	</form>
						      	
						    </div>
						    <div class="am-modal-footer" style="padding-bottom: 20px;">
						    	<span class="js-model-btn am-btn" id="cancelbtn">取消</span>
      							<span class="js-model-btn am-btn" id="subbtn">提交</span>
						    </div>
						  </div>
						</div>
						
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
<!-- 自动补全插件 -->
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="assets/js/changhotel.js"></script>

</html>