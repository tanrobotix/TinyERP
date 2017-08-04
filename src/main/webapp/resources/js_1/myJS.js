$(function() {
	$('#tableDSKH').DataTable({
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
			"sSearch" : "",
			"sZeroRecords" : "Không tìm thấy kết quả",
			"searchPlaceholder" : "Tìm kiếm...",
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

$(function() {
	$('#warning').on('shown.bs.modal', function(e) {
		var id = $(e.relatedTarget).parent().val();
		$(this).find('input[name=cid]').val(id);
	});
});

$(function() {
	$('.xoaKH')
			.click(
					function() {
						var cid = $(this).val();
						swal(
								{
									title : "Bạn có chắc?",
									text : "Xóa khách hàng sẽ xóa các đơn hàng liên kết với khách hàng và không thể khôi phục chúng!",
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
														if (result == "Success")
															swal(
																	"Đã xóa!",
																	"Khách hàng của bạn đã bị xóa :))",
																	"success");
														else
															swal(
																	"Đã hủy",
																	"Khách hàng của bạn được an toàn :3",
																	"error");
													}
												});
									} else {
										swal(
												"Đã hủy",
												"Khách hàng của bạn được an toàn :3",
												"error");
									}
								});
					});
});

$(function() {
	$('#txtKHBB').keyup(
			function() {
				$('#ccode').val(
						$("#txtKHBB").val() + $("#txtLHDN").val()
								+ $("#txtLVHD").val() + $("#txtSTT").val());
			});
});

$(function() {
	$('#LHDN').on('loaded.bs.select', function() {
		$('#txtLHDN').val($(this).val());
	});
	$('#LHDN').on(
			'changed.bs.select',
			function() {
				$('#txtLHDN').val($(this).val());
				$('#ccode').val(
						$("#txtKHBB").val() + $("#txtLHDN").val()
								+ $("#txtLVHD").val() + $("#txtSTT").val());
			});
});

$(function() {
	$('#LVHD').on('loaded.bs.select', function() {
		$('#txtLVHD').val($(this).val());
	});
	$('#LVHD').on(
			'changed.bs.select',
			function() {
				$('#txtLVHD').val($(this).val());
				$('#ccode').val(
						$("#txtKHBB").val() + $("#txtLHDN").val()
								+ $("#txtLVHD").val() + $("#txtSTT").val());
			});
});

$(function() {
	var pos = $('body').scrollTop();
	$('.collapse').on(
			'shown.bs.collapse',
			function() {
				pos = $('body').scrollTop();
				$('html, body').animate({
					scrollTop : $(this).prev().offset().top - 8
				}, 350);
				$(this).prev().find("i").addClass("fa-caret-down").removeClass(
						"fa-caret-right");
			});
	$('.collapse').on(
			'hidden.bs.collapse',
			function() {
				$('html, body').animate({
					scrollTop : pos
				}, 350);
				$(this).prev().find("i").addClass("fa-caret-right")
						.removeClass("fa-caret-down");
			});
});

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
	$('input[data-readonly]').focus(function() {
		$(this).blur();
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
	$("#txtKHBB").keypress(
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
	$("#txtKHBB").keyup(function() {
		$.ajax({
			type : "GET",
			url : 'GetSerial',
			data : {
				required : $(this).val()
			},
			success : function(data) {
				$('#txtSTT').val(data);
			}
		});
	});
});

/*
 * function abc() { var length = $('#input-iconic').get(0).files.length; // var
 * arrFile = []; for (var i = 0; i < length; i++) { //
 * arrFile.push($('#input-iconic').get(0).files[i].name); currFile =
 * $('#input-iconic').get(0).files[i].name; alert(currFile); }
 */