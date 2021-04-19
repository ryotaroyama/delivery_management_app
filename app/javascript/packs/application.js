// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import $ from 'jquery'
import './jquery.flexselect'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('bootstrap/dist/js/bootstrap')

require('flatpickr')
require('flatpickr/dist/l10n/ja')
require('flatpickr/dist/themes/material_blue.css')

document.addEventListener('turbolinks:load', () => {
  const selectParams = {
    allowMismatch: true,
    inputNameTransform: function (name) {
      return name.replace('order[', '').replace('_', '[')
    },
  }

  $('select.flexselect').flexselect(selectParams)
  flatpickr.localize(flatpickr.l10ns.ja)

  flatpickr('#date-form', {
    disableMobile: true,
  })
})
