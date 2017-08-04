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
						<a class="navbar-brand" href="">${title}</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
									class="notification">2</span>
									<p class="hidden-md hidden-lg">
										Thông báo <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="">Huy đại ka</a></li>
									<li><a href="">Tân óc chó</a></li>
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
												<a href="<c:url value="AllInOne" />" class="btn btn-success btn-sm">Thêm</a>
											</div>
											<form id="formSearchCustomers" class="form-group"
												action="<c:url value="/CustomerManagement" />" method="GET">
												<div class="input-group input-group-sm">
													<input name="name" type="text" class="form-control"
														placeholder="Tìm kiếm..." value="${name}"> <span
														class="input-group-btn">
														<button id="searchCustomers" type="submit" class="btn btn-primary">
															<i class="fa fa-search"></i>
														</button>
													</span>
												</div>
											</form>
										</div>
									</div>
									<div class="fresh-datatables">
										<table id="tableDSKH" class="table table-striped" width="100%">
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
														<td><a href="<c:url value="AllInOne?cid=${c.cid}&view=1" />">${c.required}${c.type.value}${c.field.value}<fmt:formatNumber
																	pattern="0000" value="${c.serial}" /></a></td>
														<td>${c.name}</td>
														<td>${c.representative}</td>
														<td>${c.address}</td>
														<td>${c.phone}</td>
														<td>${c.website}</td>
														<td>${c.email}</td>
														<td>${c.version}</td>
														<td>
															<div class="dropdown pull-right">
																<button class="btn btn-default btn-sm dropdown-toggle"
																	data-toggle="dropdown">
																	<span class="caret"></span>
																</button>
																<ul class="dropdown-menu pull-right">
																	<li><a href="AllInOne?cid=${c.cid}"> <i
																			class="text-warning fa fa-edit"></i> Sửa
																	</a></li>
																	<li class="deleteCustomer" value="${c.cid}"><a
																		role="button"><i class="text-danger fa fa-times"></i>
																			Xóa</a></li>
																	<li><a href="HistoryCustomer?required=${c.required}&serial=${c.serial}"><i
																			class="text-primary fa fa-history"></i> Xem lịch sử</a></li>
																	<li><a role="button"><i
																			class="text-success fa fa-plus"></i> Thêm đơn hàng</a></li>
																	<li><a role="button"><i
																			class="text-info fa fa-list"></i> Xem đơn hàng</a></li>
																	
																</ul>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
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
</body>
</html>