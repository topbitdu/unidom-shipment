class CreateUnidomShipmentPackages < ActiveRecord::Migration

  def change

    create_table :unidom_shipment_packages, id: :uuid do |t|

      t.string :serial_number, null: true, default: nil, limit: 200

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_shipment_packages, :serial_number

  end

end
