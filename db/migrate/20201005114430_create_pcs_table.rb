class CreatePcsTable < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :cpu_brand
      t.string :cpu_model
      t.integer :ram
      t.string :gpu_brand
      t.string :gpu_model
      t.string :storage_type
      t.string :storage_size
      t.string :psu
      t.string :psu_watts
      t.boolean :psu_80plus
      t.integer :user_id
    end
  end
end
