namespace :order_delete do
  desc "非表示にしてから1ヶ月経過した注文を削除するタスク"
  task order_delete: :environment do
    orders = Order.where(display: false).where("updated_at < ?", Time.current.prev_month)
    orders.delete_all
  end
end
