export const setDataToModal = (e) => {
  const orderProduct = document.getElementById('order-product-name')
  const orderDeliveryDate = document.getElementById('order-delivery-date')
  const orderComment = document.getElementById('order-comment')
  const dataset = e.target.dataset
  orderProduct.textContent = dataset.order_product_name
  orderDeliveryDate.textContent = dataset.order_delivery_date
  orderComment.textContent = dataset.order_comment
}
