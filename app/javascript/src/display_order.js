// 表示、非表示だけのクリックイベント
export const removeOrder = async (e) => {
  const orderId = e.target.closest('.order').dataset.id
  const method = location.href.indexOf('?display=none') == -1 ? 'DELETE' : 'POST'
  const csrfToken = document.querySelector('meta[name=csrf-token]').content

  try {
    const response = await fetch(`/orders/${orderId}/display_orders`, {
      method: method,
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
    })
    if (!response.ok) throw new Error('処理に失敗しました。リロードしてお試し下さい。')

    const data = await response.json()

    // 対応する注文をフロント側から消去
    document.querySelector(`div[data-id="${data.order_id}"]`).remove()
  } catch (error) {
    if (error.message === 'Failed to fetch') {
      alert('通信に失敗しました。インターネットの接続状況をご確認下さい。')
    } else {
      alert(error.message)
    }
  }
}
