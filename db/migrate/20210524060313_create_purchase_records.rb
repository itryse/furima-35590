class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.references   :user,    null: false, forign_key: true
      t.references   :product, null: false, forign_key: true
      t.timestamps
    end
  end
end
