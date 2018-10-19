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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加活动座位</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<form class="am-form am-form-horizontal doc-vld-msg addactivityform" action="/act/addTable">
							<div class="am-form-group act_box">
								<label for="doc-ipt-3" class="am-u-sm-3 am-form-label">活动类型</label>
								<div class="am-u-sm-9">
									<select name="act_id" id="act_id" required>
										<option value="">请选择活动类型</option>
									</select>
								</div>
							</div>
							<div class="am-form-group area_box">
								<!-- <label for="doc-ipt-3" class="am-u-sm-3 am-form-label">区域名称</label>
								<div class="am-u-sm-9">
									<select name="area_id" id="area_id" required>
										<option value="">请选择活动类型</option>
										<option value="1">培训</option>
										<option value="2">晚宴</option>
									</select>
								</div> -->
							</div>
							
							<div class="am-form-group homeBox">
								<label for="doc-ipt-pwd-2" class="am-u-sm-3 am-form-label">桌子数量</label>
								<div class="am-u-sm-9">
									<input type="number" name="table_count" id="table_count" required placeholder="桌子数量">
								</div>
							</div>
							<div class="am-form-group homeBox">
								<label for="doc-ipt-pwd-2" class="am-u-sm-3 am-form-label">每桌座位数</label>
								<div class="am-u-sm-9">
									<input type="number" name="seat_count" id="seat_count" required placeholder="每个桌子座位数">
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
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"/act/getActName",
		type:"post",
		dataType:"json",
		success:function(res){
			var actresult =''
			for (var i = 0; i < res.length; i++) {
				actresult += '<option value="'+res[i].act_id+'">'+res[i].act_name+'</option>'
			}
			$("#act_id").append(actresult)
		}
	})

	$("#act_id").change(function(){
		var actId = $(this).val()
		if(actId!=""){
			$.ajax({
				url:"/act/getAreaName",
				type:"post",
				dataType:"json",
				data:{act_id: actId},
				success: function(res){
					var arearesult =''
					for (var i = 0; i < res.length; i++) {
						arearesult+='<option value="'+res[i].area_id+'">' + res[i].area_name + '</option>'
					}

					var str = '<label for="doc-ipt-3" class="am-u-sm-3 am-form-label">区域名称</label><div class="am-u-sm-9"><select name="area_id" id="area_id" required><option value="">请选择活动类型</option>'+arearesult+'</select></div>'

					$(".area_box").html(str)
				}

			})
		}else{
			$(".area_box").html("")
		}
	})
})
</script>
</html>