//CustomerManagement page
/*$(function() {
 $('#searchCustomers').click(function() {
 var value = $('input[name=name]').val();
 if (value) {
 $('#formSearchCustomers').submit();
 }
 });
 });*/

$(function() {
	$('.deleteCustomer')
			.click(
					function() {
						
						var cid = $(this).val();
						swal(
								{
									title : "Bạn có chắc?",
									text : "Xóa khách hàng sẽ xóa các đơn hàng của khách hàng!",
									type : "warning",
									showCancelButton : true,
									confirmButtonText : "Vâng, xóa nó!",
									cancelButtonText : "Không, hủy!",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										$
												.ajax({
													type : "POST",
													url : 'DeleteCustomer',
													data : {
														cid : cid
													},
													success : function(result) {
														swal(
																{
																	title : "Đã xóa!",
																	text : "Khách hàng đã bị xóa, trang web sẽ reload sau 3s :3",
																	timer : 3000,
																	type : "success",
																	showConfirmButton : false
																},
																function() {
																	location
																			.reload();
																});
													}
												});
									} else {
										swal(
												"Đã hủy",
												"Khách hàng của bạn được an toàn :))",
												"error");
									}
								});
					});
});

// AllInOne page
$(function() {
	var choice = "false";
	$('#CustomerForm').submit(function(e) {
		var upgradeVersion = $('#upgradeVersion');
		if (choice == "true") {
			return true;
		}
		if (upgradeVersion.val() == "false") {
			return true;
		} else {
			e.preventDefault();
			swal({
				title : "Cập nhật khách hàng",
				text : "Bạn muốn cập nhật khách hàng bằng cách nào?",
				type : "info",
				showCancelButton : true,
				confirmButtonText : "Nâng phiên bản!",
				cancelButtonText : "Cập nhật trực tiếp!",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (!isConfirm) {
					$('#upgradeVersion').val('false');
				}
				choice = "true";
				$('#CustomerForm').submit();
			});
		}
	});
});

$(function() {
	$("#required").on('input', function() {
		$.ajax({
			type : "GET",
			url : 'GetSerial',
			data : {
				required : $(this).val()
			},
			success : function(data) {
				$('#serial').val(data);
			}
		});
	});
});

$(function() {
	$("#required").keypress(
			function(event) {
				if ((65 <= event.which && event.which <= 90)
						|| (97 <= event.which && event.which <= 122))
					return;
				if ($(this).val().length != 0 && 48 <= event.which
						&& event.which <= 57)
					return;
				event.preventDefault();

			});
});

$(function() {
	$('#type').on('loaded.bs.select', function() {
		$('#txtType').val($(this).val());
	});
	$('#type').on('changed.bs.select', function() {
		$('#txtType').val($(this).val());
	});

	$('#field').on('loaded.bs.select', function() {
		$('#txtField').val($(this).val());
	});

	$('#field').on('changed.bs.select', function() {
		$('#txtField').val($(this).val());
	});
});

$(function() {
	/*$('.selectpicker.countrycode').on('loaded.bs.select', function() {
		var countrycode = "(+" + $(this).val() + ") ";
		var input = $(this).parents('.input-group').find('input');
		input.val(countrycode);
	});*/

	$('.selectpicker.countrycode').on('changed.bs.select', function() {
		var regex = /\(\+\d+\)\ /g;
		var countrycode = "(+" + $(this).val() + ") ";
		var input = $(this).parents('.input-group').find('input');
		input.val(countrycode + input.val().replace(regex, ""));
		// alert($('button[data-id=spMQG]').parent().find('font').html());
	});
});

$(function() {
	$('input[data-readonly]').focus(function() {
		$(this).blur();
		$("#type").focus();
	});
});

$(function() {
	$('#changeRequest').click(function() {
		$('fieldset').removeAttr('disabled');
		$('#saveCustomer').removeAttr('style');
		$(this).attr('style', 'display: none;');
	});
});

/*
 * $(function() { $('input[type=mytel]').keydown(function(e) { // var l =
 * this.value.length; // var curval = $(this).val(); if (e.which == 8 || 48 >
 * e.which || e.which > 57) return false;
 * 
 * 
 * var curchr = this.value.length; var curval = $(this).val(); if (curchr == 3 &&
 * curval.indexOf("(") <= -1) { $(this).val("(" + curval + ")" + "-"); } else if
 * (curchr == 4 && curval.indexOf("(") > -1) { $(this).val(curval + ")-"); }
 * else if (curchr == 5 && curval.indexOf(")") > -1) { $(this).val(curval +
 * "-"); } else if (curchr == 9) { $(this).val(curval + "-");
 * $(this).attr('maxlength', '14'); }
 * 
 * }); });
 */

