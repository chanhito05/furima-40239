class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_time

  has_one_attached :image


  has_one :order
  has_one :purchase

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_time_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  include ActiveHash::Associations
  belongs_to_active_hash :shipping_cost
  
  def sold_out?   
    purchase.present?
  end
end


