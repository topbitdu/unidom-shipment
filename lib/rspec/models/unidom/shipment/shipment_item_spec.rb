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

    it_behaves_like 'validates', model_attributes, :quantity,
      {                              } => 0,
      { quantity: nil                } => 2,
      { quantity: ''                 } => 2,
      { quantity: '1'                } => 0,
      { quantity: 1                  } => 0,
      { quantity: 'A'                } => 1,
      { quantity: '1.23'             } => 0,
      { quantity: 1.23               } => 0,
      { quantity: '-0.01'            } => 1,
      { quantity: -0.01              } => 1,
      { quantity: '0'                } => 0,
      { quantity: 0                  } => 0,
      { quantity: '0.01'             } => 0,
      { quantity: 0.01               } => 0,
      { quantity: '999_999_999.99'   } => 0,
      { quantity: 999_999_999.99     } => 0,
      { quantity: '1_000_000_000'    } => 1,
      { quantity: 1_000_000_000      } => 1,
      { quantity: '1_000_000_000.01' } => 1,
      { quantity: 1_000_000_000.01   } => 1

  end

end
