var sizenum = 4;
$(function(){
	// 地点渲染
	$.ajax({
		url:"/act/getProdTypeList",
		type:"get",
		dataType:"json",
		success:function(res){
			var hotelstr =""
			console.log(res)
			for (var i = 0; i < res.length; i++) {
				hotelstr+='<option value="'+res[i].act_id+'">'+res[i].act_name+'</option>'
			}
			// console.log(hotelstr)
			$("#act_type").append(hotelstr)
			$("#change_place").append(hotelstr)
		}
	})
	//地点筛选
	$(".rolechoose").change(function(){
		var chooseval = $(this).val();
		var keywordval = $("#searchkey").val();
		var totalpages = ajaxpage(1,sizenum,chooseval,keywordval);
		updatepage(totalpages)
	})
	// 关键词搜索，根据姓名
	$(".searchbtn").click(function(){
		var selectval = $('.rolechoose').val();
		var keywordval = $("#searchkey").val();
		var totalpages = ajaxpage(1,sizenum,selectval,keywordval);
		updatepage(totalpages)
		
	})

	var totalpage = ajaxpage(1,sizenum)
	updatepage(totalpage)
})


function updatepage(totalpage){
	
	if(totalpage==1){
		$("#page2").css("display","none")
		$("#tips").html("共1页，当前第1页");
	}else{
		$("#page2").css("display","block")
	}
	if(totalpage==0){
		$("#page2").css("display","none")
		$("#tips").html("暂无数据！")
	}
	$("#page2").page({
        pages: totalpage,
        first: "<<",   
        last: ">>",      
        prev: '<', 
        next: '>', 
        groups: 6, 
        jump:function(context){
        	// console.log(context)
        	var selectval = $('.rolechoose').val();
        	var keywordval = $("#searchkey").val();
        	ajaxpage(context.option.curr,sizenum,selectval,keywordval);
            $("#tips").html("共"+context.option.pages+"页，当前第"+context.option.curr+"页");
        }
    })
    // alert(2)
}

// total --每页多少   page -- 当前页
function ajaxpage(page,sizes,selectval,keywordsval){
	var totalpageval = 0;
	$.ajax({
		url:"/act/getProdTrainList",
		type:"get",
		dataType:"json",
		async:false,  
		data:{pageNumber:page,pageSize:sizes,act_id:selectval,name:keywordsval},
		success:function(pagedata){
			console.log(pagedata)
			var resultstr = "";
			// 总页数
			// pagedata.total
			var rows = pagedata.rows;
			totalpageval = Math.ceil(pagedata.total/sizes)
			// console.log(page)
			// var 
			for (var i = 0; i < rows.length; i++) {
				var xu = (page-1)*sizes+(i+1)
				var gendertxt = ''
				var groletxt = ''
				var hasroom = ''
				var roomclass = ''
				var rname = ''
				var room_type = ''
				if(rows[i].gender==0){
					gendertxt="女"
				}else{
					gendertxt="男"
				}
				if(rows[i].grole==1){
					groletxt = '校代'
				}else if(rows[i].grole==2){
					groletxt = '代理'
				}else{
					groletxt = 'GEA'
				}

				var zhname = ''
				if (rows[i].name_zh !=null ){
					zhname = rows[i].name_zh
				}
				
				resultstr +='<tr><td>'+xu+'</td><td>'+zhname+'</td>'
					+'<td>'+rows[i].name_en+'</td><td>'+gendertxt+'</td>'
					+'<td>'+groletxt+'</td><td>'+rows[i].act_name+'</td></tr>'


										
        	}

        	$("#product_table tbody").html(resultstr);
        	
		}
	})
	return totalpageval;
}