$(function() {
/*	$('#tableDSDH').DataTable({
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
	});*/
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
// CustomerManagement page
/*
 * $(function() { $('#searchCustomers').click(function() { var value =
 * $('input[name=name]').val(); if (value) { $('#formSearchCustomers').submit(); }
 * }); });
 */

/*
 * $(function() { $('.deleteCustomer') .click( function() { alert("1"); var cid =
 * $(this).val();
 * 
 * swal( { title : "Bạn có chắc?", text : "Xóa khách hàng sẽ xóa các đơn hàng
 * của khách hàng!", type : "warning", showCancelButton : true,
 * confirmButtonText : "Vâng, xóa nó!", cancelButtonText : "Không, hủy!",
 * closeOnConfirm : false, closeOnCancel : false }, function(isConfirm) { if
 * (isConfirm) { $ .ajax({ type : "POST", url : 'DeleteCustomer', data : { cid :
 * cid }, success : function(result) { swal( { title : "Đã xóa!", text : "Khách
 * hàng đã bị xóa, trang web sẽ reload sau 3s :3", timer : 3000, type :
 * "success", showConfirmButton : false }, function() { location .reload(); }); }
 * }); } else { swal( "Đã hủy", "Khách hàng của bạn được an toàn :))", "error"); }
 * }); }); });
 */

/*
 * function deleteCustomer(cid) {
 * 
 * swal( { title : "Bạn có chắc?", text : "Xóa khách hàng sẽ xóa các đơn hàng
 * của khách hàng!", type : "warning", showCancelButton : true,
 * confirmButtonText : "Vâng, xóa nó!", cancelButtonText : "Không, hủy!", },
 * function(isConfirm) { if (isConfirm) { $ .ajax({ type : "POST", url :
 * 'DeleteCustomer', data : { cid : cid }, success : function(result) { swal( {
 * title : "Đã xóa!", text : "Khách hàng đã bị xóa, trang web sẽ reload sau 3s
 * :3", timer : 3000, type : "success", showConfirmButton : false }, function() {
 * location.reload(); }); } }); } else { swal("Đã hủy", "Khách hàng của bạn được
 * an toàn :))", "error"); } }); }
 */
/*
 * $(function() { $('#revese-countdown') .prop('number', 3) .animateNumber( {
 * number: 0, numberStep: function(now, tween) { var target = $(tween.elem),
 * rounded_now = Math.round(now);
 * 
 * target.text(now === tween.end ? 'Launch!' : rounded_now); } }, 10000,
 * 'linear' ); });
 */


/*
 * function deleteCustomer(customerid) { swal( { title : "Bạn có chắc?", text :
 * "Xóa thông tin khách hàng sẽ xóa thông tin các đơn hàng của khách hàng :3!",
 * type : "warning", showCancelButton : true, confirmButtonText : "Vâng, xóa nó! ",
 * cancelButtonText : "Không, hủy xóa!", showLoaderOnConfirm : true, preConfirm :
 * function(cid) { return new Promise(function(resolve) { setTimeout(function() {
 * var request = $.ajax({ type : "POST", url : contextPath + '/DeleteCustomer',
 * data : { customerid : customerid } }); request.done(function() { resolve();
 * }); request.fail(function() { swal({ type : 'error', title : 'Oops!', text:
 * 'Đã xảy ra sự cố...' }).catch(swal.noop) }); }, 2000) }) } }).then(function() {
 * var reloadInSeconds = 3; swal({ type : 'success', html: 'Trang web sẽ tự động
 * reload sau <span class="text-danger reverse-countdown">' + reloadInSeconds + '</span>
 * giây :3.', title : 'Xóa thành công!', showCloseButton : false,
 * confirmButtonText : 'Reload', timer: reloadInSeconds*1000 + 100,
 * }).then(function () { location.reload(); }, function (dismiss) { if (dismiss
 * === 'timer') { location.reload(); } }) setInterval(function() {
 * $('.reverse-countdown').html(--reloadInSeconds); }, 1000);
 * 
 * }).catch(swal.noop) }
 */

$(function() {
	$('#searchCustomer').click(function() {
		tableCustomers.ajax.reload();
	});
});

function formatSerial(serial) {
	serial = '' + serial;
    var strFormatSerial = "0000" + serial;
    strFormatSerial = strFormatSerial.substring(serial.length);
    return strFormatSerial;
}

function formatTime(time) {
	time = '' + time;
    var strFormatTime = "00" + time;
    strFormatTime = strFormatTime.substring(time.length);
    return strFormatTime;
}

function showAlertError(text='Đã xảy ra lỗi...', title='Oops!') {
	swal({
		type : 'error',
		title : title,
		text: text
	}).catch(swal.noop)
}

function getInfoCustomer(customerid) {
	var ajax = $.ajax({
		type : "GET",
		url : contextPath + '/GetInfoCustomer',
		type : "json",
		data : {
			"customerid" : customerid
		}
	});
	ajax.done(function(data) {
		console.log(data);
	});
}

function deleteCustomer(customerid) {
	swal(
			{
				title : "Bạn có chắc?",
				text : "Xóa thông tin khách hàng sẽ xóa thông tin các đơn hàng của khách hàng :3 !",
				type : "warning",
				showCancelButton : true,
				confirmButtonText : "Vâng, xóa nó! ",
				cancelButtonText : "Không, hủy xóa!",
				showLoaderOnConfirm : true,
				preConfirm : function() {
					return new Promise(function(resolve) {
						setTimeout(function() {
						 var ajax = $.ajax({
							type : "POST",
							url : contextPath + '/DeleteCustomer',
							data : {
								"customerid" : customerid
							}
						});
						 	ajax.done(function() {
								resolve();
							});
						 	ajax.fail(function() {
								showAlertError();
							});
						}, 2000)
					})
				}
			}).then(function() {
				/* var reloadInSeconds = 3; */
		swal({
			type : 'success',
			/*
			 * html: 'Thông báo sẽ tự động đóng sau <span class="text-danger
			 * reverse-countdown">' + reloadInSeconds + '</span> giây :3.',
			 */
			text : 'Xóa thông tin khách hàng thành công :3 !',
			title : 'Xóa thành công!',
			/* timer: reloadInSeconds*1000 + 100, */
		}).then(function () {
			tableCustomers.ajax.reload();
		})/*
			 * , function (dismiss) { if (dismiss === 'timer') { } })
			 * setInterval(function() {
			 * $('.reverse-countdown').html(--reloadInSeconds); }, 1000);
			 */
				  
	}).catch(swal.noop)
}

// AllInOne page
$(function() {
	var confirm = false;
	$('#CustomerForm').submit(function(e) {
		if (confirm == true)
			return true;
		var sizeOrders = $('#sizeOrders');
		if (sizeOrders.val() == 0) {
			return true;
		}
		else {	
			e.preventDefault();
			var symbol = $('#symbol');
			var type = $('#type');
			var field = $('#field');
			if (initValueSymbol != symbol.val() || initValueType != type.val() || initValueField != field.val()) {
				swal(
						{
							title : "Bạn có chắc?",
							text : "Thông tin đơn hàng sẽ đặt lại!",
							type : "warning",
							confirmButtonText : "Vâng",
							cancelButtonText : "Không",
							showCancelButton : true,
						}).then(function() {
							$('#customerid').val(null);
							confirm = true;
							$('#CustomerForm').submit();
				}).catch(swal.noop)
			} else {
				swal(
						{
							title : "Cập nhật khách hàng",
							text : "Bạn muốn cập nhật khách hàng bằng cách nào?",
							type : "question",
							confirmButtonText : "Nâng phiên bản!",
							cancelButtonText : "Cập nhật trực tiếp!",
							showCancelButton : true,
						}).then(function() {
							$('#customerid').val(null);
							var valueVersion = Number($('#version').val()) + 1;
							$('#version').val(valueVersion);
							confirm = true;
							$('#CustomerForm').submit();
				}, function (dismiss) {
				    if (dismiss === 'cancel') {
							confirm = true;
							$('#CustomerForm').submit();
				      }
				    }).catch(swal.noop)
			}
			
			/* * swal({ title : "Cập nhật khách hàng", text : "Bạn muốn cập nhật
			 * khách hàng bằng cách nào?", type : "info", showCancelButton :
			 * true, confirmButtonText : "Nâng phiên bản!", cancelButtonText :
			 * "Cập nhật trực tiếp!", closeOnConfirm : true, closeOnCancel :
			 * true }, function(isConfirm) { if (!isConfirm) {
			 * $('#upgradeVersion').val('false'); } choice = "true";
			 * $('#CustomerForm').submit(); });*/ 
		}
	});
});

$(function() {
	$('#symbol').on('input', function() {
		if ($(this).val() == initValueSymbol) {
			$('#serial').val(initValueSerial);
			changeValueFserial(initValueSerial);
			return;
		}
		if (!$(this).val()) {
			$('#serial').val(null);
			changeValueFserial(null);
			return;
		}
		var ajax = $.ajax({
			type : "GET",
			url : contextPath + '/GetMaxSerial',
			data : {
				symbol : $(this).val()
			},
		});
		ajax.done(function(data) {
			$('#symbol')[0].setCustomValidity("");
			$('#serial').val(data + 1);
			changeValueFserial(data + 1);
		});
		ajax.fail(function(data) {
			$('#symbol')[0].setCustomValidity("Oops! Đã xảy ra lỗi...");
			$('#serial').val(initValueSerial);
			changeValueFserial(initValueSerial);
		});
	});
});
$(function() {
	$('#symbol').on('input', function() {
		if ($(this).val() == initValueSymbol) {
			$('#serial').val(initValueSerial);
			changeValueFserial(initValueSerial);
			return;
		}
		if (!$(this).val()) {
			$('#serial').val(null);
			changeValueFserial(null);
			return;
		}
		var ajax = $.ajax({
			type : "GET",
			url : contextPath + '/GetMaxSerial',
			data : {
				symbol : $(this).val()
			},
		});
		ajax.done(function(data) {
			$('#symbol')[0].setCustomValidity("");
			$('#serial').val(data + 1);
			changeValueFserial(data + 1);
		});
		ajax.fail(function(data) {
			$('#symbol')[0].setCustomValidity("Oops! Đã xảy ra lỗi...");
			$('#serial').val(initValueSerial);
			changeValueFserial(initValueSerial);
		});
	});
});
function changeValueFserial(value) {
	if (!value) {
		$("#fserial").val(null);
	} else {	
		$("#fserial").val(formatSerial(value)); 
	}	
}

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
	/*
	 * $('.selectpicker.countrycode').on('loaded.bs.select', function() { var
	 * countrycode = "(+" + $(this).val() + ") "; var input =
	 * $(this).parents('.input-group').find('input'); input.val(countrycode);
	 * });
	 */

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
		$('#changeRequest').attr('style', 'display: none;');
		$('#saveCustomer').removeAttr('style');	
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

/*$(function() {
	var formChange = false;
	$("#CustomerForm").change(function() {
		formChange = true;
	});
	$('.saveCustomer').click(function() {
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
});*/

/*
 * $(function() { $("#txtMST").keypress(function(event) { if (48 <= event.which &&
 * event.which <= 57) return true; event.preventDefault(); }); });
 */

/*
 * function abc() { var length = $('#input-iconic').get(0).files.length; // var
 * arrFile = []; for (var i = 0; i < length; i++) { //
 * arrFile.push($('#input-iconic').get(0).files[i].name); currFile =
 * $('#input-iconic').get(0).files[i].name; alert(currFile); }
 */