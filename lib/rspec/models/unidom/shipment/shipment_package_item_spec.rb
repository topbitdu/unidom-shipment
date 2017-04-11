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

    it_behaves_like 'validates numericality', model_attributes, :quantity,
      range: 0..1_000_000_000, minimum_inclusive: false, maximum_inclusive: false

  end

end
