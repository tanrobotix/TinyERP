<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
													<form:form id="customerForm" method="POST"
														modelAttribute="customerForm">
														<fieldset disabled>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Tên đơn vị <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<!-- <div class="input-group"> -->
																			<form:input id="name" path="name" type="text"
																				class="form-control" placeholder="Tên đơn vị"
																				maxlength="100" required="required"
																				pattern="[^\-^_^'&quot;~`!@#$%&*()+={}:,.;/?/><\\\|\][]+"
																				title="Tên đơn vị không được chứa các ký tự ~`!@#$%^&*()_-+={[}]\|&quot;':;<,>?/" />
																			<!-- <span class="input-group-btn ">
																						<button type="button" class="btn btn-success"
																							data-toggle="modal" data-target="#tableCustomers">
																							<i class="fa fa-search" aria-hidden="true"></i>
																						</button>
																					</span> -->
																			<!-- </div> -->
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
																							pattern="[a-zA-z][0-9a-zA-Z]+|[a-zA-z]"
																							title="Ký tự đầu tiên: a->z, A->Z. Ký tự 2->4 có thể có hoặc không: a->z, A->Z, 0->9"
																							required="required" /></td>
																					<td>&nbsp;</td>
																					<td style="cursor: not-allowed;"><input
																						id="txtType" type="text" class="form-control"
																						required="required" data-readonly="data-readonly"></td>
																					<td>&nbsp;</td>
																					<td style="cursor: not-allowed;"><input
																						id="txtField" type="text" class="form-control"
																						required="required" data-readonly="data-readonly"></td>
																					<td>&nbsp;</td>
																					<td style="cursor: not-allowed;"><form:input
																							id="serial" path="serial" type="text"
																							reuired="required" class="form-control"
																							data-readonly="data-readonly" /></td>
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
																				<form:options items="${Types}" itemValue="typeid"
																					itemLabel="name" />
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
																				class="selectpicker" data-width="100%">
																				<form:options items="${Fields}" itemValue="fieldid"
																					itemLabel="name" />
																			</form:select>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Địa chỉ <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="address" path="address"
																				required="required"
																				pattern="[^\-^_^'&quot;~`!@#$%&*()+={}:;?><\\|\][]+"
																				title="Địa chỉ không được chứa các ký tự ~`!@#$%^&*()_-+={[}]\|&quot;':;<,>?"
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
																			<label>Người đại diện <span
																				class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="representatives" maxlength="100"
																				required="required"
																				pattern="[^\-^_^'&quot;~`!@#$%&*()+={}:,.;/?/><\\\|\][]+"
																				title="Người đại diện không được chứa các ký tự ~`!@#$%^&*()_-+={[}]\|&quot;':.;<,>?/"
																				type="text" class="form-control"
																				placeholder="Người đại diện" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Mã số thuế <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="tax" path="tax" minlength="10"
																				maxlength="13" pattern="\d+" required="required"
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
																			<label>Chức danh <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="title" path="title" type="text"
																				required="required" maxlength="50"
																				class="form-control" placeholder="Chức danh" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Điện thoại <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="phone" path="phone" maxlength="20"
																				required="required"
																				pattern="(\(\+[1-9]\d{0,3}\)[0-9]{4,16})|0[0-9]{9,10}"
																				title="Ví dụ: (+84)1269071196 hoặc 01269071196"
																				placeholder="Số điện thoại" class="form-control" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Thư điện tử <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<form:input id="email" path="email" type="email"
																				class="form-control" required="required"
																				placeholder="Email" maxlength="100" />
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
																				pattern="(\(\+[1-9]\d{0,3}\)[0-9]{4,16})|0[0-9]{9,10}"
																				title="Ví dụ: (+84)1269071196 hoặc 01269071196"
																				placeholder="Di động" maxlength="20"
																				class="form-control" />
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
																				placeholder="Trang Web" />

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
																				pattern="(\(\+[1-9]\d{0,3}\)[0-9]{4,16})|0[0-9]{9,10}"
																				title="Ví dụ: (+84)1269071196 hoặc 01269071196"
																				placeholder="Fax" maxlength="20"
																				class="form-control" />

																		</div>
																	</div>
																</div>
															</div>
														</fieldset>
														<div class="row">
															<div class="col-md-12 text-center">
																<a class="changeMode btn btn-info">Cập nhật thông
																	tin khách hàng</a>
																<button id="saveCustomer" type="submit"
																	class="btn btn-info save" style="display: none;">
																	Lưu thông tin khách hàng</button>
															</div>
														</div>
													</form:form>
												</div>
											</div>
										</div>
										<c:if test="${request == 1 || request == 2}">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a data-target="#collapseTwo" href="#"
															data-toggle="collapse"> Thông tin đơn hàng <b
															class="caret"></b>
														</a>
													</h4>
												</div>
												<div id="collapseTwo" class="panel-collapse collapse in">
													<div class="panel-body">
														<form:form id="orderForm" method="POST"
															modelAttribute="orderForm" enctype="multipart/form-data">
															<fieldset disabled>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Người tiếp nhận <font
																					class="text-danger">*</font></label>
																			</div>
																			<div class="col-md-8">
																				<div style="cursor: not-allowed">
																					<input type="text" class="form-control"
																						value="admin" placeholder="Người tiếp nhận"
																						required="required" data-readonly="data-readonly">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Ngày khởi tạo <font
																					class="text-danger">*</font></label>
																			</div>
																			<div class="col-md-8">
																				<form:input id="startdate" path="startdate"
																					class="form-control" required="required"
																					placeholder="dd/mm/yyyy" />
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Tên đơn hàng <font
																					class="text-danger">*</font></label>
																			</div>
																			<div class="col-md-8">
																				<form:input type="text" path="name"
																					class="form-control" placeholder="Tên đơn hàng"
																					required="required" maxlength="100" />
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Nội dung yêu cầu</label>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<div class="col-md-12">
																				<form:textarea path="content" style="resize: none;"
																					class="form-control" rows="5" maxlength="1000" />
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Thời gian hoàn tất</label>
																			</div>
																			<div class="col-md-8">
																				<form:input id="finishdate" path="finishdate"
																					type="text" class="form-control"
																					placeholder="dd/mm/yyyy" />
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-12">
																				<form:input path="note" type="text"
																					class="form-control" placeholder="Ghi chú"
																					maxlength="100" />
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-4 text-right">
																				<label>Số lượng</label>
																			</div>
																			<div class="col-md-8">
																				<form:input path="number" type="number" min="1"
																					max="9999999999" class="form-control"
																					placeholder="Số lượng" />
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="col-md-12">
																				<form:input path="unit" type="text"
																					class="form-control" placeholder="Đơn vị tính"
																					maxlength="20" />
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<div class="col-md-2 text-right">
																				<label>Yêu cầu thêm</label>
																			</div>
																			<div class="col-md-10">
																				<table id="tableRequirements"
																					class="table table-bordered">
																					<colgroup>
																						<col bgcolor="#eee" />
																					</colgroup>
																					<thead align="center">
																						<tr bgcolor="#eee">
																							<td class="col-md-1"></td>
																							<td class="col-md-5">Thuộc tính</td>
																							<td class="col-md-5">Giá trị</td>
																						</tr>
																					</thead>
																					<tbody>
																						<c:set var="length"
																							value="${fn:length(orderForm.requirements)}" />
																						<c:forEach items="${orderForm.requirements}"
																							var="requirement" varStatus="no">
																							<tr>
																								<td>${no.count}</td>
																								<td><input
																									name="requirements[${no.index}].properties"
																									type="text" maxlength="50"
																									value="${requirement.properties}"></td>
																								<td><input
																									name="requirements[${no.index}].value"
																									type="text" maxlength="50"
																									value="${requirement.value}"></td>
																							</tr>
																						</c:forEach>
																						<%-- <c:choose>
																							<c:when test="${length == 0}">
																								<c:forEach var="i" begin="0" end="9">
																									<tr>
																										<td>${i+1}</td>
																										<td><input
																											name="requirements[${i}].properties"
																											type="text" maxlength="50" value=""></td>
																										<td><input
																											name="requirements[${i}].value" type="text"
																											maxlength="50" value=""></td>
																										<td hidden><input
																											name="requirements[${i}].order.orderid"
																											type="text" maxlength="50"
																											value="${orderForm.orderid}"></td>
																									</tr>
																								</c:forEach>
																							</c:when>
																							<c:otherwise>
																								<c:forEach items="${orderForm.requirements}"
																									var="requirement" varStatus="no">
																									<tr>
																										<td>${no.count}</td>
																										<td><input
																											name="requirements[${no.index}].properties"
																											type="text" maxlength="50"
																											value="${requirement.properties}"></td>
																										<td><input
																											name="requirements[${no.index}].value"
																											type="text" maxlength="50"
																											value="${requirement.value}"></td>
																									</tr>
																								</c:forEach>
																							</c:otherwise>
																						</c:choose> --%>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</div>
																</div>
															</fieldset>
															<div class="row">
																<div class="col-md-12 text-center">
																	<a class="changeMode btn btn-info">Cập nhật thông
																		tin đơn hàng</a>
																	<button id="saveOrder" type="submit"
																		class="btn btn-info save" style="display: none;">
																		Lưu thông tin đơn hàng</button>
																</div>
															</div>
														</form:form>
													</div>
												</div>
											</div>
										</c:if>
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
		var initValueSymbol = "${customerForm.symbol}", initValueType = "${customerForm.type.typeid}", initValueField = "${customerForm.field.fieldid}", initValueSerial = formatSerial("${customerForm.serial}"), hasOrders = "${fn:length(customerForm.orders) > 0}";
		var dataCustomerForm;
		$('#serial').val(initValueSerial);
		changeMode("${mode}");
	</script>
</body>
</html>