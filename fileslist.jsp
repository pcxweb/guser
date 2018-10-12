<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/public/base.jsp"%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>2018 GEA全球合作伙伴大会</title>
	<link rel="stylesheet" href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<style>
		.top h5{
			color: #003a70;
			margin-bottom: 8px;
		}
		.fileshow{
			margin:20px 20px;
			border:2px dashed #003a70;
			border-radius: 15px;
			padding:30px 0;
		}
		.item{
			margin-bottom: 10px;
			color: #666;
		}
		.item p{
			margin-bottom: 5px;
			overflow: hidden;
      		white-space: nowrap;
      		text-overflow: ellipsis;
		}
		.itemfl{
			padding:8px 8px;
			background-color: #003a70;
			text-align: center;
			color: #fff;
			width: 130px;	
			font-size: 14px;
			margin-left: 10px;
		}
		.itemfr{
			padding:10px 10px;
			margin-left: 10px;
		}
		.itemfr span{
			margin-right: 10px;
		}
		.itemfr ul,ol{
			padding-left: 0px;
		}
		.itemfr ul li{
			list-style: square;
			margin-left: 10px;
			margin-bottom: 5px;
		}
		.itemfr ol li{
			margin-bottom: 6px;
			padding-bottom: 5px;
			border-bottom:1px solid #ccc;
			padding-right: 10px;
			list-style: none;
		}
		.itemfr ol li span{
			display: inline-block;
			width: 20px;
			height: 20px;
			vertical-align: middle;
		}
		.itemfr ol li a{
			text-decoration: underline;
		}
		.itemfr ol li span.size{
			display: inline;
			float: right;
		}
		pre{
      font-size: 14px;
      background-color:#fff;
      border:none;
      color:#666;
		}
		@media screen and (min-width: 769px){
			body{
				width: 900px;
				margin:0 auto;
			}
			div.logo{
				text-align: left;
			}
			div.logo img{
				width: auto;
				height: 100px;
			}
			.top h5{
				margin-left: 5px;
				font-size: 16px;
			}
			.itemfl{
				float: left;
				background-color: none;
				background:url("/annual_view/img/titlebg.png") no-repeat center center;
				background-size: 100%;
				padding:20px 8px;
				width: 182px;
				margin-left: 0;
			}
			.itemfr{
				float: left;
				padding:20px 8px;
				width: 650px;
			}
		}
	</style>
</head>
<body>
<div class="top">
	<div class="text-center">
		<div class="logo">
		<c:if test="${not empty school.logo_path}">

			<img src="/upload/${school.id}/logo/logo.png" width="80%" alt="">
		</c:if>
	
		</div>
		<div style="margin-top:30px">
		<h5>${school.enname}</h5>
		<h5>${school.schoolname }</h5>
		</div>
	</div>
	<div class="fileshow">
		<div class="item clearfix">
			<div class="itemfl">学校关键词</div>
			<div class="itemfr yesnull">
			<c:set value="${ fn:split(school.keyword, ',') }" var="str1" />
			<c:forEach items="${ str1 }" var="s">
<span>${s}</span>
</c:forEach>
		</div>
		</div>
		<div class="item clearfix">
			<div class="itemfl">学校简介</div>
			<div class="itemfr yesnull">
			<pre id="pre3">
			${school.schoolinfo }
			</pre>
			</div>
		</div>
		<div class="item clearfix">
			<div class="itemfl">学校官网</div>
			<div class="itemfr yesnull" id="websitelink">
			
				<p class="schoollink"><a href="${school.schoollink }" title="${school.schoollink }" target="_blank">${school.schoollink }</a></p>
			
			</div>
		</div>
		<div class="item clearfix">
			<div class="itemfl">学校特色</div>
			<div class="itemfr yesnull">
				<pre id="pre1">
			${school.feature }
				</pre>
			</div>
		</div>
		<div class="item clearfix" id="vediolink">
			<div class="itemfl" >学校宣传视频链接</div>
			<div class="itemfr yesnull" id="linkbox">
				<p class="schoollink"><a href="${school.videolinks}" title="${school.videolinks}" target="_blank">${school.videolinks}</a></p>
			</div>
		</div>

		<div class="item clearfix" 	<c:if test="${school.policy==0 }">hidden="true"</c:if>>
			<div class="itemfl">推广政策</div>
			<div class="itemfr yesnull">
				<pre id="pre2">${school.policy_msg }</pre>
			</div>
		</div>
		<div class="item clearfix" id="fujian">
			<div class="itemfl">附件</div>
			<div class="itemfr">
				<ol id="file_view">
<!-- 					<li><span><img src="/annual_view/img/ppt.jpg" width="100%" alt=""></span><a href="#">院校相关课程介绍.ppt</a><span class="size">12kb</span></li>
					<li><span><img src="/annual_view/img/pdf.jpg" width="100%" alt=""></span><a href="#">wesdd.pdf</a><span class="size">450kb</span></li> -->
				</ol>
			</div>
		</div>
	</div>
</div>
<input id="school_id" value="${school.id }" hidden="true"> 
</body>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
 <!-- 获取用户IP -->
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">

