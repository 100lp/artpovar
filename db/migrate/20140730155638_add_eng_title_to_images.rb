class AddEngTitleToImages < ActiveRecord::Migration
  def change
  	add_column :products, :ename, :text
  	add_column :products, :etext, :text
  end
end
