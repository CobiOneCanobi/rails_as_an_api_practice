class StatusSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :item
end
