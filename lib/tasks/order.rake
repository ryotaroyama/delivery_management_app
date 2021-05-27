namespace :order do
  desc '非表示にしてから3ヶ月経過した注文を削除するタスク'
  task delete: :environment do
    orders = Order.where(display: false).where('updated_at < ?', Time.current.ago(3.months))
    delete_num = orders.count
    orders.delete_all
    Rails.logger.info "#{delete_num}件の注文を削除しました。"
  end
end