$(function(){
	$(".menu").on('click',function(){
		$(".menu-list").slideToggle();
	})
	//给链接添加协议
	/*var linkbox = $(".itemfr .schoollink")
	for (var i = 0; i < linkbox.length; i++) {
		var alink = $(linkbox[i]).find("a").attr("href");
		alink = alink.substr(0,7).toLowerCase() == "http://" ? alink : "http://" + alink;
		var alink = $(linkbox[i]).find("a").attr("href",alink);
	}*/
	var arr = new Array();
	var re = /[\r\n]/g ;
	var linkss = $("#linkbox").find("a").html();
	var weblink = $("#websitelink").find("a").html();
	//宣传视频
	var str1=linkss.replace("，",",") 
	var str=str1.replace(re,",") 
	//官网 网址处理
	var str5 = weblink.replace(/[ ]/g,",");
	var str4 = str5.replace(/[｜]/g,",");     
	var str3 = str4.replace("，",",");
	var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
	
	console.log(str3)
	var str2=str3.replace(re,",") 
	// console.log(str)
	var result="";
	arr = str.split(",");
	for (var i = 0; i < arr.length; i++) {
		
		if(reg.test(arr[i])){
			result+='<p class="schoollink">'+arr[i]+'</p>'
		}else{
			result+='<p class="schoollink"><a href="'+arr[i]+'" title="'+arr[i]+'" target="_blank">'+arr[i]+'</a></p>'
		}
		
		
		// console.log(arr[i])
	}
	$("#linkbox").html(result);
	
	//官网
	var arr2 = new Array();
	var result2="";
	arr2 = str2.split(",");
	for (var i = 0; i < arr2.length; i++) {
		result2+='<p class="schoollink"><a href="'+arr2[i]+'" title="'+arr2[i]+'" target="_blank">'+arr2[i]+'</a></p>'
		// console.log(arr[i])
	}
	$("#websitelink").html(result2);

	var Expression=/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
	var objExp=new RegExp(Expression);
	var linkbox = $(".itemfr .schoollink");
	for (var i = 0; i < linkbox.length; i++) {
		var ahref = $(linkbox[i]).find("a").attr("href");
		if(!objExp.test(ahref)){
			var newlink = "http://"+ahref
			$(linkbox[i]).find("a").attr("href",newlink)
		}
	}
	
	
	// 文字去空格
	var prestr = $("#pre1").html();
	var prestr2 = $("#pre2").html();
  var prestr3 = $("#pre3").html();
  $("#pre1").html($.trim(prestr))
  $("#pre2").html($.trim(prestr2))
  $("#pre3").html($.trim(prestr3))
	var schoolid= $("#school_id").val();
	// 加载附件
	getFile(schoolid);
	
	
	//为空则隐藏
	//宣传视频
	var schoollink = $(".schoollink a").text();
	if(schoollink==""){
      $("#vediolink").css("display","none")
	}
	//关键字
	var yesnull = $(".yesnull");
  for (var i = 0; i < yesnull.length; i++) {
      var nulltext = $(yesnull[i]).text();
      //console.log("i:"+nulltext)
      var newtext = $.trim(nulltext);
      if(newtext==""){
      //console.log(i)
        $(yesnull[i]).parents(".item").css("display","none");
      }
  }
	
})

function getFile(id){

	$.ajax({
		url : "/users/getFileListById",
		data:{'school.id':id},
		success: function(data) {
			var con="";
			for(var x in data){
				var index1=data[x].filename.lastIndexOf(".");  
				var suff=data[x].filename.substring(index1+1,data[x].filename.length);
				// 区分文件的类型，加载对应图标
				if(suff=='pdf'){
					
					con+='<li><span><img src="/annual_view/img/pdf.jpg" width="100%" alt=""></span><a href="/upload/'+id+'/files/'+data[x].filename+'" target="_blank">'+data[x].filename+'</a> <button style="font-size: small;">下载</button></li>'
				}else if(suff=='ppt'||suff=='pptx'){
					con+='<li><span><img src="/annual_view/img/ppt.jpg" width="100%" alt=""></span><a href="/upload/'+id+'/files/'+data[x].filename+'">'+data[x].filename+'</a> <button style="font-size: small;">下载</button></li>'
				}
			}
			$("#file_view").html(con);
		    if($("#file_view").text()==""){
		    	$("#fujian").css("display","none");
		    }
	        //获取IP地址 ，点击下载文件
		  	$("#file_view li button").click(function(){
		  		var aa=$(this).prev("a");
		  		var path=$(aa).attr("href");
		  		var filename=$(aa).html();
		  		var ip=returnCitySN["cip"];
		  		var cname=returnCitySN["cname"];
		  		var school_id= $("#school_id").val();
		  		
		  		console.log(ip);
		  		location.href="/users/downloadFile?path="+path+"&filename="+filename+"&ip="+ip+"&school_id="+school_id+"&region="+cname;
			});

		},
		error:function(data){
			alert("操作失败");
		}
	});
}

</script>
</html>