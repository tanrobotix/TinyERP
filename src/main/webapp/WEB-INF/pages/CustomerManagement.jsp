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
									<li><a href="">Chú ý 1</a></li>
									<li><a href="">Chú ý 2</a></li>
									<li><a href="">Chú ý 3</a></li>
									<li><a href="">Chú ý 4</a></li>
									<li><a href="">Chú ý 5</a></li>
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
												<button onclick="allInOne(0, 1);"
													class="btn btn-success btn-sm">Thêm</button>
											</div>
											<div class="form-group">
												<input id="name" name="name" type="text"
													class="form-control input-sm"
													placeholder="Tìm kiếm theo tên...">
											</div>
											<div class="form-group">
												<button id="searchCustomer" class="btn btn-primary btn-sm">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="fresh-datatables">
										<table id="tableCustomers" class="table table-striped"
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
	</div>
	<%@include file="includes/FixedPlugin.jsp"%>
	<script>
		$.fn.dataTable.ext.errMode = 'none';
		var tableCustomers = $('#tableCustomers')
				.on('error.dt', function(e, settings, techNote, message) {
					showAlertError();
				})
				.DataTable(
						{
							"processing" : true,
							"ajax" : {
								"url" : contextPath + "/GetListCustomers",
								"dataSrc" : "",
								"data" : function(d) {
									d.name = $('#name').val();
								},
								"error" : function() {
									/* switch (jqXHR.status) {
										case 0: 
											showAlertError("Máy chủ không hoạt động");
											break;
										default:
											showAlertError();
											break;
									}  */
									showAlertError();
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
										"orderable" : false,
										"render" : function(data, type, full,
												meta) {
											return ''
													+ '<div class="dropdown pull-right">'
													+ '<button class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">'
													+ '<span class="caret"></span>'
													+ '</button>'
													+ '<ul class="dropdown-menu pull-right">'
													+ '<li onclick="allInOne(0, 1, '
													+ full.customerid
													+ ')"><a role="button">'
													+ '<i class="text-warning fa fa-edit"></i> Sửa</a></li>'
													+ '<li onclick="deleteCustomer('
													+ full.customerid
													+ ')"><a role="button"><i class="text-danger fa fa-times"></i> Xóa</a></li>'
													+ '<li><a href="HistoryCustomer/'
													+ full.customercode
													+ '"><i class="text-muted fa fa-history"></i> Xem lịch sử</a></li>'
													+ '<li onclick="allInOne(2, 1, '
													+ full.customerid
													+ ')"><a role="button"><i class="text-success fa fa-plus"></i> Thêm đơn hàng</a></li>'
													+ '<li><a href="OrderManagement?customercode='
													+ full.customercode
													+ '"><i class="text-info fa fa-list"></i> Xem đơn hàng</a></li>'
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