namespace :order do
  desc "非表示にしてから1ヶ月経過した注文を削除するタスク"
  task delete: :environment do
    orders = Order.where(display: false).where("updated_at < ?", Time.current.prev_month)
    delete_num = orders.count
    orders.delete_all
    Rails.logger.info "#{delete_num}件の注文を削除しました。"
  end
end
