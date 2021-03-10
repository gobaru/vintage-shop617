class Shop < ApplicationRecord
  
  with_options presence: true do
    validates :shop_name
    validates :bland
    validates :shop_detail
    validates :image
  end

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  
  def self.search(search)
    if search != ""
      Shop.where('bland LIKE(?)', "%#{search}%")
    else
      Shop.all
    end
  end
end
