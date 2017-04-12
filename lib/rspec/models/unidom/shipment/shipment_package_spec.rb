describe Unidom::Shipment::ShipmentPackage, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      serial_number: '123456789012345678'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :serial_number,
      length: 4..described_class.columns_hash['serial_number'].limit, allow_blank: true

    shipment_package_item_1_attributes = {
      shipment_item_id: SecureRandom.uuid,
      quantity:         10.00
    }

    shipment_package_item_2_attributes = {
      shipment_item_id: SecureRandom.uuid,
      quantity:         20.00
    }

    it_behaves_like 'has_many', model_attributes, :items, Unidom::Shipment::ShipmentPackageItem, [ shipment_package_item_1_attributes, shipment_package_item_2_attributes ]

    shipment_receipt_1_attributes = {
      shipped_id:        SecureRandom.uuid,
      shipped_type:      'Unidom::Shipment::Shipped::Mock',
      store_item_id:     SecureRandom.uuid,
      store_item_type:   'Unidom::Shipment::StoreItem::Mock',
      accepted_quantity: 9,
      rejected_quantity: 1,
      received_at:       Time.now,
      rejection_reason:  'Broken'
    }

    shipment_receipt_2_attributes = {
      shipped_id:        SecureRandom.uuid,
      shipped_type:      'Unidom::Shipment::Shipped::Mock',
      store_item_id:     SecureRandom.uuid,
      store_item_type:   'Unidom::Shipment::StoreItem::Mock',
      accepted_quantity: 10,
      rejected_quantity: 0,
      received_at:       Time.now,
      rejection_reason:  nil
    }

    it_behaves_like 'has_many', model_attributes, :receipts, Unidom::Shipment::ShipmentReceipt, [ shipment_receipt_1_attributes, shipment_receipt_2_attributes ]

  end

end