// -------------------------------------------------------------------
$(function() {
	$('.ps-scrollbar-y').on('click', function(e) {
		e.stopPropagation();
	});

	$('.selectpicker').selectpicker();

	$.fn.selectpicker_remove_title = function() {
		$(this).next().children().removeAttr('title');
	};
	var $sel = $('.selectpicker').selectpicker();
	$sel.selectpicker_remove_title();
	$sel.change($.fn.selectpicker_remove_title);

	$('.dropdown-menu.inner').perfectScrollbar({
		minScrollbarLength : 40
	});
	$('body').on('shown.bs.dropdown', function() {
		$('.dropdown-menu.inner').perfectScrollbar('update');
	});

	$('.ps-scrollbar-y').on('click', function(e) {
		e.stopPropagation();
	});
});
/*
 * $(function() { $('.selectpicker').selectpicker({ iconBase: 'fa', tickIcon:
 * 'fa-check' }); });
 */
/*
 * $(function() { $('#spMQG').on( 'changed.bs.select', function() { var value =
 * $('button[data-id=spMQG]').find('font').text(); $("#txtDT").val("(" + value + ")
 * "); //alert($('button[data-id=spMQG]').parent().find('font').html()); }); });
 */

$(function() {
	$('.switch-sidebar-mini input').change(
			function() {
				if ($('.switch-sidebar-mini div').hasClass('switch-on')
						&& !$('.switch-sidebar-mini div').hasClass(
								'switch-animate')) {
					$('.switch-sidebar-mini div').removeClass('switch-on')
							.addClass('switch-off switch-animate');
					return;
				}

				if ($('.switch-sidebar-mini div').hasClass('switch-off')
						&& !$('.switch-sidebar-mini div').hasClass(
								'switch-animate')) {
					$('.switch-sidebar-mini div').removeClass('switch-off')
							.addClass('switch-on switch-animate');
					return;
				}
			});
});

$(function() {
	$('#tableDSKH').DataTable({
		responsive : true,
		"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "Tất cả" ] ],
		"columns" : [ {
			"width" : "7%"
		}, null, {
			"width" : "10%"
		}, null, {
			"width" : "15%"
		}, null, null, null, {
			"width" : "5%",
			"orderable" : false
		} ],
		"pagingType" : "full_numbers_no_ellipses",
		searchHighlight : true,
		"language" : {
			"sEmptyTable" : "Không có dữ liệu trong bảng",
			"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
			"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
			"sInfoFiltered" : "(Được lọc từ tổng số _MAX_ mục)",
			"sInfoPostFix" : "",
			"sInfoThousands" : ",",
			"sLengthMenu" : "Xem _MENU_ mục",
			"sLoadingRecords" : "Đang tải...",
			"sProcessing" : "Đang xử lý...",
			"sSearch" : "_INPUT_",
			"searchPlaceholder" : "Tìm kiếm...",
			"sZeroRecords" : "Không tìm thấy kết quả",
			"oPaginate" : {
				"sFirst" : "Đầu",
				"sLast" : "Cuối",
				"sNext" : "Tiếp",
				"sPrevious" : "Trước"
			},
			"oAria" : {
				"sSortAscending" : ": Kích hoạt để sắp xếp cột tăng dần",
				"sSortDescending" : ": Kích hoạt hoạt để sắp xếp cột giảm dần"
			}
		}
	});
	$('#tableDSDH').DataTable({
		"pagingType" : "full_numbers_no_ellipses",
		searchHighlight : true,
		"language" : {
			"sEmptyTable" : "Không có dữ liệu trong bảng",
			"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
			"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
			"sInfoFiltered" : "(Được lọc từ tổng số _MAX_ mục)",
			"sInfoPostFix" : "",
			"sInfoThousands" : ",",
			"sLengthMenu" : "Xem _MENU_ mục",
			"sLoadingRecords" : "Đang tải...",
			"sProcessing" : "Đang xử lý...",
			"sSearch" : "Tìm kiếm:",
			"sZeroRecords" : "Không tìm thấy kết quả",
			"oPaginate" : {
				"sFirst" : "Đầu",
				"sLast" : "Cuối",
				"sNext" : "Tiếp",
				"sPrevious" : "Trước"
			},
			"oAria" : {
				"sSortAscending" : ": Kích hoạt để sắp xếp cột tăng dần",
				"sSortDescending" : ": Kích hoạt hoạt để sắp xếp cột giảm dần"
			}
		}
	});
	$('#tableTKKH').DataTable({
		"language" : {
			"sEmptyTable" : "Không có dữ liệu trong bảng",
			"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
			"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
			"sInfoFiltered" : "(Được lọc từ tổng số _MAX_ mục)",
			"sInfoPostFix" : "",
			"sInfoThousands" : ",",
			"sLengthMenu" : "Xem _MENU_ mục",
			"sLoadingRecords" : "Đang tải...",
			"sProcessing" : "Đang xử lý...",
			"sSearch" : "Tìm kiếm:",
			"sZeroRecords" : "Không tìm thấy kết quả",
			"oPaginate" : {
				"sFirst" : "Đầu",
				"sLast" : "Cuối",
				"sNext" : "Tiếp",
				"sPrevious" : "Trước"
			},
			"oAria" : {
				"sSortAscending" : ": Kích hoạt để sắp xếp cột tăng dần",
				"sSortDescending" : ": Kích hoạt hoạt để sắp xếp cột giảm dần"
			}
		},
		searching : false,
		ordering : false,
		bFilter : false,
		"lengthChange" : false,
		"info" : true,
		"pageLength" : 4
	});
});

