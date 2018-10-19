$(function(){
	$(".unitform").on("click",'.plusbtn',function(){
		var unitboxlen = $(".unitbox").length;
		var unitboxstr = '<div class="am-form-group unitbox"><label for="companyname" class="am-u-sm-3 am-form-label">单位名称'+(unitboxlen+1)+'</label><div class="am-u-sm-9"><div class="am-input-group am-input-group-secondary"><input type="text" name="cname'+(unitboxlen+1)+'" class="am-form-field" placeholder="请填写单位名称"> <span class="am-input-group-label plusbtn"><i class="am-icon-plus am-icon-fw"></i></span></div></div></div>';

		//添加单元到最后一个的后面
		
		$('.unitbox').eq(unitboxlen-1).after(unitboxstr)
		
		
		// console.log(unitboxlen)
	})

	// 单位搜索
	// 关键词搜索，根据单位和姓名
	$(".searchbtn").click(function(){
		var keywordval = $("#searchkey").val();
		var totalpages = ajaxpage(1,5,keywordval);
		updatepage(totalpages)
	})

	// 删除单位
	$("#unittable").on('click','.btn-delete',function(){
		var ids = $(this).val()
		var delval = confirm("是否确认删除？")
		if(delval){
			deleteUnit(ids)
		}else{
			alert("取消删除！")
		}
	})

	//修改单位

	$("#changeUnitcan").click(function(){
		$('#changunitModal').modal('close');
	})


	// 单位列表分页
    
	
	// console.log(ajaxpage(1,3))
	var totalpage = ajaxpage(1,5,"")
	updatepage(totalpage)


	
});

// 更新分页
function updatepage(totalpage){
	
	if(totalpage==1){
		$("#page2").css("display","none")
		$("#tips").html("共1页，当前第1页");
	}else{
		$("#page2").css("display","block")
	}
	$("#page2").page({
        pages: totalpage,
        first: "<<",   
        last: ">>",      
        prev: '<', 
        next: '>', 
        groups: 6, 
        jump:function(context){
        	var keywordval = $("#searchkey").val();
        	
        	ajaxpage(context.option.curr,5,keywordval);
        	
            $("#tips").html("共"+context.option.pages+"页，当前第"+context.option.curr+"页");
        }
    })
}


function updateUnit(){
	var zhname =$("#zhname").val();
	var unitid =$("#unitid").val();
	$.ajax({
		url:"/hotel/updateUnit",
		type:"get",
		dataType:"json",
		data:{zhname:zhname,unitid:unitid},
		success:function(pagedata){
			window.location.reload();
		},
        error: function (e) {
        	window.location.reload();
        }
	});
}
 function deleteUnit(value){
	$.ajax({
		url:"/hotel/deleteUnit",
		type:"get",
		data:{id:value},
		success:function(pagedata){
			alert(pagedata)
			window.location.reload();
		}
        // error: function (e) {
        // 	window.location.reload();
        //     alert("删除失败");
        // }
	});
}

 function editUnit(value){
	 $('#changunitModal').modal();
	 $("#unitid").val(value);
 }
 
// total --每页多少   page -- 当前页
function ajaxpage(page,sizes,cnameval){
	var totalpageval = 0;
	$.ajax({
		url:"/hotel/getUnitPage",
		type:"get",
		dataType:"json",
		async:false,
		data:{currentPage:page,size:sizes,cname:cnameval},
		success:function(pagedata){
			var resultstr = "";
			console.log(pagedata)
			// 总页数
			// pagedata.total
			var rows = pagedata.rows;
			totalpageval = pagedata.totalpage
			// console.log(pagedata.total)
			// var 
			for (var i = 0; i < rows.length; i++) {
        		// console.log(total*page)
        		resultstr += '<tr><td>'+rows[i].cid+'</td><td>'+rows[i].cname+'</td><td><div class="am-btn-toolbar">'
					+'<div class="am-btn-group am-btn-group-xs"><button type="button" value='+rows[i].cid+' onclick="editUnit(this.value)"  class="am-btn btnchange am-btn-primary am-radius">'
					+'<span class="am-icon-pencil-square-o"></span> 修改</button></div>'
					+'<div class="am-btn-group am-btn-group-xs"><button type="button" value='+rows[i].cid+' class="am-btn btn-delete am-btn-danger am-radius">'
					+'<span class="am-icon-trash-o"></span> 删除</button></div>'
					+'<div class="am-btn-group am-btn-group-xs"><a href="addpeople.jsp?id='+rows[i].cid+'&uname='+rows[i].cname+'" class="am-btn bindpeople am-btn-warning am-radius">'
					+'<span class="am-icon-user"></span> 绑定人员</a></div></div></td></tr>'
        	}

        	$("#unittable tbody").html(resultstr);
        	
		}
	})
	return totalpageval;
}