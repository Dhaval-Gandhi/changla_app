class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.integer :manufactured_by

      t.timestamps
    end
  end
end
