var timer = ''
var timenum = 60
window.clearInterval(timer);

$(function(){

	// RR代表列表渲染
	$.ajax({
		url:"/hotel/getGeauserList",
		type:"post",
		dataType:"json",
		success:function(res){
			// console.log(res)
			var rrstr = "";
			var totalrrstr = "";
			for (var i = 0; i < res.length; i++) {
				rrstr+= '<button type="button" class="am-btn am-btn-rr'+(i+1)+'">'+res[i].name+'</button>';
				totalrrstr += '<div class="sitem"><span>'+res[i].name+':</span> <strong class="total-rr'+(i+1)+'">0</strong> 个</div>'
			}
			$("#rr-item").html(rrstr);
			$(".small-total .stitle").after(totalrrstr);
		}
	})


	gethotel(1,1); //房间列表加载
	/* 房间类型选择 */
	$("#hometype").change(function(){
		var chooseVal = $(this).val();
		var hidval = $("#hid").val();
		if(chooseVal==1){
			$("#remarkbox").css("display","none")
		}else{
			$("#remarkbox").css("display","block")
		}
		gethotel(chooseVal,hidval);
	})

	// 酒店选择
	$("#hid").change(function(){
		var chooseVals = $("#hometype").val();
		var hidvals = $(this).val();
		
		gethotel(chooseVals,hidvals);
	})

	//房间状态选择
	$("#ischoose").change(function(){
		var chooseVal = $(this).val()
		var alllen = $(".check").parents('.choosebtn').length;
		var cbglen = $(".cbg").parents('.choosebtn').length;
		$(".resultTotal").css("display","block");
		/* 方案二 */
		if(chooseVal=="tchoose"){ //已选
			$(".check").parents('.choosebtn').removeClass("active");
			$(".cbg").parents('.choosebtn').addClass("active");
			$(".resultTotal").html('已选 <span class="red">'+cbglen+'</span> 个'); //总共条数
		}else if(chooseVal=="fchoose"){ //未选
			$(".check").parents('.choosebtn').addClass("active");
			$(".cbg").parents('.choosebtn').removeClass("active");
			$(".resultTotal").html('还有 <span class="red">'+(alllen-cbglen)+'</span> 个未选');
		}else{
			$(".check").parents('.choosebtn').removeClass("active");
			$(".resultTotal").html('总共有 <span class="red">'+alllen+'</span> 个');
		}
	})

	// 登录人id
	var loginuser_id = $("#loginuser_id").val()
	//酒店安排选择事件
	
	
	$('.hotel_range').on('click','.choosebtn',function() {
		//判断是否已经绑定
		var iscbg = $(this).find('.check').hasClass('cbg'); 
		// 双人房是否都被占用
		var isclick = $(this).attr('data-isclick') //0的时候不可以点出来
		if(isclick==0){
			alert("抱歉，该房间已有客人需要单独一个房间，请选择其他房间入住！")
			event.preventDefault()
			return false
		}

		// 床ID绑定
		var ridval = $(this).attr("data-rid")
		$("#rid").val(ridval)
		// 时间绑定
		var nowdate = $(this).parents('td').attr('class').split("_")[1]
		$("#act_date").val(nowdate)

		// RR id 
		var epids = $(this).attr("data-epid")
		// 房id  -- groupid
		var groupidval = $(this).parents('tr').find('.bindroom').attr('data-groupid')
		$("#groupid2").val(groupidval)

		if(!iscbg){
			// 锁定房间
			var ridval = $("#rid").val()
			localStorage.srid = ridval 
			$.ajax({
				url:"/hotel/lockRoom",
				type:"post",
				dataType:"json",
				data:{rid: ridval},
				success:function(res){
					// console.log(res)
					// 房间可以使用
					if(res.status=="isok"){
						$('#infomodal').modal();
					}
					//房间被占用
					if(res.result){
						var errobj = JSON.parse(res.result)
						// console.log(errobj)
						alert(errobj.msg)

					}
				}
			})

			//清空之前填写的内容
			// $("#inname").val("")
			// $('select').find('option').eq(1).attr('selected', true)
			$('#enterInfo')[0].reset()

			//安排入住倒计时
			timenum = 60
			$("#count-time").text(timenum)
			timer = setInterval(function(){
				timenum = timenum-1
				$("#count-time").text(timenum)
				if(timenum==0){
					window.clearInterval(timer);
				}
			},1000)
		}else{
			if (loginuser_id==epids) {
				var change = confirm("已有人入住,是否要查看或重新绑定？");
				if(change){
					window.location.href = "/hotel/guserInRoom?rid="+ridval 
				}
			}else if(loginuser_id==1){
				var change = confirm("已有人入住,是否要查看或重新绑定？");
				if(change){
					window.location.href = "/hotel/guserInRoom?rid="+ridval 
				}
			}else{
				alert("房间已被其他RR绑定，您没有权限修改，请自行于该房间代理沟通！")
			}
		}
		
	});

	//点击绑定房间

	$(".hotel_range").on('click','.bindroom',function(){

		var groupidval = $(this).attr("data-groupid")
		var showroom = $(this).attr("data-show")
		var rnametxt = $(this).text()
		console.log(rnametxt)
		if(showroom==0){ //已有房间号
			$("#room-num").val(rnametxt)
		}else{
			// 无房间号
			$("#room-num").val("")
		}
		$("#groupid").val(groupidval)
		$("#roomModal").modal('open')
		// 人员列表获取
		var arrs = [];
		var rrele = $(this).parents('tr').find('.rrname')
		for (var i = 0; i < rrele.length; i++) {
			var txt = $(rrele[i]).text()
			var gids = $(rrele[i]).attr("data-gid")
			var checkstate = $(rrele[i]).attr("data-checkstate") //检测是否已经签到，已签到为1

			var obj ={}
			if(txt && checkstate!=1){
				obj.name = txt
			    obj.gid = gids
			   
				arrs.push(obj)
				
			}
		}
		console.log(arrs)
		//数组去重
		var newarr = [];
    	var newobj = {};
    	for(var i =0; i<arrs.length; i++){
       	   if(!newobj[arrs[i].gid]){
          		newarr.push(arrs[i]);
         	 	newobj[arrs[i].gid] = true;
     		}
    	}
  
		// 渲染
		var namelist =''
		if(newarr.length>0){
			for (var i = 0; i < newarr.length; i++) {
				namelist+='<p><input type="checkbox" name="gids" id="gid'+newarr[i].gid+'" value="'+newarr[i].gid+'"><label for="gid'+newarr[i].gid+'">'+newarr[i].name+'</label></p>'
			}
		}else{
			namelist="暂无人员入住该房间，或者人员都已到场！"
		}
		
		$("#roomform .list_num .list").html(namelist)
		
	})
	//关闭绑定房间模态框
	$("#cancelbtnroom").click(function(){
		$("#roomModal").modal("close")
	}) 
	// 提交房间号,和签到信息
	$("#subbtnroom").click(function(){
		var roomdatas = $("#roomform").serialize();
		$.ajax({
			url:"/hotel/setRoomNum",
			type:"post",
			dataType:"json",
			data:roomdatas,
			success:function(res){
				// console.log(res)

				$("#roomModal").modal("close")
				var hidvalss = $("#hid").val();
				var chooseValss = $("#hometype").val();
				gethotel(chooseValss,hidvalss);
			}
		})

		// $.ajax({
		// 	url:"/hotel/GusercheckIn",
		// 	type:"post",
		// 	dataType:"json",
		// 	data:{gid:},
		// 	success:function(res){
		// 		// console.log(res)

		// 		$("#roomModal").modal("close")
		// 		var hidvalss = $("#hid").val();
		// 		var chooseValss = $("#hometype").val();
		// 		gethotel(chooseValss,hidvalss);
		// 	}
		// })
	})



	//搜索结果高亮

	$(".searchbtn").click(function(){
		//搜索的值
		var inputval = $(this).siblings("#searchval").val();
	
		var choosebox = $(".choosebtn");
		var num = 0;
		var offsetTop = 0;
		// $(".choosebtn").removeClass("active");
		for (var i = 0; i < choosebox.length; i++) {
			var rrname = $(choosebox[i]).find('.rrname').text();
			
			if(rrname.toLowerCase().indexOf(inputval.toLowerCase()) != -1 && inputval!=""){
				num++;
				$(choosebox[i]).addClass("active")
				if(num==1){
				  offsetTop = $(choosebox[i]).offset().top
				}
			}else{
				$(choosebox[i]).removeClass("active")
			}

		}
		// alert("总共有 "+num+" 条数据")
	    $(".admin-content").scrollTop(offsetTop-100)

		$(".resultTotal").css("display","block");
		$(".resultTotal").html('搜索结果共计 <span class="red">'+num+'</span> 条');
		// console.log(num)
	})

	// 姓名自动补全

	// 姓名列表
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

	// console.log(gnamearr)
	
	$('#inname').autocomplete({
		lookup: gnamearr,
		showNoSuggestionNotice:true,
		noSuggestionNotice:'该客人不存在，请重新输入',
		onSelect: function (suggestion) {
			//所选的数据
			$("#gid").val(suggestion.gid)
		    
		}
	});


	// 填写入住人信息提交

	//提交
	$("#ruzhusubbtn").click(function(){
		
		// console.log(formdatas);
		//不能为空
		var selectele = $("#enterInfo select.mustwrite");
		for (var i = 0; i < selectele.length; i++) {
			var chooseval = $(selectele[i]).val()
			if(chooseval==""){
				alert("请务必把信息都选上！");
				$(selectele[i]).addClass("am-field-error am-active");
				$(selectele[i]).siblings(".am-selected").addClass("am-invalid");

				return false;
			}
		}
		
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

		var formdatas = $("#enterInfo").serialize();
		
		$.ajax({
			url:"/hotel/addGuserToRoom",
			data:formdatas,
			type:"post",
			dataType:"json",
			success:function(res){
				// console.log(res)
				$("#infomodal").modal("close");
				window.clearInterval(timer);
				timenum = 60

				// 提交后重新获取数据
				var hometypeval = $("#hometype").val();
				var hidval = $("#hid").val();
				gethotel(hometypeval,hidval)
			}
		})
		// $("#infomodal").modal("close");

	})

	//填写入住人信息取消
	$("#ruzhucancelbtn").click(function(){
		$("#infomodal").modal("close");
		
	}) 
	// 图标关闭-安排入住信息弹框
	$("#iconclose").click(function(){
		$("#infomodal").modal("close");
		
	})

	if(localStorage.srid){
	  releaseRoomfun(localStorage.srid)
	}

	$('#infomodal').on('close.modal.amui', function(){
		var cridval =$("#rid").val();
	  	window.clearInterval(timer);
	  	timenum = 60
	  	releaseRoomfun(cridval)
	});



})

