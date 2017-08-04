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
													<form:form id="CustomerForm" method="POST"
														modelAttribute="CustomerForm" action="${SaveCustomer}">
														<fieldset disabled>
															<form:input id="cid" path="cid" type="hidden" />
															<form:input path="version" type="hidden" />
															<form:input path="status" type="hidden" />
															<fmt:formatDate value="${CustomerForm.date}" var="date"
																type="both" />
															<form:input path="date" type="hidden" value="${date}" />
															<input id="upgradeVersion" name="upgradeVersion"
																value="${upgradeVersion}" type="hidden" />
															<%-- <input id="typeRequest" type="hidden" value="${typeRequest}" /> --%>


															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Tên đơn vị <span class="text-danger">*</span></label>
																		</div>
																		<div class="col-md-8">
																			<div class="input-group">
																				<form:input path="name" id="name" type="text"
																					class="form-control" placeholder="Tên đơn vị"
																					maxlength="100" required="required" />
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
																					<td><form:input path="required" type="text"
																							id="required" class="form-control"
																							placeholder="Kí hiệu" maxlength="4"
																							required="required" /></td>
																					<td>&nbsp;</td>
																					<td style="cursor: not-allowed"><input
																						id="txtType" type="text" class="form-control"
																						required="required" data-readonly="data-readonly"></td>
																					<td>&nbsp;</td>
																					<td style="cursor: not-allowed"><input
																						id="txtField" type="text" class="form-control"
																						required="required" data-readonly="data-readonly"></td>
																					<td>&nbsp;</td>
																					<fmt:formatNumber pattern="0000"
																						minIntegerDigits="4"
																						value="${CustomerForm.serial}" var="fserial" />
																					<td style="cursor: not-allowed"><form:input
																							path="serial" id="serial" type="text"
																							value="${fserial}" class="form-control"
																							required="required" data-readonly="data-readonly" /></td>
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
																			<form:select path="type.value" id="type"
																				class="selectpicker" data-width="100%">
																				<form:options items="${Types}" itemValue="value"
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
																			<form:select path="field.value" id="field"
																				class="selectpicker" data-width="100%">
																				<form:options items="${Fields}" itemValue="value"
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
																			<label>Địa chỉ</label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="address" type="text"
																				class="form-control" placeholder="Địa chỉ"
																				maxlength="200" />
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
																			<form:input path="representative" type="text"
																				class="form-control" placeholder="Người đại diện"
																				maxlength="100" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Mã số thuế</label>
																		</div>
																		<div class="col-md-8">
																			<form:input path="tax" id="txtMST" type="text"
																				class="form-control" placeholder="Mã số thuế"
																				maxlength="14" />
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
																			<form:input path="title" type="text"
																				class="form-control" placeholder="Chức danh"
																				maxlength="50" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Điện thoại</label>
																		</div>
																		<div class="col-md-8">
																			<div class="input-group">
																				<span class="input-group-btn "> <select
																					class="selectpicker countrycode" data-width="fit"
																					data-size="6">
																						<optgroup>
																							<option value="84"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -968px;'></span> <span class='text'>Việt Nam<small class='text-muted'>+84</small></span>"></option>
																							<option value="81"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -429px;'></span> <span class='text'>Nhật Bản<small class='text-muted'>+81</small></span>"></option>
																							<option value="1"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -44px;'></span> <span class='text'>Hoa Kỳ<small class='text-muted'>+1</small></span>"></option>
																						</optgroup>
																						<optgroup>
																							<c:forEach items="${Countries}" var="country">
																								<option value="${country.countrycode}"
																									data-content="<span class='Ba-Ca-Vd' style='background-position: ${country.lef}px ${country.top}px;'></span> <span class='text'>${country.name}<small class='text-muted'>+${country.countrycode}</small></span>"></option>
																								<%-- <option value="${country.countrycode}"
																								data-icon="&quot;style=&quot;background-position: ${country.lef}px ${country.top}px;"
																								data-subtext="+${country.countrycode}">${country.countryname}</option> --%>
																							</c:forEach>
																						</optgroup>
																				</select>
																				</span>
																				<form:input path="phone"
																					pattern="\(\+[1-9]\d{0,3}\)\s[0-9]{8,16}"
																					class="form-control" placeholder="(+84) 1269071196"
																					maxlength="20" />
																			</div>
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
																			<form:input path="email" type="email"
																				class="form-control" placeholder="abcxyz@mail.com"
																				maxlength="100" />
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Di động</label>
																		</div>
																		<div class="col-md-8">
																			<div class="input-group">
																				<span class="input-group-btn "> <select
																					class="selectpicker countrycode" data-width="fit"
																					data-size="6">
																						<optgroup>
																							<option value="84"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -968px;'></span> <span class='text'>Việt Nam<small class='text-muted'>+84</small></span>"></option>
																							<option value="81"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -429px;'></span> <span class='text'>Nhật Bản<small class='text-muted'>+81</small></span>"></option>
																							<option value="1"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -44px;'></span> <span class='text'>Hoa Kỳ<small class='text-muted'>+1</small></span>"></option>
																						</optgroup>
																						<optgroup>
																							<c:forEach items="${Countries}" var="country">
																								<option value="${country.countrycode}"
																									data-content="<span class='Ba-Ca-Vd' style='background-position: ${country.lef}px ${country.top}px;'></span> <span class='text'>${country.name}<small class='text-muted'>+${country.countrycode}</small></span>"></option>
																							</c:forEach>
																						</optgroup>
																				</select>
																				</span>
																				<form:input path="mobile" type="text"
																					pattern="\(\+[1-9]\d{0,3}\)\s[0-9]{8,16}"
																					class="form-control" placeholder="(+84) 1269071196"
																					maxlength="20" />
																			</div>
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
																			<form:input path="website" type="url"
																				class="form-control" placeholder="https://abc.com"
																				maxlength="100" />

																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<div class="col-md-4 text-right">
																			<label>Fax</label>
																		</div>
																		<div class="col-md-8">
																			<div class="input-group">
																				<span class="input-group-btn"> <select
																					class="selectpicker countrycode" data-width="fit"
																					data-size="6">
																						<optgroup>
																							<option value="84"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -968px;'></span> <span class='text'>Việt Nam<small class='text-muted'>+84</small></span>"></option>
																							<option value="81"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -429px;'></span> <span class='text'>Nhật Bản<small class='text-muted'>+81</small></span>"></option>
																							<option value="1"
																								data-content="<span class='Ba-Ca-Vd' style='background-position: 0px -44px;'></span> <span class='text'>Hoa Kỳ<small class='text-muted'>+1</small></span>"></option>
																						</optgroup>
																						<optgroup>
																							<c:forEach items="${Countries}" var="country">
																								<option value="${country.countrycode}"
																									data-content="<span class='Ba-Ca-Vd' style='background-position: ${country.lef}px ${country.top}px;'></span> <span class='text'>${country.name}<small class='text-muted'>+${country.countrycode}</small></span>"></option>
																							</c:forEach>
																						</optgroup>
																				</select>
																				</span>
																				<form:input path="fax"
																					pattern="\(\+[1-9]\d{0,3}\)\s[0-9]{8,16}"
																					class="form-control" placeholder="(+84) 1269071196"
																					maxlength="20" />
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</fieldset>
														<div class="row">
															<div class="col-md-12 text-center">
																<button id="changeRequest" type="button"
																	class="btn btn-info">Cập nhật thông tin khách
																	hàng</button>
																<button id="submitFormCustomer" type="submit"
																	style="display: none;">Lưu thông tin khách
																	hàng</button>
																<button id="saveCustomer" type="submit"
																	class="btn btn-primary" style="display: none;">Lưu
																	thông tin khách hàng</button>
																<%-- <a href="<c:url value="/CustomerManagement" />" class="btn btn-default" >Trở về
																	</a> --%>
															</div>
														</div>
													</form:form>
													<br>
												</div>
											</div>
										</div>
										<!-- <div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-target="#collapseTwo" role="button"
														data-toggle="collapse" class="collapsed"
														aria-expanded="false"> Thông tin đơn hàng <b
														class="caret"></b>
													</a>
												</h4>
											</div>
											<div id="collapseTwo" class="panel-collapse collapse"
												aria-expanded="false" style="height: 0px;">
												<div class="panel-body">Anim pariatur cliche
													reprehenderit, enim eiusmod high life accusamus terry
													richardson ad squid. 3 wolf moon officia aute, non
													cupidatat skateboard dolor brunch. Food truck quinoa
													nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
													aliqua put a bird on it squid single-origin coffee nulla
													assumenda shoreditch et. Nihil anim keffiyeh helvetica,
													craft beer labore wes anderson cred nesciunt sapiente ea
													proident. Ad vegan excepteur butcher vice lomo. Leggings
													occaecat craft beer farm-to-table, raw denim aesthetic
													synth nesciunt you probably haven't heard of them accusamus
													labore sustainable VHS.</div>
											</div>
										</div> -->
										<!-- <div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-target="#collapseThree" role="button"
														data-toggle="collapse"> Tập tin đính kèm <b
														class="caret"></b>
													</a>
												</h4>
											</div>
											<div id="collapseThree" class="panel-collapse collapse">
												<div class="panel-body">Anim pariatur cliche
													reprehenderit, enim eiusmod high life accusamus terry
													richardson ad squid. 3 wolf moon officia aute, non
													cupidatat skateboard dolor brunch. Food truck quinoa
													nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
													aliqua put a bird on it squid single-origin coffee nulla
													assumenda shoreditch et. Nihil anim keffiyeh helvetica,
													craft beer labore wes anderson cred nesciunt sapiente ea
													proident. Ad vegan excepteur butcher vice lomo. Leggings
													occaecat craft beer farm-to-table, raw denim aesthetic
													synth nesciunt you probably haven't heard of them accusamus
													labore sustainable VHS.</div>
											</div>
										</div> -->
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
		var view = "${view}";
		if (!view) {
			$('fieldset').removeAttr('disabled');
			$('#saveCustomer').removeAttr('style');
			$('#changeRequest').attr('style', 'display: none;');
		}
	</script>
</body>
</html>