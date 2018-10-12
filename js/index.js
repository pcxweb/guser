$(function(){
	// 活动日程表相关js
	var linep = $("#linebox p");
	$("#linebox").on('click','p',function(){
		var ids = $(this).index();
		$('.date_con').eq(ids).addClass('active').siblings('.date_con').removeClass('active')
		$("#linebox p").find('span').removeClass('active')
		//选择日期是否已过
		$(this).find('span').addClass('active')
		
	})
	var nowtime = new Date(datefun());
	var ishasday = false
	for (var i = 0; i < linep.length; i++) {
		var currentDate = $(linep[i]).attr('data-dateval')
		var currentTime = new Date(currentDate)

		$(linep[i]).find('span').removeClass('active')
		
		if(currentTime.getTime() == nowtime.getTime()){
			// 刚好在今天的日期
			$(linep[i]).find('span').addClass('fa-dot-circle-o')
			$(linep[i]).find('span').addClass('active')
			$(".date_con").eq(i).addClass('active').siblings('.date_con').removeClass('active')
			ishasday = true
			
		}else if(currentTime.getTime()>nowtime.getTime()){
			// 还未到日期
			$(linep[i]).find('span').addClass('fa-circle')
			
		}else{
			//已经过的日期
			$(linep[i]).find('span').addClass('fa-check-circle')
		}
		
		
	}
	// 如果都还没有开始选择1
	if(!ishasday){
		$(linep[0]).find('span').addClass('active')
		$(".date_con").eq(0).addClass('active').siblings('.date_con').removeClass('active')
	}




	// 资料下载

	$.ajax({
		type:"get",
		url:"/users/getAllSchool",
		async: false,
		success:function(data){
			// console.log(data.Britain)
			// console.log(countab);
			var result="";
			for (var i = 0; i < data.length; i++) {
				result+='<tr class="list-item"><td class="seat">&nbsp;'+data[i].seat+'</td>'
				+'<td class="theme" style="display:none">&nbsp;'+data[i].country+'</td>'
				+'<td class="enname desc">&nbsp;'+data[i].enname+'</td>'
				+'<td class="zhname desc" style="display:none">&nbsp;'+data[i].schoolname+'</td>'
	            +'<td align="center"><a href="/users/schoolInfo?school.id='+data[i].id+'" class="white filelist" target="_blank">查 看</a></td>'
	          	+'</tr>';
			}
			
			// $(".cont table tbody").html('<tr><td bgcolor="#ffbf4c">&nbsp;桌号</td><td bgcolor="#ffbf4c" style="display:none;">&nbsp;国家</td><td bgcolor="#ffbf4c">&nbsp;University</td><td bgcolor="#ffbf4c" style="display:none;">&nbsp;学院</td><td align="center" bgcolor="#ffbf4c">&nbsp;资料</td></tr>');
          	$(".list").html('<tr><td bgcolor="#d0a8e1">&nbsp;桌号</td><td bgcolor="#d0a8e1" style="display:none;">&nbsp;国家</td><td bgcolor="#d0a8e1">&nbsp;University</td><td bgcolor="#d0a8e1" style="display:none;">&nbsp;学院</td><td align="center" bgcolor="#d0a8e1">&nbsp;资料</td></tr>'+result);
          	getname()
		},
		error:function(){
			alert("ajax error!")
		}
	})
	$(".country .tab").click(function(){
		// 点击获取对应的国家选中对应select
		var countab = $(this).attr("tag");
		$(this).addClass("active").siblings().removeClass("active")
		$("#"+countab).click();
		
	})
	$('#file_upload').jplist({				
		itemsBox: '.list' 
		,itemPath: '.list-item' 
		,panelPath: '.jplist-panel'	
	});
	
})

function datefun(){
	var newdates = new Date()
	var year = newdates.getFullYear();
	var month = newdates.getMonth() + 1;
	var day = newdates.getDate();
	// if (month < 10) {
	//     month = "0" + month;
	// }
	// if (day < 10) {
	//     day = "0" + day;
	// }
	var nowDate = year + "-" + month + "-" + day;

	return nowDate
}


function getname(){
	$(".filelist").click(function(){
		var zhnames = $(this).parent('td').parent('tr').find('.zhname').text();
		var ennames = $(this).parent('td').parent('tr').find('.enname').text();

        localStorage.zhname = zhnames;
        localStorage.enname = ennames;
    })
}