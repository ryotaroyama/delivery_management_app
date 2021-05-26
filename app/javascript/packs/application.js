// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import '../src/jquery.flexselect'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { formSettings } from '../src/form'
import { setDataToModal } from '../src/order'
import { removeOrder } from '../src/display_order'

document.addEventListener('turbolinks:load', () => {
  const screens = document.querySelectorAll('.order-name')
  const displays = document.querySelectorAll('.display')

  screens.forEach((screen) => {
    screen.addEventListener('click', (e) => setDataToModal(e))
  })

  displays.forEach((display) => {
    display.addEventListener('click', (e) => removeOrder(e))
  })

  if (document.querySelectorAll('.error-message').length) {
    formSettings()
  }
})
