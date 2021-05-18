class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string      :name
      t.integer     :category_id
      t.integer     :price
      t.text        :introduction
      t.integer     :condition_id
      t.integer     :postage_id
      t.integer     :prefecture_id
      t.integer     :day_to_ship_id
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
