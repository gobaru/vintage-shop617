class Shop < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :shop_name
    validates :bland
    validates :shop_detail
    validates :image
  end
end
