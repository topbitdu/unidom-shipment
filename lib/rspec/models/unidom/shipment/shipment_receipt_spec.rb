describe Unidom::Shipment::ShipmentReceipt, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      package_id:        SecureRandom.uuid,
      shipped_id:        SecureRandom.uuid,
      shipped_type:      'Unidom::Shipment::Shipped::Mock',
      store_item_id:     SecureRandom.uuid,
      store_item_type:   'Unidom::Shipment::StoreItem::Mock',
      accepted_quantity: 9,
      rejected_quantity: 1,
      received_at:       Time.now,
      rejection_reason:  'Broken'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
