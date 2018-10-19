$(function(){
	$.ajax({
		url:"/hotel/getHotelMapping",
		type:"get",
		dataType:"json",
		success:function(res){
			var hotelstr = ''
			// console.log(res)
			for (var i = 0; i < res.length; i++) {
				hotelstr+='<option value="'+res[i].hid+'">'+res[i].hotel_name+'</option>'
			}
			$("#hid").append(hotelstr)
		}
	})
})