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

    it_behaves_like 'validates', model_attributes, :accepted_quantity,
      {                                       } => 0,
      { accepted_quantity: nil                } => 2,
      { accepted_quantity: ''                 } => 2,
      { accepted_quantity: '1'                } => 0,
      { accepted_quantity: 1                  } => 0,
      { accepted_quantity: 'A'                } => 1,
      { accepted_quantity: '1.23'             } => 0,
      { accepted_quantity: 1.23               } => 0,
      { accepted_quantity: '-0.01'            } => 1,
      { accepted_quantity: -0.01              } => 1,
      { accepted_quantity: '0'                } => 0,
      { accepted_quantity: 0                  } => 0,
      { accepted_quantity: '0.01'             } => 0,
      { accepted_quantity: 0.01               } => 0,
      { accepted_quantity: '999_999_999.99'   } => 0,
      { accepted_quantity: 999_999_999.99     } => 0,
      { accepted_quantity: '1_000_000_000'    } => 0,
      { accepted_quantity: 1_000_000_000      } => 0,
      { accepted_quantity: '1_000_000_000.01' } => 1,
      { accepted_quantity: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :rejected_quantity,
      {                                       } => 0,
      { rejected_quantity: nil                } => 2,
      { rejected_quantity: ''                 } => 2,
      { rejected_quantity: '1'                } => 0,
      { rejected_quantity: 1                  } => 0,
      { rejected_quantity: 'A'                } => 1,
      { rejected_quantity: '1.23'             } => 0,
      { rejected_quantity: 1.23               } => 0,
      { rejected_quantity: '-0.01'            } => 1,
      { rejected_quantity: -0.01              } => 1,
      { rejected_quantity: '0'                } => 0,
      { rejected_quantity: 0                  } => 0,
      { rejected_quantity: '0.01'             } => 0,
      { rejected_quantity: 0.01               } => 0,
      { rejected_quantity: '999_999_999.99'   } => 0,
      { rejected_quantity: 999_999_999.99     } => 0,
      { rejected_quantity: '1_000_000_000'    } => 0,
      { rejected_quantity: 1_000_000_000      } => 0,
      { rejected_quantity: '1_000_000_000.01' } => 1,
      { rejected_quantity: 1_000_000_000.01   } => 1

  end

end
