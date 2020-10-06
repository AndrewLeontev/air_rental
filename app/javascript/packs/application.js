// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap';
import "@fortawesome/fontawesome-free/js/all";
import 'select2'
import 'select2/dist/css/select2.css'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-ui");
require("jquery-ui/themes/base/all.css");
require("jquery-datetimepicker");

import datepickerFactory from 'jquery-datepicker';
import datepickerRUFactory from 'jquery-datepicker/i18n/jquery.ui.datepicker-ru';

datepickerFactory($);
if (current_user_locale && current_user_locale === 'ru') {
  datepickerRUFactory($);
}

var jQuery = require("jquery");

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

global.toastr = require("toastr")
toastr.options.progressBar = true;
toastr.options.closeButton = true;
toastr.options.positionClass = 'toast-top-full-width';

require("bootstrap");
require('select2');
require('packs/main.js')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
