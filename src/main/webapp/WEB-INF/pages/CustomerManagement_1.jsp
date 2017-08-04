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

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/myCSS.css" />">
<%-- <link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css" />"> --%>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dataTables.searchHighlight.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/light-bootstrap-dashboard.css" />">

<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/js/angular.min.js" />"></script>
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
<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/light-bootstrap-dashboard.js" />"></script> --%>
<script type="text/javascript"
	src="<c:url value="/resources/js/sweetalert2.js" />"></script>

</head>
<body>
	<div class="container-fluid">
		<fieldset>
			<legend>Quản lý khách hàng</legend>
			<nav class="navbar navbar-default">
				<form class="form-inline"
					action="<c:url value="/CustomerManagement" />" method="GET">
					<a href="<c:url value="/AllInOne" />"
						class="btn btn-success">Thêm</a> <input name="name"
						type="text" class="form-control" value="${name}">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</nav>
			<table id="tableDSKH" class="table table-striped">
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
				<tbody>
					<c:forEach items="${customers}" var="c">
						<tr>
							<td><a>${c.required}${c.type.value}${c.field.value}<fmt:formatNumber pattern="0000" value="${c.serial}" /></a></td>
							<td>${c.name}</td>
							<td>${c.representative}</td>
							<td>${c.address}</td>
							<td>${c.phone}</td>
							<td>${c.website}</td>
							<td>${c.email}</td>
							<td>${c.version}</td>
							<td>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-content">
										<li><a role="button"><i class="fa fa-edit"></i> Sửa</a></li>
										<li value="${c.cid}" class="xoaKH"><a role="button"><i
												class="fa fa-times"></i> Xóa</a></li>
										<li><a role="button"><i class="fa fa-plus"></i> Thêm
												đơn hàng</a></li>
										<li><a role="button"><i class="fa fa-list"></i> Xem
												đơn hàng</a></li>
									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- <tfoot>
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
				</tfoot> -->
			</table>
		</fieldset>
	</div>

	<div id="warning" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<form action="<c:url value="/DeleteCustomer" />" method="POST">
			<input name="cid" type="hidden" value="0" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header modal-header-warning">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h1>
							<i class="fa fa-exclamation-triangle"></i> Warning!
						</h1>
					</div>
					<div class="modal-body">
						<div class="alert alert-warning text-center">
							<strong>Warning!</strong> Xóa khách hàng sẽ xóa các đơn hàng liên
							kết với khách hàng.<br> <br> <strong>Bạn có
								chắc muốn xóa khách hàng không?</strong><br> <br>
						</div>
					</div>
					<div class="modal-footer">
						<div class="text-center">
							<button type="submit" class="btn btn-warning">&nbsp;&nbsp;&nbsp;Có&nbsp;&nbsp;&nbsp;</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Không</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>