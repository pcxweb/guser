$(function(){
	// 列表渲染修改
	var gender = $("#list_gender").text()
	if(gender==0){
		$("#list_gender").text("女")
	}else {
		$("#list_gender").text("男")
	}
	var roomtype = $("#room_type").text()
	if(roomtype==1){
		$("#room_type").text("单人间")
	}else if(roomtype==2){
		$("#room_type").text("双人间")
	}else if(roomtype==3){
		$("#room_type").text("加床房")
	}

	// 入住人姓名列表
	var gnamearr = []
	$.ajax({
		url:"/hotel/getGuserByEpid",
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
	
	//酒店安排选择事件

	$('#resetbtn').on('click', function() {
		$('#infomodal').modal();
	});

	//重新绑定提交
	$("#subbtn").click(function(){
		
		// console.log(formdatas);
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

		var formdatas = $("#changeEnterInfo").serialize();
		
		resetfun(formdatas)
		$("#infomodal").modal("close");

	})


	//重新绑定取消
	$("#cancelbtn").click(function(){
		$("#infomodal").modal("close");
	}) 

	// 解除绑定
	$("#untiebtn").click(function(){
		var issure = confirm("确定要解除绑定？")
		if(issure){
			var rid = $("#rid").val()
			var obj = {"rid": rid}
			resetfun(obj)
		}
	})

})

function resetfun(formdata){
	$.ajax({
		url:"/hotel/changeRoom",
		data:formdata,
		type:"post",
		dataType:"json",
		success:function(res){
			console.log(res)
			window.location.href = "/hotel/hotel-arrange.jsp"
		}
	})
}