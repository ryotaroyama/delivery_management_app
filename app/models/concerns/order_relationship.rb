module OrderRelationship
  extend ActiveSupport::Concern
  class_methods do
    def delete_garbage
      fk_id = "#{model_name.singular}_id"
      delete_ids = ids - Order.distinct.pluck(fk_id)
      where(id: delete_ids).destroy_all
    end
  end
end
