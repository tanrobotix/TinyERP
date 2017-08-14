<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Not for commercial use (Không dùng vào mục đích thương mại, đây là sản phẩm dùng não để ăn cắp :3) -->
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
						<a class="navbar-brand" href="">Quản lý khách hàng</a>
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
										<div class="form-group form-inline">
											<div class="form-group">
												<button onclick="allInOne(1, 1);"
													class="btn btn-success btn-sm">Thêm</button>
											</div>
											<div class="form-group">
												<input id="ordercode" name="ordercode" type="text"
													class="form-control input-sm" placeholder="Mã đơn hàng"
													value="${ordercode}">
											</div>
											<div class="form-group">
												<input id="customercode" name="customercode" type="text"
													class="form-control input-sm" placeholder="Mã khách hàng"
													value="${customercode}">
											</div>
											<div class="form-group">
												<button id="searchOrders" class="btn btn-primary btn-sm">
													<i class="fa fa-search"></i>
											</div>
											</button>
										</div>
									</div>
									<div class="fresh-datatables">
										<table id="tableOrders" class="table table-striped"
											width="100%">
											<thead>
												<tr>
													<th>Mã đơn hàng</th>
													<th>Mã đơn vị</th>
													<th>Tên đơn hàng</th>
													<th>Ngày bắt đầu</th>
													<th>Ngày kết thúc</th>
													<th>Trạng thái</th>
													<th>Hành động</th>
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
		<%@include file="includes/FixedPlugin.jsp"%>
		<script>
			$.fn.dataTable.ext.errMode = 'none';
			var tableOrders = $('#tableOrders')
					.on('error.dt', function(e, settings, techNote, message) {
						showAlertError();
					})
					.DataTable(
							{
								"processing" : true,
								"ajax" : {
									"url" : contextPath + "/GetListOrders",
									"dataSrc" : "",
									"data" : function(d) {
										d.ordercode = $('#ordercode').val();
										d.customercode = $('#customercode').val();
									}
								},
								"columns" : [
										{
											"render" : function(data, type,
													full, meta) {
												return '<a role="button" onclick="allInOne(1, 0, '
														+ full.orderid
														+ ');">'
														+ full.ordercode
														+ '</a>';
											}
										},
										{
											"data" : "customer.customercode"
										},
										{
											"data" : "name"
										},
										{
											"render" : function(data, type,
													full, meta) {
												console.log(full);
												var year = full.startdate2.year, month = formatTime(full.startdate2.monthOfYear), day = formatTime(full.startdate2.dayOfMonth);
												return '<span class="hidden">'
														+ year + "/" + month
														+ "/" + day + '</span>'
														+ day + "/" + month
														+ "/" + year;
											}
										},
										{
											"render" : function(data, type,
													full, meta) {
												if (!full.finishdate) {
													return 'Không giới hạn';
												}
												var year = full.finishdate2.year, month = formatTime(full.finishdate2.monthOfYear), day = formatTime(full.finishdate2.dayOfMonth);
												return '<span class="hidden">'
														+ year + "/" + month
														+ "/" + day + '</span>'
														+ day + "/" + month
														+ "/" + year;
											}
										},
										{
											"render" : function(data, type,
													full, meta) {
												var status = full.status;
												if (status == 0)
													return 'Chưa hoàn thành';
												if (status == 1)
													return 'Đã hoàn thành';
											}
										},
										{
											"orderable" : false,
											"render" : function(data, type,
													full, meta) {
												return ''
														+ '<div class="dropdown pull-right">'
														+ '<button class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">'
														+ '<span class="caret"></span>'
														+ '</button>'
														+ '<ul class="dropdown-menu pull-right">'
														+ '<li onclick="allInOne(1, 1, '
														+ full.orderid
														+ ')"><a role="button">'
														+ '<i class="text-warning fa fa-edit"></i> Sửa</a></li>'
														+ '<li onclick="deleteOrder('
														+ full.orderid
														+ ')"><a role="button"><i class="text-danger fa fa-times"></i> Xóa</a></li>'
														+ '</ul>' + '</div>';
											}
										}, ],
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