class Item < ActiveRecord::Base
  belongs_to :seller
  belongs_to :category
  belongs_to :status
end
