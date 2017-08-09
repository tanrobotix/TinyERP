<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý đơn hàng</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/myCSS.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dataTables.searchHighlight.css" />">

<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/myJS.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/dataTables.bootstrap.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.highlight.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/dataTables.searchHighlight.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/full_numbers_no_ellipses.js" />"></script>
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>Quản lý đơn hàng</legend>
			<nav class="navbar navbar-default">
				<form class="navbar-form navbar-left"
					action="<c:url value="/OrderManagement" />" method="GET">
					<button type="button" class="btn btn-default btn-sm">Thêm</button>
					<div class="form-group">
						<input name="oid" type="text" class="form-control"
							placeholder="Mã đơn hàng" value="${oid}">
					</div>
					<div class="form-group">
						<input name="ccode" type="text" class="form-control"
							placeholder="Mã khách hàng" value="${ccode}">
					</div>
					<button type="submit" class="btn btn-default">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</form>
			</nav>
			<!--<div class="panel panel-info">
					<div class="panel-heading" id="titleTTKH" role="button" data-toggle="collapse" data-target="#TTKH">
						<span>
							<i class="fa fa-sort-asc" aria-hidden="true"></i> Thông tin khách hàng
						</span>
					</div>	
					<div id="TTKH" class="panel-body collapse">
						<br>
						<form method="post">
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Tên đơn vị <font color="red">*</font></label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="Công ty cổ phần HH" disabled>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Mã đơn vị <font color="red">*</font></label>
									</div>
								</div>
								<div class="col-sm-4">
									<table>
										<tr>
											<td><input type="text" class="form-control" value="HH" disabled></td>
											<td>&nbsp;</td>
											<td style="cursor:not-allowed"><input id="txtLHDN" type="text" class="form-control" value="VC" disabled></td>
											<td>&nbsp;</td>
											<td style="cursor:not-allowed"><input id="txtLVHD" type="text" class="form-control" value="6" disabled></td>
											<td>&nbsp;</td>
											<td style="cursor:not-allowed"><input id="txtSTT" type="text" class="form-control" value="01" disabled></td>
										</tr>	
									</table>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Loại hình doanh nghiệp</label>
									</div>
								</div>
								<div class="col-sm-4">
									<td><input type="text" class="form-control" value="Công ty cổ phần" disabled></td>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Lĩnh vực hoạt động</label>
									</div>
								</div>
								<div class="col-sm-4">
									<td><input type="text" class="form-control" value="Phát triển sản phẩm mới" disabled></td>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Địa chỉ</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="Tòa nhà HH, phố HH, quận HH, TP.HCM, Việt Nam" disabled> 
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Phiên bản</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="tel" class="form-control" value="0" disabled>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Người đại diện</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="Đặng Hoàng Huy" disabled>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Mã số thuế</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="1234567898765" disabled>
								</div>
							</div>
							<br>	
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Chức danh</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="Chủ tịch Hội Đồng Quản Trị" disabled>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Điện thoại</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="tel" class="form-control" value="(+84) 1 269 071 196" disabled>
								</div>
							</div>
							<br>	
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Thư điện tử</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="tel" class="form-control" value="(+84) 1 269 071 196" disabled>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Di động</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="tel" class="form-control" value="(+84) 1 269 071 196" disabled>
								</div>
							</div>
							<br>	
							<div class="row">
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Trang Web</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="url" class="form-control" value="https://hh.com" disabled>
								</div>
								<div class="col-sm-2">
									<div class="pull-right">
										<label>Fax</label>
									</div>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" value="(+84) 1 269 071 196" disabled>
								</div>
							</div>
							<br>
						</form>
						<br>
					</div>
				</div>-->
			<div class="panel panel-info">
				<div class="panel-heading" role="button">Danh sách đơn hàng</div>
				<div class="panel-body">
					<table id="tableDSDH" class="table table-striped table-bordered">
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
						<tbody>
							<c:forEach items="${orders}" var="o">
								<fmt:formatDate value="${o.sdate}" var="sdate" type="date"
									pattern="dd-MM-yyyy" />
								<fmt:formatDate value="${o.fdate}" var="fdate" type="date"
									pattern="dd-MM-yyyy" />
								<tr>
									<td><a>${o.oid}</a></td>
									<td>${o.oid}</td>
									<td>${o.name}</td>
									<td><span class="hidden">${o.sdate}</span>${sdate}</td>
									<td><span class="hidden">${o.fdate}</span>${fdate}</td>
									<td><c:out
											value="${o.status ? 'Đã hoàn thành' : 'Chưa hoàn thành' }" />
									</td>
									<td>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button"
												data-toggle="dropdown">
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-content pull-right">
												<li><a><i class="glyphicon glyphicon-edit"></i> Sửa</a></li>
												<li><a><i class="glyphicon glyphicon-remove"></i>
														Xóa</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!--<div class="row">
					<div class="text-center">
						<button type="button" class="btn btn-default">Trở về</button>
					</div>
				</div>-->
		</fieldset>
	</div>
	<div class="modal fade" id="warning" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-warning">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h1>
						<i class="glyphicon glyphicon-warning-sign"></i> Warning!
					</h1>
				</div>
				<div class="modal-body">
					<div class="alert alert-warning text-center">
						<strong>Warning!<br> <br>Bạn có chắc muốn xóa
							đơn hàng không?
						</strong><br> <br>
					</div>
				</div>
				<div class="modal-footer">
					<div class="text-center">
						<button type="button" class="btn btn-warning" data-dismiss="modal">&nbsp;&nbsp;&nbsp;Có&nbsp;&nbsp;&nbsp;</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>