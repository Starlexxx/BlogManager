// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $ from "jquery";

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//require("bootstrap-icons/font/bootstrap-icons.css")

$(document).on('click', '.js-switch-locale', function () {
    const locale = $(this).data('locale')
    document.cookie = `locale=${locale}`
    window.location.reload()
})