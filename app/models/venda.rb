class Venda < ActiveRecord::Base
  attr_accessible :item_description, :item_price, :merchant_adress, :merchant_name, :purchase_count, :purchaser_name
  validates_presence_of :item_price, :purchase_count
end
