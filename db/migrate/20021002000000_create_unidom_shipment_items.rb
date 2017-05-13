class CreateUnidomShipmentItems < ActiveRecord::Migration

  def change

    create_table :unidom_shipment_items, id: :uuid do |t|

      t.references :shipment, type: :uuid, null: false
      t.references :shipped,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.integer :ordinal,  null: false, default: 0
      t.decimal :quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shipment_items, :shipment_id
    add_index :unidom_shipment_items, :shipped_id

  end

end
