<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body spellcheck="false">
	<div class="container">
		<fieldset>
			<legend>Quản lý khách hàng</legend>
			<nav class="navbar navbar-default">
				<form class="navbar-form navbar-left"
					action="<c:url value="/CustomerManagement" />" method="get">
					<button type="button" class="btn btn-default btn-sm">Thêm</button>
					<div class="form-group">
						<input name="search" type="text" class="form-control"
							value="${search}">
					</div>
					<button type="submit" class="btn btn-default btn-sm">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</nav>
			<div class="panel panel-info">
				<div class="panel-heading" role="button">Danh sách khách hàng</div>
				<div class="panel-body">
					<table id="tableDSKH" class="table table-striped table-bordered">
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
							<c:forEach items="${listCustomer}" var="c">
								<tr>
									<td><a>${c.code}</a></td>
									<td>${c.name}</td>
									<td>${c.representative}</td>
									<td>${c.address}</td>
									<td>${c.phone}</td>
									<td>${c.website}</td>
									<td>${c.email}</td>
									<td>${c.version}</td>
									<td>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button"
												data-toggle="dropdown">
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-content pull-right">
												<li><a><i class="glyphicon glyphicon-edit"></i> Sửa</a></li>
												<li><a href="#warning" data-toggle="modal"><i
														class="glyphicon glyphicon-remove"></i> Xóa</a></li>
												<li><a><i class="glyphicon glyphicon-plus"></i>
														Thêm đơn hàng</a></li>
												<li><a><i class="glyphicon glyphicon-list-alt"></i>
														Xem đơn hàng</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
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
						<strong>Warning!</strong> Xóa khách hàng sẽ xóa các đơn hàng liên
						kết với khách hàng.<br> <br> <strong>Bạn có
							chắc muốn xóa khách hàng không?</strong><br> <br>
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