class CreateUnidomShipments < ActiveRecord::Migration

  def change

    create_table :unidom_shipments, id: :uuid do |t|

      #t.references :shopper, type: :uuid, null: false,
      #  polymorphic: { null: false, default: '', limit: 200 }
      #t.references :shop,    type: :uuid, null: false,
      #  polymorphic: { null: false, default: '', limit: 200 }

      t.column :conveyance_code, 'char(4)', null: false, default: 'ZZZZ'

      t.date :estimated_ready_on,   null: false, default: nil
      t.date :estimated_shipped_on, null: false, default: nil
      t.date :estimated_arrived_on, null: false, default: nil

      t.decimal :estimated_amount, null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :actual_amount,    null: false, default: 0.0, precision: 12, scale: 2

      t.date :latest_cancelled_on

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    #add_index :unidom_shipments, :shopper_id
    #add_index :unidom_shipments, :shop_id

  end

end
