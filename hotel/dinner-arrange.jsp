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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">晚宴座位安排</strong></div>
				</div>
				<input type="hidden" id="loginuser_id" value="${sessionScope.geauser.id}" >
	            <input type="hidden" id="loginuser_name" value="${sessionScope.geauser.name}" >
				
				<div class="am-g" id="dinner_arrange">
					<div class="am-u-sm-12 hotel_range">
						<div class="am-scrollable-horizontal">
							<table class="am-table am-table-centered am-table-bordered am-table-striped">
								<thead>
									<tr>
										<th style="width: 50px;">台号</th>
										<th>座位</th>
									</tr>
								</thead>
								<tbody> 
									<!-- <tr>
										<td>1</td>
										<td>
											<div class="tdbox">
												<div class="choosebtn">
													<span class="check cbg rr5">
														<span class="empty">空</span>
														<i class="am-icon-check"></i>
													</span>
													<div class="info">
														<span class="rrname">皓皓</span><span><i class="am-icon-mars"></i></span>
													</div>
												</div>
												
												<div class="choosebtn">
													<span class="check">
														<span class="empty">空</span>
														<i class="am-icon-check"></i>
													</span>
													<div class="info">
														<span class="rrname"></span><span><i class=""></i></span>
													</div>
												</div>
											</div>
										</td>
										<td>
											
										</td>
										<td>

										</td>

									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="am-g">
					<!-- 入住信息模态框 -->
					<div class="am-u-sm-12">
						<div class="am-modal" tabindex="-1" id="infomodal">
						  <div class="am-modal-dialog">
						    <div class="am-modal-hd">人员安排
						      <a href="javascript: void(0)" id="iconclose" class="am-close am-close-spin">&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						 
						    	<form id="seatInfo" data-am-validator class="">
									<input type="hidden" name="gid" id="gid">
									<input type="hidden" name="sid" id="sid">
									<div class="am-form-group">
										<label for="inname">姓名：</label>
										<input type="text"  id="inname" placeholder="输入姓名，可自动补全" />
									</div>
						    	</form>
						      	
						    </div>
						    <div class="am-modal-footer">
						    	<span class="js-model-btn am-btn" id="ruzhucancelbtn">取消</span>
      							<span class="js-model-btn am-btn" id="ruzhusubbtn">提交</span>
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
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="assets/js/dinner-arrange.js"></script>

</html>