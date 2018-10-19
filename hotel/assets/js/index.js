$(function(){
	/* <tr><td rowspan="3" align="center" class="date_td">2018-10-09</td><td>单人间</td>
	<td class="most-num">100</td>
	<td class="least-num">80</td>
	<td class="used-num"><span class="am-badge am-round am-badge-warning">22</span></td>
	<td>78</td></tr> */
	getdatelist(1)
	$("#hid").change(function(){
		var hidvals = $(this).val();
		getdatelist(hidvals);
	})
	
})

function getdatelist(hidval){
	$.ajax({
		url:"/hotel/indexData",
		type:"post",
		dataType:"json",
		data:{hid:hidval},
		success:function(res){
			// console.log(res)
			var result = ''
			for (var i = 0; i < res.length; i++) {
				var dateinfo =  res[i]
				var trStr = ''
				for (var j = 0; j < dateinfo.length; j++) {
					// console.log(dateinfo[j])
					var isdatetd = ''
					if(j==0){
						var arr = dateinfo[j].check_in_time.split(" ")
						isdatetd = '<td rowspan="'+dateinfo.length+'" align="center" class="date_td">'+arr[0]+'</td>'
					}
					// 房间类型
					var room_type = ''
					if(dateinfo[j].room_type==1){
						room_type="单人间"
					}else if(dateinfo[j].room_type==2){
						room_type="双人间"
					}else{
						room_type="加床房"
					}
					// 房间下限数
					var min_count = 0
					if(dateinfo[j].min_count != null){
						min_count = dateinfo[j].min_count
					}
					// 床位占用数
					var bednum = dateinfo[j].used_pos + dateinfo[j].usb_count
					var shengyu = dateinfo[j].room_count - dateinfo[j].used_room
					var bedshengyu = dateinfo[j].max_count - bednum
					trStr +='<tr>'+isdatetd+'<td>'+room_type+'</td>'
						+'<td class="most-num">'+dateinfo[j].room_count+'</td>'
						+'<td class="least-num">'+min_count+'</td><td class="used-num">'
						+'<span class="am-badge am-badge-warning">'+dateinfo[j].used_room
						+'</span></td><td><span class="am-badge am-badge-success">'+shengyu+'</span></td>'
						+'<td>'+dateinfo[j].max_count+'</td>'
						+'<td>'+bednum+'</td>'
						+'<td><span class="am-badge am-badge-danger">'+bedshengyu+'</span></td></tr>'
						
				}
				var ishowtable = "block";
				if(trStr==''){
					ishowtable = "none";
				}else{
					ishowtable = "block";
				}
				result +='<div style="display:'+ishowtable+'" class="am-u-sm-12 dateitem list'+i+'"><table class="am-table am-table-centered am-table-bordered am-table-bd am-table-striped admin-content-table">'
				+'<thead><tr><th>日期</th><th>类型</th><th>房间总数</th><th>房间下限</th><th>已用房间</th><th>剩余房间</th>'
				+'<th>床位总数</th><th>床位占用数</th><th>剩余床位</th></tr>'
				+'</thead><tbody>'+trStr+'</tbody></table></div>'
			}

			$("#date_list").html(result)
		}
	})
}