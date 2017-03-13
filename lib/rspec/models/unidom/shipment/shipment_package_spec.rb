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

    shipment_package_item_1_attributes = {
      shipment_item_id: SecureRandom.uuid,
      quantity:         10.00
    }

    shipment_package_item_2_attributes = {
      shipment_item_id: SecureRandom.uuid,
      quantity:         20.00
    }

    it_behaves_like 'has_many', model_attributes, :items, Unidom::Shipment::ShipmentPackageItem, [ shipment_package_item_1_attributes, shipment_package_item_2_attributes ]

  end

end
