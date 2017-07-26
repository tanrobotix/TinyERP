$(function(){
	$('.glyphicon-remove').click(function(){
		$(this).closest('tr').remove();
	});
});

$(function(){
	$('#LHDN').on('loaded.bs.select', function(){
		$('#txtLHDN').val($(this).val());
	});
	$('#LHDN').on('changed.bs.select', function(){
		$('#txtLHDN').val($(this).val());
	});
});

$(function(){
	$('#LVHD').on('loaded.bs.select', function(){
		$('#txtLVHD').val($(this).val());
	});
	$('#LVHD').on('changed.bs.select', function(){
		$('#txtLVHD').val($(this).val());
	});
});

$(function(){
	var pos = $('body').scrollTop();
	$('.collapse').on('shown.bs.collapse', function () {
		pos = $('body').scrollTop();
		$('html, body').animate({
			scrollTop: $(this).prev().offset().top - 8
		}, 400);
		$(this).prev().find("i").addClass("fa-sort-desc").removeClass("fa-sort-asc");
	});
	$('.collapse').on('hidden.bs.collapse', function () {
		$('html, body').animate({
			scrollTop: pos
		}, 400);
		$(this).prev().find("i").addClass("fa-sort-asc").removeClass("fa-sort-desc");
	});
});

$(function(){
	$('#addRow').click(function(){
		var selector = $(this).closest('tr');
		var rowCount = $(selector).index() + 1;
		$(selector).before('<tr><td>'+rowCount+'</td><td><input type="text" maxlength="50"></td><td><input type="text" maxlength="50"</td></tr>');
		if (rowCount == 15)
			$(selector).remove();
	});
});

$(function(){
	$('input[data-readonly]').focus(function(){
	  $(this).blur(); 
	});
});

$(function() {
	$('input[data-readonly]')
		.on('invalid', function(){
			return this.setCustomValidity('Không tìm thấy dữ liệu.');
		})
		.on('input', function(){
			return this.setCustomValidity('');
		});
});

$(function(){
	$('#NKT').change(function(){
		$('#TGHT').attr("min", $(this).val());
	});
});

$(function(){
	$('#TGHT').change(function(){
		$('#NKT').attr("max", $(this).val());
	});
});

$(function(){
	$('#TGHT').change(function(){
		$('#NKT').attr("max", $(this).val());
	});
});

function abc(){
	var length = $('#input-iconic').get(0).files.length;
	//var arrFile = [];
    for (var i = 0; i < length; i++) {
        //arrFile.push($('#input-iconic').get(0).files[i].name);
		currFile = $('#input-iconic').get(0).files[i].name;
		alert(currFile);
    }
}