class AddEngpurchaseToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :epurchase, :text
  end
end
