class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.string :source_location
      t.string :target_location
      t.string :item
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :delivery_partner, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
