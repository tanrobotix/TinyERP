$(function() {
	$('#startdate, #finishdate').datetimepicker({
		locale : 'vi',
		format : 'L',
		icons : {
			time : "fa fa-clock-o",
			date : "fa fa-calendar",
			up : "fa fa-chevron-up",
			down : "fa fa-chevron-down",
			previous : 'fa fa-chevron-left',
			next : 'fa fa-chevron-right',
			today : 'fa fa-screenshot',
			clear : 'fa fa-trash',
			close : 'fa fa-remove'
		}
	});
});

$(function() {
	
	$('#searchCustomer').click(function() {
		tableCustomers.ajax.reload();
	});
	
	$('#searchOrders').click(function() {
		tableOrders.ajax.reload();
	});
	
});

function formatSerial(value) {
	if(!value) {
		return null;
	} else {
		value = '' + value;
		var formatSerial = "0000" + value;
		formatSerial = formatSerial.substring(value.length);
	    return formatSerial;
	}
}

function formatTime(time) {
	time = '' + time;
    var strFormatTime = "00" + time;
    strFormatTime = strFormatTime.substring(time.length);
    return strFormatTime;
}

function showAlertError(text="Đã xảy ra lỗi, bạn vui lòng thử lại hoặc liên hệ những người có liên quan để giải quyết!", title="Lỗi !") {
	swal({
		type : 'error',
		title : title,
		html: text
	}).catch(swal.noop)
}

/*
 * function getInfoCustomer(customerid) { var ajax = $.ajax({ type : "GET", url :
 * contextPath + '/GetInfoCustomer', type : "json", data : { "customerid" :
 * customerid } }); ajax.done(function(data) { console.log(data); }); }
 */

function allInOne(request , mode, id) {
	var form = $('<form>', {'action': contextPath + '/AllInOne', 'method': 'POST'})
	.append($('<input>', {'name': 'request', 'value': request, 'type': 'hidden'}))
	.append($('<input>', {'name': 'mode', 'value': mode, 'type': 'hidden'}))
    .append($('<input>', {'name': 'id', 'value': id, 'type': 'hidden'}));
	
	form.appendTo('body').submit();
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

function deleteOrder(orderid) {
	swal(
			{
				title : "Bạn có chắc?",
				text : "Xóa thông tin đơn hàng sẽ xóa các thông tin liên quan đến khách hàng!",
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
							url : contextPath + '/DeleteOrder',
							data : {
								"orderid" : orderid
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
			text : 'Xóa thông tin đơn hàng thành công!',
			title : 'Xóa thành công!',
			/* timer: reloadInSeconds*1000 + 100, */
		}).then(function () {
			tableOrders.ajax.reload();
		})/*
			 * , function (dismiss) { if (dismiss === 'timer') { } })
			 * setInterval(function() {
			 * $('.reverse-countdown').html(--reloadInSeconds); }, 1000);
			 */
				  
	}).catch(swal.noop)
}

// AllInOne page
function saveCustomer(typeRequest) {
	var data = $('#customerForm').serialize();
	var ajax = $.ajax({
					type : "POST",
					url : contextPath + "/SaveCustomer/" + typeRequest,
					data : data
				});
	
	ajax.done(function(customer) {
		swal({
			type : 'success',
			text : 'Thông tin khách hàng được lưu thành công!',
			title : 'Lưu thông tin khách hàng thành công!',
			showCloseButton : true,
		}).then(function () {
			initValueSymbol = customer.symbol;
			initValueType = customer.type.typeid; 
			initValueField = customer.field.fieldid; 
			initValueSerial = formatSerial(customer.serial);
			hasOrders = (customer.sizeorders > 0) ? "true" : "false";
			$('#serial').val(initValueSerial);
			dataCustomerForm = $('#customerForm').serialize();
		}).catch(swal.noop)
	});
	
	ajax.fail(function(jqXHR, textStatus, errorThrown) {
				 showAlertError(jqXHR.responseText, textStatus + " " +
				 jqXHR.status + " !"); 
				 });
				 /*function() {
		showAlertError();*/

}

function saveOrder() {
	var data = $('#orderForm').serialize();
	/*var fdata = new FormData();
	if($("#fileupload")[0].files.length>0)
	       fdata.append("file",$("#fileupload")[0].files[0]);
	var data = new FormData($("#orderForm"));*/
	/*+ '&files%5B0%5D.name=' + 'xyz'*/
	/*console.log($("#fileupload")[0].files[0]);*/
	/*console.log($('#fileupload'));*/
	var ajax = $.ajax({
		
					type : "POST",
					url : contextPath + "/SaveOrder",
					data : data /*+ "&" + $('#fileupload').attr("name") + "=" + $("#fileupload")[0].files[0].name*/
				});
	
	ajax.done(function() {
		swal({
			type : 'success',
			text : 'Thông tin đơn hàng được lưu thành công!',
			title : 'Lưu thông tin đơn hàng thành công!',
			showCloseButton : true,
		}).then(function () {
		}).catch(swal.noop)
	});
	
	ajax.fail(function() {
		showAlertError();
	});

}

