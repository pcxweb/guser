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
	<style>
		#roomform .list_num{
			display: flex;
			align-items: center;
			justify-content: center;
		}
		#roomform .list_num .list{
			display: flex;
			align-items: center;
			flex-wrap: wrap;
		}
		#roomform .list_num p{
			margin:0;
			margin-left:5px;
			display: flex;
			align-items: center;

		}
		#roomform .list_num p input,#roomform .list_num p label{
			vertical-align: middle;
			margin-top: 0px;
		}
		#roomform .list_num p label{
			margin:5px;
			margin-right: 10px;
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
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">房间安排</strong></div>
				</div>
				<input type="hidden" id="loginuser_id" value="${sessionScope.geauser.id}" >
	            <input type="hidden" id="loginuser_name" value="${sessionScope.geauser.name}" >
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-12">
						
						<div class="am-btn-toolbar btnbox">
							<span style="float: left;">RR代表颜色：</span>
							<div class="am-btn-group am-btn-group-xs" id="rr-item">
								<!-- <button type="button" class="am-btn am-btn-primary"> Alina</button>
								<button type="button" class="am-btn am-btn-secondary"> Nina</button>
								<button type="button" class="am-btn am-btn-success"> Alice</button>
								<button type="button" class="am-btn am-btn-danger"> Joanna</button>
								<button type="button" class="am-btn am-btn-warning"> James</button> -->
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 filterbox" style="margin-top: 20px;">
						<div class="am-u-sm-12 am-u-md-3">
							<span class="desc">酒店</span>
							<div class="am-form-group">
					            <select name="hid" id="hid" data-am-selected="{btnSize: 'sm'}">
					              
					            </select>
					         </div>
						</div>
						<div class="am-u-sm-12 am-u-md-3">
							<span class="desc">房间状态</span>
							<div class="am-form-group">
					            <select name="ischoose" id="ischoose" data-am-selected="{btnSize: 'sm'}">
					              <option value="all">全部</option>
					              <option value="tchoose">已选</option>
					              <option value="fchoose">未选</option>
					            </select>
					         </div>
						</div>
						<div class="am-u-sm-12 am-u-md-3">
							<span class="desc">房间类型（默认单人间）</span>
							<div class="am-form-group">
					            <select name="hometype" id="hometype" data-am-selected="{btnSize: 'sm'}">
					              <option value="1">单人间</option>
					              <option value="2">双人间</option>
					              <option value="3">加床房</option>
					            </select>
					         </div>
						</div>
						<!-- 搜索框 -->
						<div class="am-u-sm-12 am-u-md-3">
							<span class="desc">关键词搜索，可根据角色名搜索</span>
							<div class="am-input-group am-input-group-sm">
							  <input type="text" id="searchval" name="searchval"  class="am-form-field searchval" placeholder="name">
							  <span class="am-input-group-label searchbtn"><i class="am-icon-search am-icon-fw"></i></span>
							</div>
						</div>

					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 hotel_range">
						<p class="resultTotal">搜索结果共计 <span class="red">0</span> 条</p>
						<div class="small-total">
							<div class="stitle">RR已用床位统计：</div>
							<!-- <div class="sitem"><span>Ben:</span> <strong class="total-rr1">1</strong> 间</div>
							<div class="sitem"><span>Alina:</span> <strong class="total-rr2">2</strong> 间</div> -->
						</div>
						<div class="am-scrollable-horizontal">
							<table class="am-table am-table-bordered am-table-striped">
								<thead>
									<tr>
										<th>房间号\日期</th>
										<th>10.08</th>
										<th>10.09</th>
										<th>10.10</th>
										<th>10.11</th>
										<th>10.12</th>
										<th>10.13</th>
									</tr>
								</thead>
								<tbody> 
									
									<!-- <tr>
										<td>
											<sapn>房间001</span>
											<div>
												<button class="am-btn am-btn-xs am-btn-warning bindroom">绑定房间号</button>
												<select class="room-num" name="room-num"  placeholder="选择房间号" data-am-selected="{btnSize: 'sm'}">
									              <option value=""></option>
									              <option value="1">001</option>
									              <option value="2">002</option>
									              <option value="3">003</option>
									            </select>
											</div>
										</td>
										<td>
											<div class="choosebtn">
												<span class="check cbg rr1"><i class="am-icon-check"></i></span>
												<div class="info">
													<span>RR:Alian</span>
													<span><i class="am-icon-venus"></i> GEA</span>
												</div>
											</div>
											<div class="choosebtn">
												<span class="check cbg rr4"><i class="am-icon-check"></i></span>
												<span>RR:Nina</span>
												<span><i class="am-icon-venus"></i> 校代</span>
											</div>
										</td>
										<td>
											<div class="choosebtn">
												<span class="check cbg rr1"><i class="am-icon-check"></i></span>
												<span>RR:Alian</span>
												<span><i class="am-icon-venus"></i> GEA</span>
											</div>
											<div class="choosebtn">
												<span class="check cbg rr4"><i class="am-icon-check"></i></span>
												<span>RR:Nina</span>
												<span><i class="am-icon-venus"></i> 校代</span>
											</div>
										</td>
										<td>
											<div class="choosebtn">
												<span class="check cbg rr1"><i class="am-icon-check"></i></span>
												<span>RR:Alian</span>
												<span><i class="am-icon-mars"></i> 校代</span>
											</div>
											<div class="choosebtn">
												<span class="check cbg rr4"><i class="am-icon-check"></i></span>
												<span>RR:Nina</span>
												<span><i class="am-icon-mars"></i> 校代</span>
											</div>
										</td>
										<td>
											<div class="choosebtn">
												<span class="check cbg rr1"><i class="am-icon-check"></i></span>
												<span>RR:Alian</span>
												<span><i class="am-icon-mars"></i> 校代</span>
											</div>
											<div class="choosebtn">
												<span class="check cbg rr4"><i class="am-icon-check"></i></span>
												<span>RR:Nina</span>
												<span><i class="am-icon-mars"></i> 校代</span>
											</div>
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
						    <div class="am-modal-hd">填写入住人信息
						      <a href="javascript: void(0)" id="iconclose" class="am-close am-close-spin">&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						    	<p style="color: red">*(你已经锁定了此房间，请尽量在1分钟内完成提交。关闭窗口即可释放)</p>
						    	<p>倒计时：<span style="color: red" id="count-time">60</span>秒</p>

						    	<form id="enterInfo" data-am-validator class="">
									<input type="hidden" name="rid" id="rid">  
									<input type="hidden" name="groupid" id="groupid2">  
									<input type="hidden" name="gid" id="gid">  <!-- 入住名id -->
									<input type="hidden" name="act_date" id="act_date"> <!-- 时间 -->
									
									<div class="am-form-group">
										<label for="inname">入住人姓名：</label>
										<input type="text" name="inname" id="inname" placeholder="输入姓名，可自动补全" />
									</div>
									 <div class="am-form-group">
										<div class="list">
											<input type="checkbox" name="all_date"><span>是否住满之后几数</span>
										</div>
							        </div>
									<div class="am-form-group" id="remarkbox" style="display: none">
								      <label style="width: 80px;text-align: right;" for="remark">备注：</label>
								      <select name="usbid" id="remark" placeholder="无" data-am-selected="{btnSize: 'sm'}">
											<option value="1">无</option>
											<option value="0">单独要一间</option>
										</select>
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

					<!-- 绑定房间模态框 -->

					<div class="am-u-sm-12">
						<div class="am-modal" tabindex="-1" id="roomModal">
						  <div class="am-modal-dialog">
						    <div class="am-modal-hd">绑定房间号
						      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						    	
						    	<form id="roomform" data-am-validator class="">
									<input type="hidden" name="groupid" id="groupid">
									<div class="am-form-group" id="roomshow">
										<label for="room-num">房间号：</label>
										<input type="text" id="room-num" name="rname" placeholder="房间号">
							        </div>
							       
							        <div class="am-form-group list_num">
										<label>是否到场：</label>
										<div class="list">
											
										</div>
										
							        </div>
						    	</form>
						    </div>
						    <div class="am-modal-footer">
						    	<span class="js-model-btn am-btn" id="cancelbtnroom">取消</span>
      							<span class="js-model-btn am-btn" id="subbtnroom">提交</span>
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
<script type="text/javascript" src="assets/js/hotelhid.js"></script>
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="assets/js/hotellist.js"></script>
</html>