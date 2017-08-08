<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tiếp nhận thông tin đơn hàng</title>
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
						<a class="navbar-brand" href="">Tiếp nhận thông tin khách hàng</a>
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
									<div class="panel-group" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-target="#collapseOne" role="button"
														data-toggle="collapse" aria-expanded="true"> Thông tin
														khách hàng <b class="caret"></b>
													</a>
												</h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in"
												aria-expanded="true">
												<div class="panel-body">
													<spring:url value="/SaveCustomer" var="SaveCustomer" />
													<form:form action="${SaveCustomer}" method="POST"
														modelAttribute="CustomerForm">
														<form:input id="customerid" path="customerid"
															type="hidden" />
														<form:input id="version" path="version" type="hidden" />
														<form:input id="status" path="status" type="hidden" />
														<form:input id="serial" path="serial" type="hidden" />
														<form:input id="datecreated" path="datecreated"
															type="hidden" />
														<form:input id="lastupdate" path="lastupdate"
															type="hidden" />
														<form:input id="sizeOrders" path="sizeOrders"
															type="hidden" />
														<fieldset>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Tên đơn vị <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<div class="input-group">
																				<form:input id="name" path="name" type="text"
																					class="form-control" placeholder="Tên đơn vị"
																					maxlength="100" required="required"
																					pattern="[^\-^_^'&quot;~`!@#$%&*()+={}:,;./?/><\\\|\][]+"
																					title="Tên đơn vị không được chứa các ký tự ~`!@#$%^&*()_-+={[}]\|&quot;':;<,>.?/" />
																				<span class="input-group-btn ">
																					<button type="button" class="btn btn-success"
																						data-toggle="modal" data-target="#tableCustomers">
																						<i class="fa fa-search" aria-hidden="true"></i>
																					</button>
																				</span>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Mã đơn vị <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<table>
																				<tr>
																					<td><form:input id="symbol" path="symbol"
																							type="text" class="form-control"
																							placeholder="Kí hiệu" maxlength="4"
																							required="required" /></td>
																					<td>&nbsp;</td>
																					<!-- data-readonly="data-readonly" -->
																					<td><input id="txtType" type="text"
																						class="form-control" required="required"
																						disabled="disabled"></td>
																					<td>&nbsp;</td>
																					<td><input id="txtField" type="text"
																						class="form-control" required="required"
																						disabled="disabled"></td>
																					<td>&nbsp;</td>
																					<td><input id="fserial" type="text"
																						required="required" class="form-control"
																						disabled="disabled"></td>
																				</tr>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Loại hình doanh nghiệp</label>
																		</div>
																		<div class="col-md-8">
																			<form:select id="type" path="type.typeid"
																				class="selectpicker" data-width="100%">
																				<%-- <form:options items="${Types}" itemValue="typeid"
																					itemLabel="name"/> --%>
																				<c:forEach items="${Types}" var="t">
																					<form:option value="${t.typeid}" show="${t.value}">${t.name}</form:option>
																				</c:forEach>
																			</form:select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Lĩnh vực hoạt động</label>
																		</div>
																		<div class="col-md-8">
																			<form:select id="field" path="field.fieldid"
																				show="field.value" class="selectpicker"
																				data-width="100%">
																				<%-- <form:options items="${Fields}" itemValue="fieldid"
																					itemLabel="name"/> --%>
																				<c:forEach items="${Fields}" var="f">
																					<form:option value="${f.fieldid}" show="${f.value}">${f.name}</form:option>
																				</c:forEach>
																			</form:select>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Địa chỉ</label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="address" path="address"
																				maxlength="200" type="text" class="form-control"
																				placeholder="Địa chỉ" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Người đại diện</label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="representatives" maxlength="100"
																				type="text" class="form-control"
																				placeholder="Người đại diện" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Mã số thuế</label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="tax" path="tax" maxlength="14"
																				type="text" class="form-control"
																				placeholder="Mã số thuế" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Chức danh</label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="title" path="title" type="text"
																				maxlength="50" class="form-control"
																				placeholder="Chức danh" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Điện thoại</label>
																		</div>
																		<div class="col-md-8">
																			<%-- pattern="\(\+[1-9]\d{0,3}\)[0-9]{8,16}" --%>
																			<form:input id="phone" path="phone" maxlength="20"
																				placeholder="(+84)1269071196 hoặc 01269071196"
																				class="form-control" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Thư điện tử</label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="email" path="email" type="email"
																				class="form-control"
																				placeholder="14520359@gm.uit.edu.vn" maxlength="100" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Di động</label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="mobile" type="text"
																				placeholder="(+84)1269071196 hoặc 01269071196"
																				maxlength="20" class="form-control" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Trang Web</label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="website" path="website" type="url"
																				maxlength="100" class="form-control"
																				placeholder="https://hh.com" />

																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Fax</label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="fax"
																				placeholder="(+84)1269071196 hoặc 01269071196"
																				maxlength="20" class="form-control" />

																		</div>
																	</div>
																</div>
															</div>
														</fieldset>
														<div class="row">
															<div class="col-md-12 text-center">
																<!-- <button id="changeRequest" type="button"
																	class="btn btn-info">Cập nhật thông tin khách
																	hàng</button> -->
																<!-- <button id="submitFormCustomer" type="submit"
																	style="display: none;">Lưu thông tin khách
																	hàng</button> -->
																<button id="saveCustomer" type="submit"
																	class="btn btn-primary">
																	<i class="fa fa-save"></i>Lưu thông tin khách hàng
																</button>
																<%-- <a href="<c:url value="/CustomerManagement" />" class="btn btn-default" >Trở về
																	</a> --%>
															</div>
														</div>
													</form:form>
													<br>
												</div>
											</div>
										</div>
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
	<script
		src="<c:url value="/resources/js/jquery.form-validator.min.js" />"></script>
	<script>
		var initValueSymbol = "${CustomerForm.symbol}";
		var initValueSerial = "${CustomerForm.serial}";
		changeValueFserial(initValueSerial);
		//$('#fserial').val(formatSerial(initValueSerial));
		/* var view = "${view}";
		if (!view) {
			$('fieldset').removeAttr('disabled');
			$('#saveCustomer').removeAttr('style');
			$('#changeRequest').attr('style', 'display: none;');
		} */
	</script>
</body>
</html>