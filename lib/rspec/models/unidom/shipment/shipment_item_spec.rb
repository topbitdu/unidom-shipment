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

    shipment_attributes = {
      sender_party_id:        SecureRandom.uuid,
      sender_party_type:      'Unidom::Shipment::SenderParty::Mock',
      sender_agent_id:        SecureRandom.uuid,
      sender_agent_type:      'Unidom::Shipment::SenderAgent::Mock',
      sender_location_id:     SecureRandom.uuid,
      sender_location_type:   'Unidom::Shipment::SenderLocation::Mock',
      sender_contact_id:      SecureRandom.uuid,
      sender_contact_type:    'Unidom::Shipment::SenderContact::Mock',
      receiver_party_id:      SecureRandom.uuid,
      receiver_party_type:    'Unidom::Shipment::ReceiverParty::Mock',
      receiver_agent_id:      SecureRandom.uuid,
      receiver_agent_type:    'Unidom::Shipment::ReceiverAgent::Mock',
      receiver_location_id:   SecureRandom.uuid,
      receiver_location_type: 'Unidom::Shipment::ReceiverLocation::Mock',
      receiver_contact_id:    SecureRandom.uuid,
      receiver_contact_type:  'Unidom::Shipment::ReceiverContact::Mock',
      conveyance_code:        'CSSP',
      estimated_ready_on:     Date.current+2.days,
      estimated_shipped_on:   Date.current+3.days,
      estimated_arrived_on:   Date.current+9.days,
      last_cancellable_at:    Time.now+2.days,
      shipped_at:             Time.now+3.days,
      received_at:            Time.now+9.days,
      cancelled_at:           nil,
      estimated_amount:       1_000.00,
      actual_amount:          1_050.00
    }

    it_behaves_like 'belongs_to', model_attributes, :shipment, Unidom::Shipment::Shipment, shipment_attributes

  end

end
