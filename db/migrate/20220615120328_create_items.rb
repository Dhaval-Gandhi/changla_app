class CreateItems < ActiveRecord::Migration[7.0]
  def up
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :thick
      t.string :item_id
      t.string :item_af
      t.string :weight
      t.integer :unit
      t.integer :manufactured_by

      t.decimal :copper_price, default: 0.0
      t.decimal :casting_labor, default: 0.0
      t.decimal :burning_per, default: 5.0
      t.decimal :profit_margin, default: 10.0
      t.decimal :net_weight, default: 0.0
      t.decimal :require_rod, default: 0.0


      t.timestamps
    end
  end

  def down
    drop_table :items if table_exists? :items
  end
end