//酒店安排数据渲染

function gethotel(selval, hidval){
	var resutl = "";
	$.ajax({
 		url:"/hotel/hotelList",
		dataType:"json",
		type:"get",
		data:{room_type:selval,hid:hidval},
		success:function(datalist){
			var homenum = datalist[0]
			console.log(homenum)
			for (var i = 0; i < homenum.length; i++) {
				var homestr = "";
				var dateArr = homenum[i]
				// var timearr = ['2018-10-09','2018-10-10','2018-10-11','2018-10-12']
				var timearr = []
				

				var rnamestr = "";
				//是否已经输入房间名字 -- rname
				if (dateArr.rname != null){
					// rnamestr = '<span>房间号：</span><strong style="color:#FF6666">'+dateArr.rname+'</strong>'
					rnamestr ='<button class="am-btn am-btn-xs am-btn-warning bindroom" data-show="0" data-groupid="'+dateArr.groupid+'">'+dateArr.rname+'</button>'
				}else{
					rnamestr = '<button class="am-btn am-btn-xs am-btn-warning bindroom"  data-show="1" data-groupid="'+dateArr.groupid+'">绑定房间号</button>'
				}


				//筛选出日期
				for (var o in dateArr) {
					if(/^2018./.test(o)){
						timearr.push(o)
					}

				}
				
				// 将时间从小到大排列
				for(var k=0; k<timearr.length; k++){
	                for(var j=k; j<timearr.length;j++){
	                	var date = new Date(Date.parse(timearr[k].replace(/-/g, "/")));
					    date = date.getTime();
					    var date2 = new Date(Date.parse(timearr[j].replace(/-/g, "/")));
					    date2 = date2.getTime()
	                    if(date>date2){
	                      min=timearr[j];
	                      timearr[j]=timearr[k];
	                      timearr[k]=min;
	                    }
	                }
	            }
	           
	            // 循环遍历房间

				for (var n = 0; n < timearr.length; n++) {
                    var j = timearr[n]
					var choosehotel ="";
					for (var k = 0; k < dateArr[j].length; k++) {
						//sex 0代表女  1代表男；
						var isex ="";
						var epidval = "";
						var role = "";
						var rrclass = "";
						var cbgs = "";
						var noclick = 1
						var gidval = ""
						var check_active = "" //已经签到高亮

						if(dateArr[j][k].gid){
							gidval = dateArr[j][k].gid
							epidval =dateArr[j][k].epid;
							role = dateArr[j][k].name;
							cbgs = " cbg ";
							if(dateArr[j][k].gender==0){
								isex = "am-icon-venus";
							}else{
								isex = "am-icon-mars";
							}

							if (epidval) {
								rrclass = 'rr' + epidval
							}else {
								rrclass = ""
							}
						}
						if(dateArr[j][k].usability == 0 && selval!=1){
						  cbgs = " cbg "
						  noclick = 0
						  rrclass = 'rrk'
						}
						if(dateArr[j][k].check_in_state==1){
							check_active="check-active"
						}


						choosehotel+='<div class="choosebtn" data-epid="'+epidval+'" data-isclick="'+noclick+'" data-rid="'+dateArr[j][k].rid+'"><span class="check'+cbgs+''+rrclass+'"><span class="empty">空</span><i class="am-icon-check"></i></span>'
								+'<div class="info"><span data-gid="'+gidval+'" data-checkstate="'+dateArr[j][k].check_in_state+'" class="rrname '+check_active+'">'+role+'</span><span>'
								+'<i class="'+isex+'"></i></span></div></div>'
					}

					homestr +='<td class="day_'+j+'">'+choosehotel+'</td>';
					
				}

				resutl +='<tr><td>序号：'+(i+1)+'<div>'+rnamestr+'</div></td>'+homestr+'</tr>';
			}
			

			$(".hotel_range table tbody").html(resutl);
			var alllen = $(".check").parents('.choosebtn').length;
			$(".resultTotal").css("display","block");
			$(".resultTotal").html('总共有 <span class="red">'+alllen+'</span> 个');
			// rr房间统计
			for (var i = 0; i < 6; i++) {
				var ins = i+1
				var rrlen = $(".rr"+ins).parents('.choosebtn').length
				
				// 双人房占用问题
				var newrrlen = rrlen
				var allstr = $(".rr"+ins).parents('td').find('.choosebtn').length
				for (var j = 0; j < allstr; j++) {
					var isrrk = $(".rr"+ins).parents('td').find('.choosebtn').eq(j).find('.check').hasClass('rrk');
					
					if(isrrk){
						newrrlen = newrrlen + 1
					}
				}

				// console.log(rrlen)
				$(".total-rr"+ins).text(newrrlen)
			}
			

		},
		error: function(){
			console.log("error")
		}

	})

}

// 释放房间
function releaseRoomfun(ridval){
	$.ajax({
		url:"/hotel/releaseRoom",
		type:"post",
		dataType:"json",
		data:{rid: ridval},
		success:function(res){
			console.log(res)
		}
	})

   localStorage.clear()
}

