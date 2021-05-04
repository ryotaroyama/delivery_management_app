document.addEventListener('turbolinks:load', () => {
  const displays = document.querySelectorAll('.display')
  const csrfToken = document.querySelector('meta[name=csrf-token]').content
  displays.forEach((display) => {
    display.addEventListener('click', (e) => {
      const orderId = e.target.closest('.order').dataset.id
      fetch(`/orders/${orderId}/display_orders`, {
        method: 'delete',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        },
      })
        .then((response) => response.json())
        .then((data) => {
          // 対応する注文をフロント側から消去
          document.querySelector(`p[data-id="${data.order_id}"]`).remove()
        })
    })
  })
})
