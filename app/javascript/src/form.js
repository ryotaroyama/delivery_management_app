document.addEventListener('turbolinks:load', () => {
  const errorMessages = document.querySelectorAll('.error-message')
  if (!errorMessages.length) {
    return
  }
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
  const form = document.querySelector('form')
  const submit = document.getElementById('submit')

  const validateField = (errorElement) => {
    // セレクタ結合
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
    errorElement.textContent = errorMessage
    return errorMessage === ''
    // この場合true、違うならfalse
  }

  const validateFields = () => {
    return Array.from(errorMessages).reduce(
      (accumulator, currentValue) => validateField(currentValue) && accumulator,
      true
    )
    // let array = Array.from(errorMessages).map((e) => validateField(e))
    // return !array.includes(false)

    // let array = []
    // errorMessages.forEach((e) => {
    //   array.push(validateField(e))
    // })

    // 全てエラーがなければ true, エラーがあれば false を返す
  }

  submit.addEventListener('click', (e) => {
    e.preventDefault()
    if (validateFields()) {
      form.submit()
    }
  })

  errorMessages.forEach((errorElement) => {
    const inputElement = errorElement.closest('div').querySelector('input, textarea')
    inputElement.addEventListener('blur', () => validateField(errorElement))
  })

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
