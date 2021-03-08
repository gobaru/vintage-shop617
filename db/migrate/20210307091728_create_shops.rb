class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name,    null: false
      t.string :bland,        null: false
      t.text :shop_detail,    null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
