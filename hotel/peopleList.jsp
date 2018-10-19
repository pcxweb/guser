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
					<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">人员列表</strong></div>
				</div>
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-3">
					  <span>角色选择：</span>
			          <div class="am-form-group">
			            <select id='grole' class="rolechoose" data-am-selected="{btnSize: 'sm',placeholder:'请选择角色类型'}" >
			              <option value=" ">全部</option>
			              <option value="1">校代</option>
			              <option value="2">代理</option>
			              <option value="3">GEA</option>
			            </select>
			          </div>
			        </div>
			       	<div class="am-u-sm-12 am-u-md-4">
						<span class="desc">关键词搜索，根据单位和姓名</span>
						<div class="am-input-group am-input-group-sm">
						  <input type="text" id="searchkey"  class="am-form-field searchval" placeholder="中/英/公司名">
						  <span class="am-input-group-label searchbtn"><i class="am-icon-search am-icon-fw"></i></span>
						</div>
					</div>
					<div class="am-u-sm-12" id="peoplelist">
						<div class="am-scrollable-horizontal">
							<table class="am-table am-table-bd am-table-striped admin-content-table" id="unittable">
								<thead>
									<tr>
										<!-- <td><input type="checkbox" /></td> -->
										<th>序号</th>
										<th>中文名</th>
										<th>英文名</th>
										<th>性别</th>
										<th>角色</th>
										<th>公司名</th>
										<th>邮箱</th>
										<th>电话</th>
										<th>跟进者</th>
										<th>签到情况</th>
										<th>详情</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
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
$(function(){
	
	//角色筛选
	$(".rolechoose").change(function(){
		var chooseval = $(this).val();
		var keywordval = $("#searchkey").val();
		var totalpages = ajaxpage(1,5,chooseval,keywordval);
		updatepage(totalpages)
	})
	// 关键词搜索，根据单位和姓名
	$(".searchbtn").click(function(){
		var selectval = $('.rolechoose').val();
		var keywordval = $("#searchkey").val();
		var totalpages = ajaxpage(1,5,selectval,keywordval);
		updatepage(totalpages)
		
	})


	// 查看入住详情
	$("#peoplelist").on('click','.showinfobtn',function(){
		var isroom = $(this).attr('data-isroom')
		var txt = $(this).text()
		if(isroom=="未分配"){
			alert("还没有分配房间")
			event.preventDefault();
			return false;
		}
		$(this).siblings('div').slideToggle();
		$(this).parents('tr').siblings('tr').find('.home-info').slideUp();
		$(this).parents('tr').siblings('tr').find('.showinfobtn').text('展开')
		if(txt=="展开"){
			$(this).text("收起")
		}else{
			$(this).text("展开")

		}
	})
	var totalpage = ajaxpage(1,5,"","");
	updatepage(totalpage)

	// 删除人员
	$("#peoplelist").on("click",".btn-delete",function(){
		var gidval = $(this).attr('data-gid');
		var confirmval = confirm("确认要删除么？");
		if(confirmval){
			$.ajax({
				url:"/hotel/deleteGuser",
				type:"get",
				dataType:"json",
				data:{gid:gidval},
				success:function(res){
					if(res.status=="isok"){
						alert("删除成功！")
						var selectval = $('.rolechoose').val();
						var totalpages = ajaxpage(1,5,selectval,"");
						updatepage(totalpages)
					}
				}
			})
		}
	})
	// 修改人员
	$("#peoplelist").on("click",".btnchange",function(){
		var gidval = $(this).attr('data-gid');
		window.location.href="/hotel/toUpdateGuser?gid="+gidval
	})
})



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
        	// alert(1)
        	var selectval = $('.rolechoose').val();
        	// console.log(selectval=="")
        	var keywordval = $("#searchkey").val();
        	ajaxpage(context.option.curr,5,selectval,keywordval);
        	
            $("#tips").html("共"+context.option.pages+"页，当前第"+context.option.curr+"页");
        }
    })
    // alert(2)
}

