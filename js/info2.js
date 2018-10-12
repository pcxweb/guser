$(function(){
	$("#route_img").click(function(){
		$(this).hide()
		$("#app").removeClass('ban_body')

		var margintopval = parseInt($("#app").css('marginTop')) // 
		$("#app").css('marginTop',"0px")
		$(window).scrollTop(-margintopval)

	})
	// 球类图片路径
	$(".routebtn").click(function(){
		var sportpath = $(this).attr("data-sport")
		window.location.href = 'imgpage.html?type=1&img='+sportpath
		// if(datalan == "zh_CN"){
		// 	$("#route_img img").attr("src","images/"+sportpath+".jpg")
		// }else{
		// 	$("#route_img img").attr("src","images/en-"+sportpath+".jpg")
		// }
		
		// $("#route_img").show()
		// var appscrolltop = $(window).scrollTop(); 
		
		// $("#app").css("marginTop",-appscrolltop+"px")
		// $("#app").addClass('ban_body')
		
	})
	// 场地图片路径
	$("#schoolnum-btn").click(function(){
		var placepath = $(this).attr("data-place")
		window.location.href = 'imgpage.html?type=2&img='+placepath
		// if(datalan == "zh_CN"){
		// 	$("#route_img img").attr("src","images/place/"+placepath+".jpg")
		// }else{
		// 	$("#route_img img").attr("src","images/place/en-"+placepath+".jpg")
		// }
		// $("#route_img").show()
		// var appscrolltop = $(window).scrollTop(); 
		
		// $("#app").css("marginTop",-appscrolltop+"px")
		// $("#app").addClass('ban_body')
	})
	//公益晚宴
	$("#givingnum-btn").click(function(){
		var placepath = $(this).attr("data-place")
		window.location.href = 'imgpage.html?type=3&img=new'+placepath
		// $("#route_img img").attr("src","images/place/"+placepath+".jpg")
		
		// $("#route_img").show()
		// var appscrolltop = $(window).scrollTop(); 
		
		// $("#app").css("marginTop",-appscrolltop+"px")
		// $("#app").addClass('ban_body')
	})

	$.ajax({
		url:"/guser/getGuserInfo",
		type:"post",
		dataType:"json",
		success:function(res){
			if(!res){
				window.location.href="/guser/login.html";
				return false;
			}
			// 底部显示 -- 角色
			if(res.grole==1){
				$("#roleshow").css("display","none")
			}else{
				$("#roleshow").css("display","flex")
			}
			if(res.name_zh){
				$(".user_name").text(res.name_zh)
			}else{
				$(".user_name").text(res.name_en)
			}
			
			var rname = "N/A" // 房间号
			var hotel_name = "N/A" // 酒店名称
			var home_type = "N/A" // 房间类型
			var sports_type = "N/A" //球类型
			var school_place = "N/A" //院校培训地点
			var tablenum1 = "N/A" // 院校培训桌号
			var tablenum2 = "N/A" //公益晚宴桌号
			var product_place = "N/A" //产品培训地点
			if(res.rname){
				rname = res.rname
			}
			if(res.hotel_name){
				hotel_name = res.hotel_name
			}
			if(res.home_type){
				home_type = res.home_type
			}
			if(res.sel_sport_id){
				sports_type = res.sel_sport
				if(res.sel_sport_id==1){
					$("#sportbtn").attr("data-sport","Badminton")
				}else if(res.sel_sport_id==2){
					$("#sportbtn").attr("data-sport","Golf")
				}
				
			}
			// 院校培训
			if(res.sc_addr){
				school_place = res.sc_addr
				tablenum1 = res.table_name1
				$("#schoolnum-btn").css("display","block")
			}else {
				$("#schoolnum-btn").css("display","none")
			}
			// 公益晚宴
			if(res.table_name2){
				tablenum2 = res.table_name2
				$("#givingnum-btn").css("display","block")
			}else {
				$("#givingnum-btn").css("display","none")
			}
			if(res.prod_room){
				product_place = res.prod_room

			}
			$(".home_id").text(rname)
			$(".hotel_name").text(hotel_name)
			$(".hotel_name").attr("data-id",res.hid)
			
			$(".home_type").attr("data-id",res.room_type)
			$(".home_type").text(home_type)
			

			$(".sports_type").text(sports_type)
			$(".sports_type").attr("data-id",res.sel_sport_id)

			$(".school_place").text(school_place)
			$(".school_place").attr("data-id",res.sc_addr_id)

			$(".tablenum1").text(tablenum1)
			$("#schoolnum-btn").attr("data-place",tablenum1)
			$(".tablenum2").text(tablenum2)
			$("#givingnum-btn").attr("data-place",tablenum2)


			$(".product_place").text(product_place)
			$(".product_place").attr("data-id",res.prod_room_id)

			// 动态数据翻译
			// 酒店名称
			var hotel_id = $(".hotel_name").attr("data-id")
			// 房间类型
			var home_id = $(".home_type").attr("data-id")
			// 球类运动
			var sports_id = $(".sports_type").attr("data-id")
			// 地点
			var school_placeid = $(".school_place").attr("data-id")
			var product_placeid = $(".product_place").attr("data-id")

			function twofun(txt1,txt2,ids,el,num1,num2){
			  if(ids==num1){
			    $(el).text(txt1)
			  }else if(ids==num2){
			    $(el).text(txt2)
			  }
			}
			function threefun(txt1,txt2,txt3,ids,el,num1,num2,num3){
			  if(ids==num1){
			    $(el).text(txt1)
			  }else if(ids==num2){
			    $(el).text(txt2)
			  }else if(ids==num3){
			    $(el).text(txt3)
			  }
			}


			if(datalan == "zh_CN"){
			  twofun("万豪酒店","喜来登酒店",hotel_id,".hotel_name",1,2)
			  threefun("单人间","双人间","行政套房",home_id,".home_type",1,2,3)
			  threefun("羽毛球","高尔夫","不参与",sports_id,".sports_type",1,2,3)
			  threefun("二楼国瑞厅","三楼宴会厅","三楼宴会厅",school_placeid,".school_place",1,2,3)
			  twofun("二楼国瑞厅","VIP行政会议厅（三楼会议室5）",product_placeid,".product_place",5,6)
			  
			}else{
			  twofun("Marriott Hotel","Sheraton Hotel",hotel_id,".hotel_name",1,2)
			  threefun("Single","Double","Executive",home_id,".home_type",1,2,3)
			  threefun("Badminton","Golf","Not to Attend",sports_id,".sports_type",1,2,3)
			  threefun("Guorui Room (2nd Floor)","Inside Banquet Hall (3rd Floor)","Outside Banquet Hall (3rd Floor)",school_placeid,".school_place",1,2,3)
			  twofun("Guorui Room (2nd Floor)","VIP Executive Meeting Room",product_placeid,".product_place",5,6)
			}
		}
	})


	
})