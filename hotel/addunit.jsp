<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<title>年会酒店房间安排系统</title> 
	<meta name="keywords" content="index" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /> 
	<meta name="renderer" content="webkit" /> 
	<meta http-equiv="Cache-Control" content="no-siteapp" /> 
	<link rel="icon" href="gea.ico" type="image/x-icon">
	
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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">单位管理</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-10">
						<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
							<ul class="am-tabs-nav am-cf">
								<li class="am-active"><a href="[data-tab-panel-0]">单位列表</a></li>
								<li class=""><a href="[data-tab-panel-1]">添加单位</a></li>
							</ul>
							<div class="am-tabs-bd unit-tab">
								<div data-tab-panel-0 class="am-tab-panel am-active">
									<div class="am-u-sm-12 am-u-md-4" style="margin-bottom: 10px;">
										<span class="desc">单位搜索</span>
										<div class="am-input-group am-input-group-sm">
										  <input type="text" id="searchkey"  class="am-form-field searchval" placeholder="单位名称">
										  <span class="am-input-group-label searchbtn"><i class="am-icon-search am-icon-fw"></i></span>
										</div>
									</div>
									<table class="am-table am-table-striped am-table-hover" id="unittable">
										<thead>
											<tr>
												<th>ID</th>
												<th>名称</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>

                                        	<c:out  ></c:out>
										 	<!-- <tr>
												<td>1</td>
												<td>深圳英锐教育</td>
												<td>
													
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btnchange am-btn-primary am-radius">
																<span class="am-icon-pencil-square-o"></span> 修改
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btn-delete am-btn-danger am-radius">
																<span class="am-icon-trash-o"></span> 删除
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<a href="addpeople.jsp" class="am-btn bindpeople am-btn-warning am-radius">
																<span class="am-icon-user"></span> 绑定人员
															</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>深圳英锐教育</td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btnchange am-btn-primary am-radius">
																<span class="am-icon-pencil-square-o"></span> 修改
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btn-delete am-btn-danger am-radius">
																<span class="am-icon-trash-o"></span> 删除
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<a href="addpeople.jsp" class="am-btn bindpeople am-btn-warning am-radius">
																<span class="am-icon-user"></span> 绑定人员
															</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>深圳英锐教育</td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btnchange am-btn-primary am-radius">
																<span class="am-icon-pencil-square-o"></span> 修改
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<button type="button" class="am-btn btn-delete am-btn-danger am-radius">
																<span class="am-icon-trash-o"></span> 删除
															</button>
														</div>
														<div class="am-btn-group am-btn-group-xs">
															<a href="addpeople.jsp" class="am-btn bindpeople am-btn-warning am-radius">
																<span class="am-icon-user"></span> 绑定人员
															</a>
														</div>
													</div>
												</td>
											</tr> -->
										</tbody>

									</table>

									<div id="page2"></div>
									<div id="tips"></div>

								</div>
								<div data-tab-panel-1 class="am-tab-panel">
									<form class="am-form am-form-horizontal unitform" style="max-width: 500px;margin:0 auto" action="/hotel/saveUnits">
										<div class="am-form-group unitbox">
											<label for="companyname" class="am-u-sm-3 am-form-label">单位名称</label>
											<div class="am-u-sm-9">
												<div class="am-input-group am-input-group-secondary">
													<input type="text" name="cname"  class="am-form-field" placeholder="请填写单位名称">
													<span class="am-input-group-label plusbtn"><i class="am-icon-plus am-icon-fw"></i></span>
												</div>
											</div>
										</div>
										
										<div class="am-form-group am-input-group-sm">
											<div class="am-u-sm-9 am-u-sm-offset-3">
												<button type="submit" class="am-btn am-btn-sm am-btn-success">提交</button>
											</div>
										</div>
									</form>
								</div>
								

							</div>
					  	</div>

						
			        </div>
					
				</div>

				<div class="am-g">
					<div class="am-u-sm-12">
						<div class="am-modal" tabindex="-1" id="changunitModal">
						  <div class="am-modal-dialog">
						    <div class="am-modal-hd">单位名称修改
						      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						    	
						    	<form action="/hotel/updateUnit" id="changeunitform" class="am-form am-form-horizontal">
									<div class="am-form-group">
										<label for="zhname" class="am-u-sm-3 am-form-label">单位名称：</label>
										<div class="am-u-sm-9">
											<input type="text" id="zhname" name="zhname" placeholder="单位名称">
										    <input type="hidden" id="unitid" name='unitid'>
										</div>
									</div>
						    	</form>
						      	
						    </div>
						    <div class="am-modal-footer">
						    	<span class="js-model-btn am-btn" id="changeUnitcan">取消</span>
      							<span class="js-model-btn am-btn" id="changeUnitsub" onclick="updateUnit();">提交</span>
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
<script type="text/javascript" src="assets/js/amazeui.page.js"></script>
<script type="text/javascript" src="assets/js/addunit.js"></script>

</html>