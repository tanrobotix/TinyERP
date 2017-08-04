/*!
 * Bootstrap-select v1.12.2 (http://silviomoreto.github.io/bootstrap-select)
 *
 * Copyright 2013-2017 bootstrap-select
 * Licensed under MIT (https://github.com/silviomoreto/bootstrap-select/blob/master/LICENSE)
 */
 
(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module unless amdModuleId is set
    define(["jquery"], function (a0) {
      return (factory(a0));
    });
  } else if (typeof module === 'object' && module.exports) {
    // Node. Does not work with strict CommonJS, but
    // only CommonJS-like environments that support module.exports,
    // like Node.
    module.exports = factory(require("jquery"));
  } else {
    factory(root["jQuery"]);
  }
}(this, function (jQuery) {

(function ($) {
  $.fn.selectpicker.defaults = {
    noneSelectedText: 'Không có gì để chọn',
    noneResultsText: 'Không tìm thấy kết quả phù hợp {0}',
    countSelectedText: function (numSelected, numTotal) {
      return (numSelected == 1) ? "Đã chọn {0} mục" : "Đã chọn {0} mục";
    },
    maxOptionsText: function (numAll, numGroup) {
      return [
        (numAll == 1) ? 'Đã đạt đến giới hạn (tối đa {n} mục)' : 'Đã đạt đến giới hạn (tối đa {n} mục)',
        (numGroup == 1) ? 'Đã đạt đến giới hạn nhóm (tối đa {n} mục)' : 'Đã đạt đến giới hạn nhóm ({n} mục)'
      ];
    },
    selectAllText: 'Chọn tất cả',
    deselectAllText: 'Bỏ chọn tất cả',
    multipleSeparator: ', '
  };
})(jQuery);


}));
