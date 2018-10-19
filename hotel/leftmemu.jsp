<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/public/base.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
	/*#admin-offcanvas .am-list li{
		position: relative;
		display: block;
		margin-bottom: -1px;
		background-color: #fff;
		border: 1px solid #dedede;
		border-width: 1px 0;
	}
	#admin-offcanvas .am-list li a{
		display: block;
    	padding: 1rem 0;
	}*/
</style>
<script type="text/javascript">
function loginout(){
	$.ajax({
		url:"/hotel/loginout",
		type:"get",
		dataType:"json",
		data:{},
		success:function(data){
			alert("注销成功");
			window.open("/hotel/index.jsp","_self");
		},error: function (e) {
        }
	});
}
</script>
</head>
<body>
	<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
		<div class="am-offcanvas-bar admin-offcanvas-bar" style="overflow-y: hidden;">
			<ul class="am-list admin-sidebar-list">
				<li><a href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
				<li class="admin-parent">
					<a class="am-cf" data-am-collapse="{target: '#people-nav'}"><span class="am-icon-th"></span> 人员列表 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in" id="people-nav">
						<li><a href="addunit.jsp" target="_self"><span class="am-icon-puzzle-piece"></span> 单位管理</a></li>
						<li><a href="peopleList.jsp"><span class="am-icon-th"></span> 角色列表</a></li>
					</ul>
				</li>
				<li class="admin-parent">
					<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 房间管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
						<c:if test="${sessionScope.geauser.role == 0}" ><!-- ben 账号可见 -->
					    <li><a href="addhotel.jsp"><span class="am-icon-plus"></span> 添加房间</a></li>
						</c:if>
						<li><a href="hotel-arrange.jsp"><span class="am-icon-calendar"></span> 房间安排</a></li>
					</ul>
				</li>

				<c:if test="${sessionScope.geauser.role == 0}" ><!-- ben 账号可见 -->

				<li class="admin-parent">
					<a class="am-cf" data-am-collapse="{target: '#table-nav'}"><span class="am-icon-file"></span> 座位安排 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in" id="table-nav">
						<li><a href="addactivity.jsp"><span class="am-icon-plus"></span> 添加活动座位</a></li>
					    <li><a href="table-arrange.jsp"><span class="am-icon-calendar"></span> 院校培训座位</a></li>
					    <li><a href="product-arrange.jsp"><span class="am-icon-calendar"></span> 产品培训安排</a></li>
						<li><a href="dinner-arrange.jsp"><span class="am-icon-calendar"></span> 晚宴座位</a></li>
					</ul>
				</li>
				<li class="admin-parent">
					<a class="am-cf" data-am-collapse="{target: '#sports-nav'}"><span class="am-icon-file"></span> 球类活动 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in" id="sports-nav">
						<li><a href="sports_apl.jsp"><span class="am-icon-plus"></span> 绑定球类</a></li>
						<li><a href="sports_list.jsp"><span class="am-icon-th"></span> 分配列表</a></li>
					</ul>
				</li>
				</c:if>
				<li><a href="javascript:void(0);" onclick="loginout()"><span class="am-icon-sign-out"></span> 注销</a></li>
			</ul>
			
		</div>
	</div>
</body>
</html>
