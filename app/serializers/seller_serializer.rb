class SellerSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude

  has_many :items
end
