<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý khách hàng</title>
<%@include file="includes/Library.jsp"%>
</head>
<body spellcheck="false">
	<div class="wrapper">
		<%@include file="includes/SideBar.jsp"%>
		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-minimize">
						<button id="minimizeSidebar"
							class="btn btn-info btn-round btn-icon">
							<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
								class="fa fa-navicon visible-on-sidebar-mini"></i>
						</button>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="">Lịch sử khách hàng</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
									class="notification">5</span>
									<p class="hidden-md hidden-lg">
										Thông báo <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="">Huy đại ka</a></li>
									<li><a href="">Tân óc chó</a></li>
									<li><a href="">Luật óc chó</a></li>
									<li><a href="">Đến óc chó</a></li>
									<li><a href="">Việt Anh óc chó</a></li>
								</ul></li>

							<li class="dropdown dropdown-with-icons"><a href=""
								class="dropdown-toggle" data-toggle="dropdown"> <i
									class="fa fa-list"></i>
									<p class="hidden-md hidden-lg">
										Thêm <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu dropdown-with-icons">
									<li><a href=""> <i class="pe-7s-mail"></i> Tin nhắn
									</a></li>
									<li><a href=""> <i class="pe-7s-help1"></i> Trợ giúp
									</a></li>
									<li><a href=""> <i class="pe-7s-tools"></i> Cài đặt
									</a></li>
									<li class="divider"></li>
									<li><a href=""> <i class="pe-7s-lock"></i> Khóa màn
											hình
									</a></li>
									<li><a href="" class="text-danger"> <i
											class="pe-7s-close-circle"></i> Thoát
									</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="content">
									<div class="toolbar">
									</div>
									<div class="fresh-datatables">
										<table id="tableHistoryCustomer" class="table table-striped"
											width="100%">
											<thead>
												<tr>
													<th>Mã đơn vị</th>
													<th>Tên</th>
													<th>Người đại diện</th>
													<th>Địa chỉ</th>
													<th>Điện thoại</th>
													<th>Website</th>
													<th>Thư điện tử</th>
													<th>Phiên bản</th>
													<th>Ngày tạo</th>
													<th>lần cập nhật sau cùng</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="includes/Footer.jsp"%>
		</div>
	</div>
	<%@include file="includes/FixedPlugin.jsp"%>
	<script>
		var tableHistoryCustomer = $('#tableHistoryCustomer')
				.DataTable(
						{
							"processing" : true,
							"ajax" : {
								"url" : contextPath + "/GetListHistoryCustomer",
								"dataSrc" : "",
								"data" : {
									"customercode" : "${customercode}"
								}
							},
							"columns" : [
									{
										"render" : function(data, type, full,
												meta) {
											return '<a role="button" onclick="allInOne(0, 0, '
													+ full.customerid
													+ ');">'
													+ full.customercode
													+ '</a>';
										}
									},
									{
										"data" : "name"
									},
									{
										"data" : "representatives"
									},
									{
										"data" : "address"
									},
									{
										"data" : "phone"
									},
									{
										"data" : "website"
									},
									{
										"data" : "email"
									},
									{
										"data" : "version"
									},
									{
										"render" : function(data, type, full,
												meta) {
											var year = full.datecreated.year,
												month = formatTime(full.datecreated.monthOfYear),
												day = formatTime(full.datecreated.dayOfMonth),
												hour = formatTime(full.datecreated.hourOfDay),
												minute = formatTime(full.datecreated.minuteOfHour),
												second = formatTime(full.datecreated.secondOfMinute)
												time = hour + ':' + minute + ':' + second;
											return '<span class="hidden">'
													+ year + '/' + month + '/' + day
													+ ' '
													+ time
													+ '</span>'
													+ day + '/' + month + '/' + year
													+ ' '
													+ time
										}
									},
									{
										"render" : function(data, type, full,
												meta) {
											var year = full.lastupdate.year,
												month = formatTime(full.lastupdate.monthOfYear),
												day = formatTime(full.lastupdate.dayOfMonth),
												hour = formatTime(full.lastupdate.hourOfDay),
												minute = formatTime(full.lastupdate.minuteOfHour),
												second = formatTime(full.lastupdate.secondOfMinute)
												time = hour + ':' + minute + ':' + second;
											return '<span class="hidden">'
													+ year + '/' + month + '/' + day
													+ ' '
													+ time
													+ '</span>'						
													+ day + '/' + month + '/' + year
													+ ' '
													+ time
										}
									},],
							"order" : [],
							"responsive" : true,
							"lengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "Tất cả" ] ],
							"pagingType" : "full_numbers_no_ellipses",
							searchHighlight : true,
							"language" : {
								"url" : '<c:url value="/resources/js/i18n/Vietnamese.json" />'
							}
						});
	</script>
</body>
</html>