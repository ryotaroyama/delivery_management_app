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
  const screens = document.querySelectorAll('.screen')

  screens.forEach((screen) => {
    screen.addEventListener('click', (e) => {
      const orderProduct = document.getElementById('order-product-name')
      const orderDeliveryDate = document.getElementById('order-delivery-date')
      const orderComment = document.getElementById('order-comment')
      const dataset = e.target.dataset
      orderProduct.textContent = dataset.order_product_name
      orderDeliveryDate.textContent = dataset.order_delivery_date
      orderComment.textContent = dataset.order_comment
    })
  })

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
