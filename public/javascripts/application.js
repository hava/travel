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
        var parent = element.parent();
        for (var i = 0; i < parent.children().length; i++) {
            parent.children().each(function() {
                $(this).toggleClass("hiddeninline")
            });
        }
        return false;
    });
    return this;
};

$(document).ready(function() {
    $('.inlineedit').inlineedit();
});