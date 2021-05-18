class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belomgs_to :condition
  belomgs_to :postage
  belomgs_to :prefecture
  belomgs_to :day_to_ship

  belomgs_to :user
  has_one_attached :image

  validates :name, :price, :introduction, presence: true

  with_options numericarity: { other_than: 1 } do
    validates :category_id, message: "練習です。カテゴリーを選択してください"
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end