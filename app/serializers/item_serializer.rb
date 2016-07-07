class ItemSerializer < ActiveModel::Serializer

  attributes :id, :title, :price

  attribute :published_at, if: :not_banned?
  attribute :status, if: :show_status?
  attribute :seller, if: :show_seller? && :not_banned?
  attribute :description, if: :detailed_item?
  attribute :category, if: :detailed_item?
  attribute :requirements, if: :detailed_item?

  belongs_to :status, if: :show_status?
  belongs_to :seller, if: :show_seller? && :not_banned?
  belongs_to :category, if: :detailed_item?

  def detailed_item?
    true if instance_options[:detailed_item]
  end

  def show_seller?
    true unless instance_options[:no_seller]
  end

  def show_status?
    true unless instance_options[:no_status]
  end

  def not_banned?
    true unless object.status.try(:name) == "Banned"
  end

end
