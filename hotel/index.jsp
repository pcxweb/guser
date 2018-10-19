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
	<style>
		.dateitem{
			border-bottom: 1px dashed red;
			margin-bottom: 10px;
		}
		#indexbox .dateitem .date_td{
			width: 150px;
			vertical-align: middle;
			background-color: #3399CC;
			color: #fff
		}
	</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="leftmemu.jsp"></jsp:include>
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content" id="indexbox">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong></div>
				</div>
				
				<!-- <div class="am-g">
					<ul class="am-avg-sm-1 am-avg-md-3 am-margin am-padding am-text-center admin-content-list ">
						<li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>单人间<br/>22/100</a></li>
						<li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>双人间<br/>80/200</a></li>
						<li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>加床房<br/>22/200</a></li>
					</ul>
				</div> -->
				
				<div class="am-g am-margin-top-sm">
	              <div class="am-u-sm-8 am-u-md-4 am-u-end">
					<div class="am-form-group">
						<span class="desc">酒店选择： </span>
			            <select name="hid" id="hid" data-am-selected="{btnSize: 'sm'}">
			              
			            </select>
			         </div>
	              </div>
	            </div>


				<div class="am-g" id="date_list">
					<!-- 10-09 -->
					<!-- <div class="am-u-sm-12 dateitem">
						<table class="am-table am-table-bd am-table-striped admin-content-table">
							<thead>
								<tr>
									<th>日期</th>
									<th>类型</th>
									<th>上限</th>
									<th>下限</th>
									<th>已用</th>
									<th>剩余</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="3" align="center" class="date_td">2018-10-09</td>
									<td>单人间</td>
									<td class="most-num">100</td>
									<td class="least-num">80</td>
									<td class="used-num"><span class="am-badge am-round am-badge-warning">22</span></td>
									<td>78</td>
								</tr>
								<tr>
									<td>双人间</td>
									<td class="most-num">200</td>
									<td class="least-num">100</td>
									<td class="used-num"><span class="am-badge am-round am-badge-danger">80</span></td>
									<td>120</td>

								</tr>
								<tr>
									<td>加床房</td>
									<td class="most-num">200</td>
									<td class="least-num">100</td>
									<td class="used-num"><span class="am-badge am-round am-badge-warning">22</span></td>
									<td>178</td>
								</tr>
								
							</tbody>
						</table>
					</div> -->
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
<script type="text/javascript" src="assets/js/index.js"></script>
<script type="text/javascript" src="assets/js/hotelhid.js"></script>
</html>
