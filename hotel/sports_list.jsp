<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>年会酒店房间安排系统</title>
    <meta charset="utf-8" /> 
    <link rel="icon" href="gea.ico" type="image/x-icon">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="keywords" content="index" /> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /> 
	<meta name="renderer" content="webkit" /> 
	
	
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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">球类分配列表</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-3">
					  <span>球类选择：</span>
			          <div class="am-form-group">
			            <select id='act_type' style="width: 100%;padding:.3rem 0.5rem" class="rolechoose">
			              <option value="">全部</option>
			             
			            </select>
			          </div>
			        </div>
			       	<div class="am-u-sm-12 am-u-md-4">
						<span class="desc">关键词搜索，根据姓名</span>
						<div class="am-input-group am-input-group-sm">
						  <input type="text" id="searchkey"  class="am-form-field searchval" placeholder="中英文名">
						  <span class="am-input-group-label searchbtn"><i class="am-icon-search am-icon-fw"></i></span>
						</div>
					</div>
					<div class="am-u-sm-12" id="peoplelist">
						<div class="am-scrollable-horizontal">
							<table class="am-table am-table-bd am-table-striped admin-content-table" id="sport_table">
								<thead>
									<tr>
										<th>序号</th>
										<th>中文名</th>
										<th>英文名</th>
										<th>性别</th>
										<th>角色</th>
										<th>球类</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td>5</td>
										<td>随便</td>
										<td>suibian</td>
										<td>女</td>
										<td>GEA</td>
										<td>羽毛球</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs"><button type="button" data-gid="31" class="am-btn btnchange am-btn-primary am-radius"><span class="am-icon-pencil-square-o"></span> 修改</button></div>
												<div class="am-btn-group am-btn-group-xs"><button data-gid="31" type="button" class="am-btn btn-delete am-btn-danger am-radius"><span class="am-icon-trash-o"></span> 删除</button></div>
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
						</div>
						<!-- 分页 -->
						<div id="page2"></div>
						<div id="tips"></div>
					</div>
				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2018 08 14 </p>
			</footer>
		</div>
		<!-- content end -->
	</div>


</body>
<script src="assets/js/amazeui.min.js"></script> 
<!--<![endif]-->  
<script type="text/javascript" src="assets/js/amazeui.page.js"></script>
<script type="text/javascript">
var sizenum = 4;
$(function(){
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
			$("#act_type").append(optionstr)
		}
	})
	//球类筛选
	$(".rolechoose").change(function(){
		var chooseval = $(this).val();
		console.log(chooseval)
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
        	// console.log(selectval)
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
		url:"/act/getBallAplList",
		type:"get",
		dataType:"json",
		async:false,  
		data:{pageNumber:page,pageSize:sizes,act_type:selectval,name:keywordsval},
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
					+'<td>'+groletxt+'</td><td>'+rows[i].sport_type+'</td></tr>'


										
        	}

        	$("#sport_table tbody").html(resultstr);
        	
		}
	})
	return totalpageval;
}




</script>

</html>