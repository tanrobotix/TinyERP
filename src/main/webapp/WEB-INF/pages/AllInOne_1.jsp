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

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap-select.min.css" />">


<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dataTables.bootstrap.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/fileinput.min.css" />">

<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"></script>
<script src="<c:url value="/resources/js/fileinput.js" />"></script>
<script src="<c:url value="/resources/js/locales/vi.js" />"></script>
<script src="<c:url value="/resources/js/plugins/purify.min.js" />"></script>
<script src="<c:url value="/resources/js/plugins/sortable.min.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/myJS.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/i18n/defaults-vi_VN.js" />"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/myCSS.css" />">


<!--<script>
			$(document).on('click', '.glyphicon-remove', function () {
			$(this).closest('tr').remove();
			return false;
			});
		</script>-->

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/dataTables.bootstrap.min.js" />"></script>
</head>
<body>
	<div class="container-fluid">
		<fieldset>
			<legend>Tiếp nhận thông tin khách hàng</legend>
			<div class="panel panel-info">
				<div class="panel-heading" role="button" data-toggle="collapse"
					data-target="#TTKH">
					<i class="fa fa-lg fa-caret-down"></i> Thông tin khách hàng
				</div>
				<div id="TTKH" class="panel-body collapse in">
					<br>
					<spring:url value="/AddCustomer" var="AddCustomer" />
					<form:form modelAttribute="CustomerForm" action="${AddCustomer}"
						method="POST">
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Tên đơn vị <font color="red">*</font></label>
								</div>
							</div>
							<div class="col-md-4">
								<div class="input-group">
									<form:input path="name" id="name" type="text"
										class="form-control" placeholder="Tên đơn vị" maxlength="100"
										required="required" />
									<span class="input-group-btn">
										<button class="btn btn-success" type="button"
											data-toggle="modal" data-target="#TKKH">
											<i class="fa fa-search" aria-hidden="true"></i>
										</button>
									</span>
								</div>
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Mã đơn vị <font color="red">*</font></label>
								</div>
							</div>

							<div class="col-md-4">
								<table>
									<tr>
										<td><form:input path="required" id="txtKHBB" type="text"
												class="form-control" placeholder="Kí hiệu" maxlength="4"
												required="required" /></td>
										<td>&nbsp;</td>
										<td style="cursor: not-allowed"><input id="txtLHDN"
											type="text" class="form-control" required="required"
											data-readonly="data-readonly"></td>
										<td>&nbsp;</td>
										<td style="cursor: not-allowed"><input id="txtLVHD"
											type="text" class="form-control" required="required"
											data-readonly="data-readonly"></td>
										<td>&nbsp;</td>
										<fmt:formatNumber pattern="0000" minIntegerDigits="4" value="${serial}" var="fserial"/>
										<td style="cursor: not-allowed"><form:input path="serial"
												id="txtSTT" type="text" class="form-control"
												value="${fserial}" required="required"
												data-readonly="data-readonly" /></td>
									</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Loại hình doanh nghiệp</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:select path="type.value" id="LHDN" class="selectpicker"
									data-width="100%">
									<form:options items="${Types}" itemValue="value"
										itemLabel="name" />
								</form:select>
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Lĩnh vực hoạt động</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:select path="field.value" id="LVHD" class="selectpicker"
									data-width="100%">
									<form:options items="${Fields}" itemValue="value"
										itemLabel="name" />
								</form:select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Địa chỉ</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="address" type="text" class="form-control"
									placeholder="Địa chỉ" maxlength="200" />
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Người đại diện</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="representative" type="text"
									class="form-control" placeholder="Người đại diện"
									maxlength="100" />
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Mã số thuế</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="tax" type="text" class="form-control"
									placeholder="Mã số thuế" maxlength="14" />
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Chức danh</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="title" type="text" class="form-control"
									placeholder="Chức danh" maxlength="50" />
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Điện thoại</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="phone" type="tel" class="form-control"
									placeholder="(+84) 988 123 456" maxlength="20" />
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Thư điện tử</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="email" type="email" class="form-control"
									placeholder="abcxyz@mail.com" maxlength="100" />
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Di động</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="mobile" type="text" class="form-control"
									placeholder="(+84) 988 123 456" maxlength="20" />
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<div class="pull-right">
									<label>Trang Web</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="website" type="url" class="form-control"
									placeholder="https://abc.com" maxlength="100" />
							</div>
							<div class="col-md-2">
								<div class="pull-right">
									<label>Fax</label>
								</div>
							</div>
							<div class="col-md-4">
								<form:input path="fax" type="text" class="form-control"
									placeholder="(+84) 988 123 456" maxlength="20" />
							</div>
						</div>
						<br>
						<div class="row">
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Lưu thông
									tin khách hàng</button>
							</div>
						</div>
					</form:form>
					<br>
				</div>
			</div>
			<form>
				<div class="panel panel-info">
					<div class="panel-heading" role="button" data-toggle="collapse"
						data-target="#TTDH">
						<i class="fa fa-lg fa-caret-right"></i> Thông tin đơn hàng
					</div>
					<div id="TTDH" class="panel-body collapse">
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Người tiếp nhận <font color="red">*</font></label>
							</div>
							<div class="col-md-3">
								<div style="cursor: not-allowed">
									<input type="text" class="form-control" value="admin"
										placeholder="Người tiếp nhận" required data-readonly>
								</div>
							</div>
							<div class="col-md-2">
								<label>Ngày khởi tạo <font color="red">*</font></label>
							</div>
							<div class="col-md-3">
								<input id="NKT" type="date" class="form-control" required>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Tên đơn hàng <font color="red">*</font></label>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control"
									placeholder="Tên đơn hàng" required maxlength="100">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<h4>Nội dung yêu cầu</h4>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<textarea class="form-control" rows="6" maxlength="1000"></textarea>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Thời gian hoàn tất</label>
							</div>
							<div class="col-md-3">
								<input id="TGHT" type="date" class="form-control">
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" placeholder="Ghi chú"
									maxlength="100">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Số lượng</label>
							</div>
							<div class="col-md-3">
								<input type="number" min="1" max="9999999999" value="1"
									class="form-control" placeholder="Số lượng">
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control"
									placeholder="Đơn vị tính" maxlength="20">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Yêu cầu thêm</label>
							</div>
							<div class="col-md-8">
								<table id="tableYCT" class="table table-bordered">
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
										<tr>
											<td>1</td>
											<td><input type="text" maxlength="50"></td>
											<td><input type="text" maxlength="50"></td>
										</tr>
										<tr>
											<td>2</td>
											<td><input type="text" maxlength="50"></td>
											<td><input type="text" maxlength="50"></td>
										</tr>
										<tr>
											<td>3</td>
											<td><input type="text" maxlength="50"></td>
											<td><input type="text" maxlength="50"></td>
										</tr>
										<tr>
											<td><span>4</span></td>
											<td><input type="text" maxlength="50"></td>
											<td><input type="text" maxlength="50"></td>
										</tr>
										<tr>
											<td id="addRow" role="button">...</td>
											<td><input readonly></td>
											<td><input readonly></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="panel panel-info">
					<div class="panel-heading" role="button" data-toggle="collapse"
						data-target="#TTDK">
						<i class="fa fa-lg fa-caret-right"></i> Tập tin đính kèm
					</div>
					<div id="TTDK" class="panel-body collapse">
						<br>
						<div class="row">
							<div class="col-md-2">
								<label>Tập tin đính kèm</label>
							</div>
							<div class="col-md-10">
								<input id="input-iconic" name="input-iconic[]" type="file"
									multiple class="file-loading">
								<script>
									$("#input-iconic")
											.fileinput(
													{
														language : "vi",
														uploadUrl : "./",
														uploadAsync : false,
														showUpload : false,
														showRemove : false,
														fileActionSettings : {
															'showZoom' : true,
															'indicatorNew' : '',
															'indicatorNewTitle' : ''
														},
														layoutTemplates : {
															actionUpload : '',
															main1 : '<div class=\'input-group {class}\'>\n'
																	+ '   <div class=\'input-group-btn\'>\n'
																	+ '       {browse}\n'
																	+ '       {upload}\n'
																	+ '       {remove}\n'
																	+ '   </div>\n'
																	+ '   {caption}\n'
																	+ '</div>\n'
																	+ '{preview}'
														},
														overwriteInitial : false,
														initialPreviewAsData : true,
														initialPreviewFileType : 'image',
														preferIconicPreview : true,
														previewFileIconSettings : {
															'doc' : '<i class="fa fa-file-word-o text-primary"></i>',
															'xls' : '<i class="fa fa-file-excel-o text-success"></i>',
															'ppt' : '<i class="fa fa-file-powerpoint-o text-danger"></i>',
															'pdf' : '<i class="fa fa-file-pdf-o text-danger"></i>',
															'zip' : '<i class="fa fa-file-archive-o text-muted"></i>',
															'htm' : '<i class="fa fa-file-code-o text-info"></i>',
															'txt' : '<i class="fa fa-file-text-o text-info"></i>',
															'mov' : '<i class="fa fa-file-movie-o text-warning"></i>',
															'mp3' : '<i class="fa fa-file-audio-o text-warning"></i>',
															'jpg' : '<i class="fa fa-file-photo-o text-danger"></i>',
															'gif' : '<i class="fa fa-file-photo-o text-muted"></i>',
															'png' : '<i class="fa fa-file-photo-o text-primary"></i>'
														},
														previewFileExtSettings : {
															'doc' : function(
																	ext) {
																return ext
																		.match(/(doc|docx)$/i);
															},
															'xls' : function(
																	ext) {
																return ext
																		.match(/(xls|xlsx)$/i);
															},
															'ppt' : function(
																	ext) {
																return ext
																		.match(/(ppt|pptx)$/i);
															},
															'zip' : function(
																	ext) {
																return ext
																		.match(/(zip|rar|tar|gzip|gz|7z)$/i);
															},
															'htm' : function(
																	ext) {
																return ext
																		.match(/(htm|html)$/i);
															},
															'txt' : function(
																	ext) {
																return ext
																		.match(/(txt|ini|csv|java|php|js|css)$/i);
															},
															'mov' : function(
																	ext) {
																return ext
																		.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
															},
															'mp3' : function(
																	ext) {
																return ext
																		.match(/(mp3|wav)$/i);
															},
														}
													})
											.on(
													'filesorted',
													function(e, params) {
														console
																.log(
																		'File sorted params',
																		params);
													})
											.on(
													'fileuploaded',
													function(e, params) {
														console
																.log(
																		'File uploaded params',
																		params);
													});
								</script>
							</div>
						</div>
					</div>
				</div> -->
				<br>
				<div class="row">
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Lưu</button>
						<button type="button" class="btn btn-default">Trở về</button>
					</div>
				</div>
				<br>
			</form>
			<div class="col-md-12">
				<div id="TKKH" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Tìm kiếm khách hàng</h4>
							</div>
							<div class="modal-body">
								<nav class="navbar navbar-default">
									<form class="navbar-form navbar-left">
										<div class="form-group">
											<input type="text" class="form-control input-sm"
												placeholder="Mã khách hàng">
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-sm"
												placeholder="Tên khách hàng">
										</div>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</nav>
								<table id="tableTKKH" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn vị</th>
											<th>Tên</th>
											<th>Địa chỉ</th>
											<th>Điện thoại</th>
											<th>Phiên bản</th>
											<th>Hành động</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a>cFI105</a></td>
											<td>Một thành viên dịch vụ Công ích</td>
											<td>65 Bà Hom, Phường 9, Quận Tản Đà, Hà Nội</td>
											<td>1234</td>
											<td>0</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
										<tr>
											<td><a>cFI105</a></td>
											<td>Một thành viên dịch vụ Công ích</td>
											<td>65 Bà Hom, Phường 9, Quận Tản Đà, Hà Nội</td>
											<td>1</td>
											<td>1</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
										<tr>
											<td><a>cAB106</a></td>
											<td>Một thành viên dịch vụ Công cộng</td>
											<td>27 Nguyễn Trãi, Phường 5, Quận 9, TP.HCM</td>
											<td>012</td>
											<td>0</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
										<tr>
											<td><a>cAB106</a></td>
											<td>Một thành viên dịch vụ Công cộng</td>
											<td>27 Nguyễn Trãi, Phường 5, Quận 9, TP.HCM</td>
											<td>2345</td>
											<td>1</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
										<tr>
											<td><a>cFX107</a></td>
											<td>Một thành viên dịch vụ Công nghệ</td>
											<td>90/5 Trương Định, Phường 1, Quận 3, TP.Vũng Tàu</td>
											<td>9</td>
											<td>0</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
										<tr>
											<td><a>cFX107</a></td>
											<td>Một thành viên dịch vụ Công nghệ</td>
											<td>90/5 Trương Định, Phường 1, Quận 3, TP.Vũng Tàu</td>
											<td>9876</td>
											<td>1</td>
											<td class="text-center"><button class="btn btn-default"
													type="button">Chọn</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<div class="text-center">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Trở về</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
</body>
</html>