class CreateUnidomShipmentReceipts < ActiveRecord::Migration

  def change

    create_table :unidom_shipment_receipts, id: :uuid do |t|

      t.references :package,    type: :uuid, null: false
      t.references :shipped,    type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :store_item, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.decimal :accepted_quantity, null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :rejected_quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.datetime :received_at, null: false, default: nil

      t.text :rejection_reason
      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shipment_receipts, :package_id
    add_index :unidom_shipment_receipts, :shipped_id
    add_index :unidom_shipment_receipts, :store_item_id

  end

end
