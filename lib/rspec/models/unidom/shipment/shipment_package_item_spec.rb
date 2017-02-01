describe Unidom::Shipment::ShipmentPackageItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      package_id:       SecureRandom.uuid,
      shipment_item_id: SecureRandom.uuid,
      quantity:         10.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
