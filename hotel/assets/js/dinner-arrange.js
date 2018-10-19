$(function(){

	// 名字自动补全
	/* var gnamearr = [
		{"gname": "明明", "gid": 26},
		{"gname": "丽丽", "gid": 23},
		{"gname": "好好", "gid": 24},
		{"gname": "豪豪", "gid": 21}
	] */
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
	
	//thead渲染
	$.ajax({
		url:"/act/getAreaName",
		type:"post",
		dataType:"json",
		data:{act_id: 4},
		success: function(res){
			var theadth = ""
			for (var i = 0; i < res.length; i++) {
				theadth+='<th>'+res[i].area_name+'</th>'
			}
			$("#dinner_arrange thead tr").html('<th style="width:60px">台号</th>'+theadth)
		}

	})
	
	//培训座位渲染
	gettableList()

	$('#dinner_arrange').on('click','.choosebtn',function() {
		var sidval = $(this).attr("data-sid")
		$("#sid").val(sidval)
		var isrr = $(this).find('.check').hasClass('rr3');
		if(isrr){
			var isdels = confirm("已经安排人员，是否要移除重新调整？")
			if(isdels){
				$.ajax({
					url:"/act/removeSeates",
					type:"get",
					dataType:'json',
					data:{sid: sidval},
					success:function(res){
						if(res.status=="isok"){
							alert("已移除！")
							gettableList()
						}
						

					}

				})
			}
		}else{
			$("#infomodal").modal('open')
		}
	})

	// 人员座位安排模态框
	$("#ruzhucancelbtn").click(function(){
		$("#infomodal").modal('close')
	});
	// 图标关闭-人员座位安排模态框
	$("#iconclose").click(function(){
		$("#infomodal").modal("close");
		
	})
	// 提交
	$("#ruzhusubbtn").click(function(){
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

		var formdatas = $("#seatInfo").serialize();

		$.ajax({
			url:"/act/arrangeSeats",
			type:"get",
			data:formdatas,
			dataType: "json",
			success:function(resdata){
				console.log(resdata)
				$("#infomodal").modal('close')
				$("#inname").val("")
				gettableList()
			}
		})
		
	})



})


function gettableList() {
	$.ajax({
		url:"/act/actResultList?act_id=4",
		type:"post",
		dataType:"json",
		success:function(res){
			console.log(res)
			var results = ''
			var lastlen = 0
			for (var i = 0; i < res.length; i++) {
				if(res[i].length>lastlen){
					lastlen = res[i].length
				}
			}
			// console.log("最大长度："+lastlen)
			for (var j = 0; j < lastlen; j++) {
				var tdsrts = ''
				for (var i = 0; i < res.length; i++) {
					var choosebtnstrs = ''
					if(res[i][j]){
						var roomdata = res[i][j]
						for (var k = 0; k < roomdata.length; k++) {
							var name = ''
							var cbgs = ''
							var rrclass =''
							if (roomdata[k].gid != null) {
								cbgs = 'cbg'
								rrclass = ' rr3'
								if(roomdata[k].name_zh){
									name = roomdata[k].name_zh
								}else if(roomdata[k].name_en && !roomdata[k].name_zh){
									name = roomdata[k].name_en
								}
							}
							choosebtnstrs += '<div class="choosebtn" data-sid="'+roomdata[k].sid+'"><span class="check '+cbgs+rrclass+'"><span class="empty">空'+(k+1)+'</span>'
								+ '<i class="am-icon-check"></i>'
								+ '</span><div class="info"><span class="rrname">'+name+'</span>'
								+ '</div></div>'
						}
					}
					
					tdsrts += '<td class="'+i+"-"+j+'"><div class="tdbox">'+choosebtnstrs+'</div></td>'
				}
				results+= '<tr><td>'+(j+1)+'</td>'+tdsrts+'</tr>'
			}
			
			$("#dinner_arrange tbody").html(results)

		}
	})

}