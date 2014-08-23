class AddPurchaseToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :purchase, :text
  end
end
