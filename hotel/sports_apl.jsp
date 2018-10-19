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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">绑定球类</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<form class="am-form am-form-horizontal doc-vld-msg" method="post" action="/act/addSports">
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" for="inname">姓名：</label>
								<div class="am-u-sm-9">
									<input type="text"  id="inname" placeholder="输入姓名，可自动补全" />
								</div>
							</div>
							<input type="hidden" name="gid" id="gid">
							<div class="am-form-group">
								<label for="sex" class="am-u-sm-3 am-form-label">球类选择</label>
								<div class="am-u-sm-9">
									<select name="act_type" id="act_type" required>
									</select>
									<span class="am-form-caret"></span>
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

	// 球类渲染
	$.ajax({
		url:"/act/getBallType",
		type:"get",
		dataType:"json",
		success: function(res){
			var optionstr = ''
			for (var i = 0; i < res.length; i++) {
				optionstr+='<option value="'+res[i].key+'">'+res[i].value+'</option>'
			}
			$("#act_type").html(optionstr)
		}
	})

})
</script>
</html>