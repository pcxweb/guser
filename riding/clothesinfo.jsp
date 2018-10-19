<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/public/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width initial-scale=1.0">
	<title>2018 环太湖公益骑行</title>
	<!-- 标题图标 -->
    <!-- <link rel="icon" href="gea.ico" type="image/x-icon"> -->
    <link rel="icon" type="image/x-icon" href="/guser/favicon.ico" />
	<link rel="stylesheet" href="/guser/css/reset1.css">
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class="riding" id="signpage">
    <div class="top-img"><img src="img/topbg2.png" alt=""></div>
    <div class="content">
    	<p translate="string_clothesinfo-title">请填写详细收货地址</p>
    	<form action="/giving/saveCycOrder" id="info-form" method="post">

			<input hidden="hidden" name="cycOrder.ord_info"  id="sizenum">
			<input hidden="hidden" name="cycOrder.ord_total" value='${param.total}'>


			<div class="fitem">
				<p><label for="address"><span>*</span><strong translate="string_clothesinfo-input1">收货地址</strong></label></p>
				<input type="text" id="address" name="cycOrder.ord_addr" placeholder="">
			</div>
			<div class="fitem">
				<p><label for="name"><span>*</span><strong translate="string_clothesinfo-input2">您的姓名</strong></label></p>
				<input type="text" id="name" name="cycOrder.ord_name" placeholder="">
			</div>
			<div class="fitem">
				<p><label for="phone"><span>*</span><strong translate="string_clothesinfo-input3">联系电话</strong></label></p>
				<input type="number" id="phone" name="cycOrder.ord_phone" placeholder="">
			</div>
    	</form>
    	 <div class="item" style="margin-top: 0.3rem">
			<p><span translate="string_clothesinfo-total">总计：</span> <strong class="strong" id="totalnum">0</strong></p>
			<p style="font-size: 0.28rem" translate="string_clothesinfo-warn">请注意：Giving五周年纪念衫将于公益骑行后即11月初寄出</p>
	    </div>
    	<div class="item">
			<a id="nextbtn" href="javascript:;" translate="string_same_btn3">下一步</a>
	    </div>
    </div>
    
</div>
<div class="zhan" style="height: 0.8rem"></div>
<div id="languageBox">
	<ul>
		<li class="language_s zhfamily" data-lan="zh_CN">中文版</li>
		<li class="language_s enfamily" data-lan="en_US">English Version</li>
	</ul>
</div>
</body>
<script type="text/javascript" src="/guser/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="/guser/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="js/translate.js"></script>
<script type="text/javascript">
$(function(){
	var typearr = getUrlArgObject();
	var sizenumstr = getCookie("sizenum");
	console.log(sizenumstr)
	$("#sizenum").val(sizenumstr)
	if(typearr.total){
		var totalnums = typearr.total;
		var fixed2 = Number(totalnums).toFixed(2)
		$("#totalnum").text("¥ "+ fixed2)
		
		$("#nextbtn").click(function(){
			// 收货地址
			var address = $("#address").val()
			if(!address){
				// alert("收货地址不能为空！")
				$("#address").focus()
				return false;
			}
			// 姓名
			var name = $("#name").val()
			if(!name){
				// alert("姓名不能为空！")
				$("#name").focus()
				return false;
			}
			// 电话
			var phone = $("#phone").val()
			if(!phone){
				// alert("联系电话不能为空！")
				$("#phone").focus()
				return false;
			}
			 var formdata = $("#info-form").serialize();
			$.ajax({
				url:"/giving/saveCycOrder",
			 	type:"post",
			 	data:formdata,
			 	success:function(res){
					alert("successs");
					window.location.href="clothes_money.html?total="+fixed2+"&type=1"
			 	}
			})

			
		})
	}
})
</script>

</html>