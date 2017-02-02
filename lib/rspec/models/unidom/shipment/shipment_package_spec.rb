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

  end

end
