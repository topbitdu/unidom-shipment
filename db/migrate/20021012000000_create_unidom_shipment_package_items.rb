class CreateUnidomShipmentPackageItems < ActiveRecord::Migration

  def change

    create_table :unidom_shipment_package_items, id: :uuid do |t|

      t.references :package,       type: :uuid, null: false
      t.references :shipment_item, type: :uuid, null: false

      t.decimal :quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shipment_package_items, :package_id
    add_index :unidom_shipment_package_items, :shipment_item_id

  end

end
