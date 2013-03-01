class CreateVendas < ActiveRecord::Migration
  def change
    create_table :vendas do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_adress
      t.string :merchant_name

      t.timestamps
    end
  end
end
