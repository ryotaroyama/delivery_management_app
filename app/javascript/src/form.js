import 'flatpickr'
import 'flatpickr/dist/l10n/ja'

export const formSettings = () => {
  const errorMessages = document.querySelectorAll('.error-message')

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

  const validateField = (errorElement, e = undefined) => {
    // セレクタ結合
    const inputElement = errorElement.closest('div').querySelector('input, textarea')
    let errorMessage = ''

    const dataset = errorElement.dataset
    const maxLength = Number(dataset.max)
    const length = inputElement.value.length

    if (dataset.required === 'true' && length === 0) {
      if (dataset.date === 'true') {
        if (e?.type !== 'blur') errorMessage += '日付を選択してください'
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
      (accumulator, errorElement) => validateField(errorElement) && accumulator,
      true
    )
  }

  submit.addEventListener('click', (e) => {
    e.preventDefault()
    if (validateFields()) {
      form.submit()
    }
  })

  errorMessages.forEach((errorElement) => {
    const inputElement = errorElement.closest('div').querySelector('input, textarea')
    inputElement.addEventListener('blur', (e) => validateField(errorElement, e))
  })
}
