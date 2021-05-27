require 'csv'

class ImportCsv
  REGEX = /\A\d+\z/.freeze

  def self.execute(model:, file_name: nil)
    model_name = model.to_s.classify
    table_name = model_name.tableize
    file_name ||= table_name.singularize

    list = import_csv(file_name)
    model_name.constantize.import!(list, on_duplicate_key_update: :all)
    sql = "select setval('#{table_name}_id_seq',(select max(id) from #{table_name}))"
    ActiveRecord::Base.connection.execute(sql)
  end

  def self.import_csv(file_name)
    path = Rails.root.join("db/csv_data/#{file_name}.csv")
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h.transform_values { |v| REGEX.match?(v) ? v.to_i : v }
    end
    list
  end
end
