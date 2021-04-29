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
  // flexselect
  const selectParams = {
    allowMismatch: true,
    inputNameTransform: function (name) {
      return name.replace('order[', '').replace('_', '[')
    },
  }

  $('select.flexselect').flexselect(selectParams)

  // flatpickr
  flatpickr.localize(flatpickr.l10ns.ja)

  flatpickr('#date-form', {
    disableMobile: true,
  })

  // form
  const errorMessages = document.querySelectorAll('.error-message')
  const submit = document.getElementById('submit')

  const validateField = (errorElement) => {
    const inputElement = errorElement.closest('div').querySelector('input, textarea')
    let errorMessage = ''

    const dataset = errorElement.dataset
    const maxLength = Number(dataset.max)
    const length = inputElement.value.length

    if (dataset.required === 'true' && length === 0) {
      if (dataset.date === 'true') {
        errorMessage += '日付を選択してください'
      } else {
        errorMessage += '入力されていません'
      }
    } else if (maxLength && length > maxLength) {
      errorMessage += `${maxLength}字以内で入力してください`
    }
    // } else if (dataset.required == `true` && inputElement.value.length < 20) {
    //   errorMessage += ''
    // } else if (dataset.date == '1' && inputElement.value.length == 0) {
    //   errorMessage += '日付を選択してください'
    // } else if (dataset.date == '1' && inputElement.value.length > 0) {
    //   errorMessage += ''
    // } else if ((dataset.required = 'false' && !inputElement == null)) {
    //   errorMessage += '20字以内で入力してください'
    // } else if ((dataset.required = 'false' && inputElement == null)) {
    //   errorMessage += ''
    // } else if (dataset.required == `true` && inputElement.value.length > 1000) {
    //   errorMessage += '1000字以内で入力してください'
    // } else if (dataset.required == `true` && inputElement.value.length < 1000) {
    //   errorMessage += ''
    // }
    errorElement.textContent = errorMessage
  }

  const validateFields = () => {
    errorMessages.forEach((e) => validateField(e))
  }

  submit.addEventListener('click', (e) => {
    e.preventDefault()
    validateFields()
    // const customerName = document.getElementById(`order_customer_name_flexselect`)
    // const productName = document.getElementById(`order_product_name_flexselect`)
    // const deliveryDate = document.getElementById(`date-form`)
    // const processorName = document.getElementById(`order_processor_name_flexselect`)
    // const drawingNumber = document.getElementById(`order_drawing_number_name`)
    // // const errMsgs = document.querySelectorAll(`.err-msg`)
    // const errMsg = document.getElementById(`err-msg`)
    // if (!customerName.value) {
    //   errMsg.textContent = '入力されていません'
    // } else if (customerName.value.length > 20) {
    //   errMsg.textContent = '20字以内で入力してください'
    // }

    // const proErr = document.getElementById(`pro-err`)
    // if (!productName.value) {
    //   proErr.textContent = '入力されていません'
    // } else if (productName.value.length > 20) {
    //   proErr.textContent = '20字以内で入力してください'
    // }

    // const dateErr = document.getElementById(`date-err`)
    // if (!deliveryDate.value) {
    //   dateErr.textContent = '入力されていません'
    // }

    // const procErr = document.getElementById(`proc-err`)
    // if (!processorName.value) {
    //   procErr.textContent = '入力されていません'
    // } else if (processorName.value.length > 20) {
    //   procErr.textContent = '20字以内で入力してください'
    // }

    // const drawingErr = document.getElementById(`drawing-err`)
    // if (drawingNumber.value.length > 20) {
    //   drawingErr.textContent = '20字以内で入力してください'
    // }
    // // 後続の処理を止める
    // return
  })

  errorMessages.forEach((errorElement) => {
    const inputElement = errorElement.closest('div').querySelector('input, textarea')
    inputElement.addEventListener('blur', () => validateField(errorElement))
  })

  // const customerName = document.getElementById(`order_customer_name_flexselect`)
  // const flexselect = document.querySelectorAll(`.flexselect`)
  // customerName.addEventListener('change', (e) => {
  //   if (customerName.value.length > 20) {
  //     e.textContent = '20字以内で入力してください'
  //   } else {
  //     e.textContent = ''
  //   }
  // })

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
})