/*$(function(){
	$('#saveAll').click(function(e) {
		$('#saveCustomer').click();
	});	
});*/

$(function() {
	$('#orderForm').submit(function(e) {
		e.preventDefault();
		saveOrder();
	});
});

$(function() {
	dataCustomerForm = $('#customerForm').serialize();
	$('#customerForm').submit(function(e) {
		e.preventDefault();
		if (dataCustomerForm === $('#customerForm').serialize()) {
			showAlertError("Bạn chưa thay đổi bất cứ thông tin nào của khách hàng", "Error!")
			return false;
		}
		if (hasOrders === "false") {
			saveCustomer(-1);
		} else {	
			if (initValueSymbol != $('#symbol').val() || initValueType != $('#type').val() || initValueField != $('#field').val()) {
				swal(
						{
							title : "Bạn có chắc?",
							text : "Thông tin các đơn hàng liên quan đến khách hàng sẽ bị đặt lại!",
							type : "warning",
							confirmButtonText : "Vâng!",
							cancelButtonText : "Không",
							showCancelButton : true,
						}).then(function() {
							saveCustomer(0);
				}).catch(swal.noop)
			} else {
				swal(
						{
							title : "Cập nhật khách hàng",
							text : "Bạn muốn cập nhật khách hàng bằng cách nào?",
							type : "question",
							confirmButtonText : "Nâng phiên bản mới!",
							cancelButtonText : "Cập nhật trực tiếp!",
							showCancelButton : true,
						}).then(function() {
							saveCustomer(1);
				}, function (dismiss) {
				    if (dismiss === 'cancel') {
							saveCustomer(2);
				      }
				    }).catch(swal.noop)
			}
		}
	});
});



$(function() {
	$('#symbol').on('input', function() {
		if (!$('#symbol').val()) {
			$('#serial').val(null);
			return true;
		}
		if ($('#symbol').val() == initValueSymbol){
			$('#serial').val(initValueSerial);
			return true;
		}
		var ajax = $.ajax({
			type : "POST",
			url : contextPath + '/GetMaxSerial',
			data : {
				"symbol" : $('#symbol').val()
			},
		});
		ajax.done(function(data) {
			$('#serial').val(formatSerial(data + 1));
		});
		ajax.fail(function(data) {
			showAlertError();
			$('#symbol').val(initValueSymbol);
			$('#serial').val(initValueSerial);
		});
	});
});

/*
 * $(function() { $('#symbol').on('input', function() { if ($(this).val() ==
 * initValueSymbol) { $('#serial').val(initValueSerial);
 * changeValueFserial(initValueSerial); return; } if (!$(this).val()) {
 * $('#serial').val(null); changeValueFserial(null); return; } var ajax =
 * $.ajax({ type : "GET", url : contextPath + '/GetMaxSerial', data : { symbol :
 * $(this).val() }, }); ajax.done(function(data) {
 * $('#symbol')[0].setCustomValidity(""); $('#serial').val(data + 1);
 * changeValueFserial(data + 1); }); ajax.fail(function(data) {
 * $('#symbol')[0].setCustomValidity("Oops! Đã xảy ra lỗi...");
 * $('#serial').val(initValueSerial); changeValueFserial(initValueSerial); });
 * }); });
 */
/*
 * function changeValueFserial(value) { if (!value) { $("#fserial").val(null); }
 * else { $("#fserial").val(formatSerial(value)); } }
 */

function changeValueSerial(value) {
	if (!value) {
		$('#serial').val(null);
	} else {	
		$('#serial').val(formatSerial(value)); 
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

function changeMode(mode) {
	if (mode == 1) { 
		$('fieldset').removeAttr('disabled');
		$('.changeMode').attr('style', 'display: none;');
		$('.save').removeAttr('style');
	}
}

$(function() {
	$('.changeMode').click(function() {	
		$(this).parent().parent().prev().removeAttr('disabled');
		$(this).attr('style', 'display: none;');
		$(this).next().removeAttr('style');
	});
});

/*$(function() {
	$('.changeMode').click(function() {
		changeMode(1);
	});
});*/
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

/*
 * $(function() { var formChange = false; $("#CustomerForm").change(function() {
 * formChange = true; }); $('.saveCustomer').click(function() { if (formChange
 * === true) { swal({ title : "Bạn có chắc?", text : "Thông tin khách hàng của
 * bạn sẽ không thay đổi!", type : "warning", showCancelButton : true,
 * confirmButtonText : "Vâng!", cancelButtonText : "Hủy!", closeOnConfirm :
 * false, closeOnCancel : false }, function(isConfirm) { if (isConfirm) {
 * return; } else { alert("21321321"); } }); } }); });
 */

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