<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/public/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<!-- <meta name="viewport" content="width=device-width initial-scale=1.0"> -->
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>2018 GEA全球合作伙伴大会</title>
	<!-- 标题图标 -->
    <!-- <link rel="icon" href="gea.ico" type="image/x-icon"> -->
    <link rel="icon" type="image/x-icon" href="favicon.ico" />

	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="css/reset1.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">

</head>
<body>
<div id="app">
  <div class="img-box"><img src="images/login_logo.png" alt=""></div>
  <div class="base items" id="baseinfo">
	<div class="hello">
		<span translate="string_hello_span1">尊敬的</span><strong class="user_name"></strong>，
		<p translate="string_hello_span3"></p>
		<p style="margin-top: 0"><span translate="string_hello_span2">欢迎您拨冗莅临2018 GEA全球合作伙伴大会！温馨提醒您：登录即代表您同意我们的隐私政策。请您仔细阅读以下内容，如果您有任何的疑问或建议，请联系各区域战略发展经理或活动组委会</span> <a class="x-enfamily" href="javascript:;">(gea2018@geaworld.org)</a>。</p>
	</div>
	<div class="title"><span translate="string_hotel-title">酒店预订信息</span></div>
	<div class="item">
	  <ul>
	  	<li>
	  		<i class="fa fa-star" aria-hidden="true"></i>
	  		<strong translate="string_hotel-stitle1">下榻酒店:</strong>
	  		<span class="hotel_name" data-id="1">万豪酒店</span>
	  	</li>
	  	<li>
	  		<i class="fa fa-star" aria-hidden="true"></i>
	  		<strong translate="string_hotel-stitle2">房间类型:</strong>
	  		<span class="home_type" data-id="1">双人间</span>
	  	</li>
	  	<li>
	  		<i class="fa fa-star" aria-hidden="true"></i>
	  		<strong translate="string_hotel-stitle3">房间号:</strong>
	  		<span class="home_id">A10</span>
	  	</li>
	  </ul>
	</div>
  </div>
  <div class="items" id="ball">
	<div class="title"><span translate="string_sports-title">休闲活动信息</span></div>
	<div class="ball-item">
		<ul>
			<li>
				<div class="ball-title">
					<i class="fa fa-soccer-ball-o" aria-hidden="true"></i>
	  				<strong translate="string_sports-stitle1">球类活动:</strong>
	  				<span class="sports_type" data-id="1">羽毛球</span>
				</div>
	  			<div class="ball-info">
					<p translate="string_sports-time1">（活动时间：10月10日20:00-22:00）</p>
					<button type="button" class="routebtn" id="sportbtn" data-sport="badminton-golf" translate="string_sports-btn">点击查看路线示意图</button>
					<div class="path-img">
						<img src="images/Badminton.jpg" alt="">
					</div>
	  			</div>
			</li>
			<li>
				<div class="ball-title">
					<i class="fa fa-soccer-ball-o" aria-hidden="true"></i>
	  				<strong translate="string_sports-stitle2">GEA全明星赛:</strong>
	  				<span>N/A</span>
				</div>
	  			<div class="ball-info">
					<p translate="string_sports-time2">（活动时间：10月10日20:00-22:00）</p>
					<button type="button" class="routebtn" data-sport="Basketball" translate="string_sports-btn">点击查看路线示意图</button>
	  			</div>
			</li>
		</ul>
	</div>
  </div>
  <div class="items" id="meeting">
	<div class="title"><span translate="string_meeting-title">活动座次安排</span></div>
	<div class="ball-item">
		<ul>
			<li style="border-bottom: none">
				<div class="time">
					<p translate="string_meeting-time1">（活动时间：10月11日09:00-17:00）</p>
				</div>
				<div class="ball-title">
					<i class="fa fa-building" aria-hidden="true"></i>
	  				<strong translate="string_meeting-stitle1">院校培训地点:</strong>
	  				<span class="school_place" data-id="2">二楼国瑞厅内</span>
				</div>
			</li>
			<li>
				<div class="ball-title">
					<i class="fa fa-sitemap" aria-hidden="true"></i>
	  				<strong translate="string_meeting-stitle2">院校培训桌号:</strong>
	  				<span class="tablenum1">A10</span>
				</div>
	  			<div class="ball-info">
					<button type="button" id="schoolnum-btn" class="placebtn" data-place="A01" translate="string_meeting-btn">点击查看座位效果图</button>
	  			</div>
			</li>
			<li style="border-bottom: none">
				<div class="time"><p translate="string_meeting-time2">（活动时间：10月11日19:00-22:00）</p></div>
				<div class="ball-title">
					<i class="fa fa-building" aria-hidden="true"></i>
	  				<strong translate="string_meeting-stitle3">公益晚宴地点:</strong>
	  				<span translate="string_meeting-place1">三楼宴会厅</span>
				</div>
			</li>
			<li>
				<div class="ball-title">
					<i class="fa fa-sitemap" aria-hidden="true"></i>
	  				<strong translate="string_meeting-stitle4">公益晚宴桌号:</strong>
	  				<span class="tablenum2">B2</span>
				</div>
	  			<div class="ball-info">
					
					<button type="button" id="givingnum-btn" class="placebtn" data-place="NO.01" translate="string_meeting-btn">点击查看座位效果图</button>
	  			</div>
			</li>
			<li>
				<div class="time"><p translate="string_meeting-time3">（活动时间：10月12日09:00-12:00）</p></div>
				<div class="ball-title">
					<i class="fa fa-building" aria-hidden="true"></i>
	  				<strong translate="string_meeting-stitle5">产品培训地点:</strong>
	  				<span class="product_place" data-id="5">二楼国瑞厅</span>
				</div>
	  			<div class="ball-info">
					
	  			</div>
			</li>
		</ul>
	</div>
  </div>
  
  <div style="height: 1rem"></div>
  <div id="footer">
	<ul>
	  <li><a href="#app"><span translate="string_nav_li1">主页</span></a></li>
	  <li id="roleshow"><a href="file_index.html"><span translate="string_nav_li2">培训资料下载</span></a></li>
	  <li><a href="images/chongqin.pdf" target="_blank"><span translate="string_nav_li3">重庆旅游攻略</span></a></li>
	</ul>
  </div>
</div>
<!-- 路线图显示 -->
<!-- <div id="route_img">
	<div class="img"><img src="" alt=""></div>
</div> -->
</body>
<!-- <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript" src="js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="js/translate.js"></script>
<script type="text/javascript" src="js/info2.js"></script>

</html>