// total --每页多少   page -- 当前页
function ajaxpage(page,sizes,selectval,keywordsval){
	var totalpageval = 0;
	$.ajax({
		url:"/hotel/getGusersPage",
		type:"get",
		dataType:"json",
		async:false,  
		data:{currentPage:page,size:sizes,grole:selectval,keyword:keywordsval},
		success:function(pagedata){
			// console.log(pagedata)
			var resultstr = "";
			// 总页数
			// pagedata.total
			var rows = pagedata.rows;
			totalpageval = pagedata.totalpage
			// console.log(page)
			// var 
			for (var i = 0; i < rows.length; i++) {
				var xu = (page-1)*sizes+(i+1)
				var gender = ''
				var grole = ''
				var hasroom = ''
				var roomclass = ''
				var rname = ''
				var room_type = ''
				var checkstate = ''
				if(rows[i].gender==0){
					gender="女"
				}else{
					gender="男"
				}
				if(rows[i].grole==1){
					grole = '校代'
				}else if(rows[i].grole==2){
					grole = '代理'
				}else{
					grole = 'GEA'
				}
				// 是否签到
				if(!rows[i].check_in_state){
					checkstate="未签到"
					roomclass = 'am-badge-danger'
				}else{
					checkstate = "已签到"
					roomclass = 'am-badge-success'
				}
				if(rows[i].min_date != null){
					hasroom = '已分配'
					
				}else{
					hasroom = '未分配'
					
				}

				if(rows[i].rname != null){
					rname = rows[i].rname
				}else{
					rname = '暂无房间号'
				}

				if(rows[i].room_type != null){
					if(rows[i].room_type==1){
						room_type = "单人间"
					}else if(rows[i].room_type==2){
						room_type = "双人间"
					}else{
						room_type = "加床房"
					}
				}

				var zhname = ''
				if (rows[i].name_zh !=null ){
					zhname = rows[i].name_zh
				}
				// 日期
				var minArr = []
				var maxArr = []
				if(rows[i].min_date){
					minArr = rows[i].min_date.split(" ");
					maxArr = rows[i].max_date.split(" ");
				}
				var emailval = ''
				if (rows[i].email !=null ){
					emailval = rows[i].email
				}

				resultstr += '<tr>'
				+'<td>'+xu+'</td><td>'+zhname+'</td>'
				+'<td>'+rows[i].name_en+'</td><td>'+gender+'</td>'
				+'<td>'+grole+'</td><td>'+rows[i].cname+'</td>'
				+'<td>'+emailval+'</td><td>'+rows[i].phone+'</td>'
				+'<td>'+rows[i].name+'</td>'
				+'<td><span class="am-badge am-round '+roomclass+'">'+checkstate+'</span></td>'
				+'<td class="detailtd"><button type="button" data-isroom="'+hasroom+'" class="am-btn showinfobtn am-btn-xs am-btn-warning">展开</button>'
				+'<div class="home-info"><p>'+minArr[0]+' —— '+maxArr[0]+'</p><p>'+room_type+' '+rname+'</p></div></td>'
				+'<td><div class="am-btn-toolbar"><div class="am-btn-group am-btn-group-xs"><button type="button" data-gid="'+rows[i].gid+'" class="am-btn btnchange am-btn-primary am-radius"><span class="am-icon-pencil-square-o"></span> 修改</button></div>'
				+ '<div class="am-btn-group am-btn-group-xs"><button data-gid="'+rows[i].gid+'" type="button" class="am-btn btn-delete am-btn-danger am-radius"><span class="am-icon-trash-o"></span> 删除</button></div></div></td>'
				+'</tr>'


										
        	}

        	$("#unittable tbody").html(resultstr);
        	
		}
	})
	return totalpageval;
}




</script>

</html>