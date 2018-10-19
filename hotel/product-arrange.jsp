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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品培训地点安排</strong></div>
					
				</div>
				<div class="am-g">
					<p class="am-u-sm-12 am-u-md-6"><button type="button" id="bindproduct" class="am-btn am-btn-danger">人员绑定</button></p>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-3">
					  <span>地点选择：</span>
			          <div class="am-form-group">
			            <select id="act_type" style="width: 100%;padding:.3rem 0.5rem" class="rolechoose">
			              <option value="">全部</option>
			              <!-- <option value="5">二楼国瑞厅</option>
						  <option value="6">VIP行政会议厅</option> -->
			            </select>
			          </div>
			        </div>
			       	<div class="am-u-sm-12 am-u-md-4">
						<span class="desc">关键词搜索，根据姓名</span>
						<div class="am-input-group am-input-group-sm">
						  <input type="text" id="searchkey"  class="am-form-field searchval" placeholder="中英文名">
						  <span class="am-input-group-label searchbtn"><i class="am-icon-search am-icon-fw"></i></span>
						</div>
					</div>
					<div class="am-u-sm-12" id="peoplelist">
						<div class="am-scrollable-horizontal">
							<table class="am-table am-table-bd am-table-striped admin-content-table" id="product_table">
								<thead>
									<tr>
										<th>序号</th>
										<th>中文名</th>
										<th>英文名</th>
										<th>性别</th>
										<th>角色</th>
										<th>地点</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td>5</td>
										<td>随便</td>
										<td>suibian</td>
										<td>女</td>
										<td>GEA</td>
										<td>羽毛球</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs"><button type="button" data-gid="31" class="am-btn btnchange am-btn-primary am-radius"><span class="am-icon-pencil-square-o"></span> 修改</button></div>
												<div class="am-btn-group am-btn-group-xs"><button data-gid="31" type="button" class="am-btn btn-delete am-btn-danger am-radius"><span class="am-icon-trash-o"></span> 删除</button></div>
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
						</div>
						<!-- 分页 -->
						<div id="page2"></div>
						<div id="tips"></div>
					</div>

					<!-- 产品地点绑定模态框 -->

					<div class="am-u-sm-12">
						<div class="am-modal" tabindex="-1" id="productModal">
						  <div class="am-modal-dialog">
						    <div class="am-modal-hd">绑定房间号
						      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
						    </div>
						    <div class="am-modal-bd am-u-sm-12">
						    	
						    	<form class="am-form am-form-horizontal doc-vld-msg" id="productform">
									<div class="am-form-group">
										<label class="am-u-sm-3 am-form-label" for="inname">姓名：</label>
										<div class="am-u-sm-9">
											<input type="text" id="inname" placeholder="输入姓名，可自动补全" />
										</div>
									</div>
									<input type="hidden" name="gid" id="gid">
									<div class="am-form-group">
										<label for="sex" class="am-u-sm-3 am-form-label">地点选择</label>
										<div class="am-u-sm-9">
											<select name="act_id" id="change_place" required>
												<!-- <option value="5">二楼国瑞厅</option>
						                        <option value="6">VIP行政会议厅</option> -->
											</select>
											<span class="am-form-caret"></span>
										</div>
									</div>
								</form>
						      	
						    </div>
						    <div class="am-modal-footer">
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
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>

<script type="text/javascript">
$(function(){
	var gnamearr = []
	$.ajax({
		url:"/act/getAllGuser",
		type:"post",
		dataType:"json",
		async: false,
		success:function(res){
			gnamearr = res
		}
	})
	
	$('#inname').autocomplete({
		lookup: gnamearr,
		showNoSuggestionNotice:true,
		noSuggestionNotice:'该客人不存在，请重新输入',
		onSelect: function (suggestion) {
			//所选的数据
			$("#gid").val(suggestion.gid)
		    
		}
	});
	// 启动人员绑定模态框
	$("#bindproduct").click(function(){
		$("#inname").val("")
		$("#productModal").modal('open')
	})
	// 关闭人员绑定模态框
	$("#cancelbtn").click(function(){
		$("#productModal").modal('close')
	})
	// 提交
	$("#subbtn").click(function(){
		var thisval = $("#inname").val();
		var hasval =  false;
		$.each( gnamearr, function( index, datas ) {
			
			if(datas.gname == thisval){
				hasval =  true;
				return false;
			}
		});
		if(!hasval){
			alert("你填写的姓名不存在，请重新选择或者到人员管理绑定该客人")
			$("#inname").focus()
			return false;
		}
		var formdata = $("#productform").serialize()

		$.ajax({
			url:"/act/saveProdTrain",
			type:"post",
			dataType:"json",
			data:formdata,
			success:function(res){
				if(res.status=="isok"){
					alert("提交成功")
				}
				location.reload()
			}
		})
	})

	
})
</script>
<script type="text/javascript" src="assets/js/amazeui.page.js"></script>
<script type="text/javascript" src="assets/js/product_list.js"></script>
</html>