/*
 * $(function() { $('#warning').on('shown.bs.modal', function(e) { var id =
 * $(e.relatedTarget).parent().val(); $(this).find('input[name=cid]').val(id);
 * }); });
 */

/*
 * $(function() { $('#txtKHBB').keyup( function() { $('#ccode').val(
 * $("#txtKHBB").val() + $("#txtLHDN").val() + $("#txtLVHD").val() +
 * $("#txtSTT").val()); }); });
 */

/*
 * $(function() { var pos = $('body').scrollTop(); $('.collapse').on(
 * 'shown.bs.collapse', function() { pos = $('body').scrollTop();
 * 
 * $('html, body').animate({ scrollTop : $(this).prev().offset().top - 8 },
 * 350); $(this).prev().find("i").addClass("fa-caret-down").removeClass(
 * "fa-caret-right"); }); $('.collapse').on( 'hidden.bs.collapse', function() {
 * $('html, body').animate({ scrollTop : pos }, 350);
 * $(this).prev().find("i").addClass("fa-caret-right")
 * .removeClass("fa-caret-down"); }); });
 */

$(function() {
	$('#addRow')
			.click(
					function() {
						var selector = $(this).closest('tr');
						var rowCount = $(selector).index() + 1;
						$(selector)
								.before(
										'<tr><td>'
												+ rowCount
												+ '</td><td><input type="text" maxlength="50"></td><td><input type="text" maxlength="50"</td></tr>');
						if (rowCount == 15)
							$(selector).remove();
					});
});

$(function() {
	$('input[data-readonly]').on('invalid', function() {
		return this.setCustomValidity('Không tìm thấy dữ liệu.');
	}).on('input', function() {
		return this.setCustomValidity('');
	});
});

$(function() {
	$('#NKT').change(function() {
		$('#TGHT').attr("min", $(this).val());
	});
});

$(function() {
	$('#TGHT').change(function() {
		$('#NKT').attr("max", $(this).val());
	});
});

$(function() {
	$('#TGHT').change(function() {
		$('#NKT').attr("max", $(this).val());
	});
});

$(function() {
	var formChange = false;
	$("#CustomerForm").change(function() {
		formChange = true;
	});
	$('.back').click(function() {
		if (formChange === true) {
			swal({
				title : "Bạn có chắc?",
				text : "Thông tin khách hàng của bạn sẽ không thay đổi!",
				type : "warning",
				showCancelButton : true,
				confirmButtonText : "Vâng!",
				cancelButtonText : "Hủy!",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					return;
				} else {
					alert("21321321");
				}
			});
		}
	});
});

$(function() {
	$("#txtMST").keypress(function(event) {
		if (48 <= event.which && event.which <= 57)
			return true;
		event.preventDefault();
	});
});

/*
 * function abc() { var length = $('#input-iconic').get(0).files.length; // var
 * arrFile = []; for (var i = 0; i < length; i++) { //
 * arrFile.push($('#input-iconic').get(0).files[i].name); currFile =
 * $('#input-iconic').get(0).files[i].name; alert(currFile); }
 */