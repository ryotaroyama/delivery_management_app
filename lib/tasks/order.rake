namespace :delete do
  desc '非表示にしてから3ヶ月経過した注文、各テーブルの使用されていないデータを削除するタスク'
  task order: :environment do
    orders = Order.where(display: false).where('updated_at < ?', Time.current.ago(3.months))
    delete_num = orders.count
    orders.delete_all
    Rails.logger.info "#{delete_num}件の注文を削除しました。"

    Customer.delete_garbage
    Product.delete_garbage
    Processor.delete_garbage
    DrawingNumber.delete_garbage
  end

end
