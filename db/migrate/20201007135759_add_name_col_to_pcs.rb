class AddNameColToPcs < ActiveRecord::Migration
  def change
    add_column :pcs, :name, :string
  end
end
