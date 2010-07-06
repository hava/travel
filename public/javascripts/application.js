// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// public/javascripts/application.js
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

jQuery.fn.inlineedit = function() {
    var element = this;
    this.click(function() {
        element.parent().children().each(function() {
            $(this).toggleClass("hiddeninline")
        });
        return false;
    });
    return this;
};


$(document).ready(function() {
    $('.inlineedit').inlineedit();
    $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy' });
});

