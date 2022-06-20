class CreateItemCharges < ActiveRecord::Migration[7.0]
  def up
    create_table :item_charges do |t|
      t.references :item
      t.string :name
      t.decimal :amount, default: 0.0

      t.timestamps
    end
  end

  def down
    drop_table :item_charges if table_exists? :item_charges
  end
end
