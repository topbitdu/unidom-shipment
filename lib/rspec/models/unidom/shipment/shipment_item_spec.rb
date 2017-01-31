describe Unidom::Shipment::ShipmentItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      shipment_id:  SecureRandom.uuid,
      shipped_id:   SecureRandom.uuid,
      shipped_type: 'Unidom::Shipment::Shipped::Mock',
      ordinal:      1,
      quantity:     10.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
