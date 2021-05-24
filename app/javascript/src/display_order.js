// 表示、非表示だけのクリックイベント
export const removeOrder = (e) => {
  const orderId = e.target.closest('.order').dataset.id
  const method = location.href.indexOf('?display=none') == -1 ? 'DELETE' : 'POST'
  const csrfToken = document.querySelector('meta[name=csrf-token]').content

  fetch(`/orders/${orderId}/display_orders`, {
    method: method,
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken,
    },
  })
    .then((response) => response.json())
    .then((data) => {
      // 対応する注文をフロント側から消去
      document.querySelector(`div[data-id="${data.order_id}"]`).remove()
    })
}
