describe Unidom::Shipment::Shipment, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
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

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :estimated_amount,
      {                                      } => 0,
      { estimated_amount: nil                } => 2,
      { estimated_amount: ''                 } => 2,
      { estimated_amount: '1'                } => 0,
      { estimated_amount: 1                  } => 0,
      { estimated_amount: 'A'                } => 1,
      { estimated_amount: '1.23'             } => 0,
      { estimated_amount: 1.23               } => 0,
      { estimated_amount: '-0.01'            } => 1,
      { estimated_amount: -0.01              } => 1,
      { estimated_amount: '0'                } => 0,
      { estimated_amount: 0                  } => 0,
      { estimated_amount: '0.01'             } => 0,
      { estimated_amount: 0.01               } => 0,
      { estimated_amount: '999_999_999.99'   } => 0,
      { estimated_amount: 999_999_999.99     } => 0,
      { estimated_amount: '1_000_000_000'    } => 1,
      { estimated_amount: 1_000_000_000      } => 1,
      { estimated_amount: '1_000_000_000.01' } => 1,
      { estimated_amount: 1_000_000_000.01   } => 1

    it_behaves_like 'validates', model_attributes, :actual_amount,
      {                                   } => 0,
      { actual_amount: nil                } => 2,
      { actual_amount: ''                 } => 2,
      { actual_amount: '1'                } => 0,
      { actual_amount: 1                  } => 0,
      { actual_amount: 'A'                } => 1,
      { actual_amount: '1.23'             } => 0,
      { actual_amount: 1.23               } => 0,
      { actual_amount: '-0.01'            } => 1,
      { actual_amount: -0.01              } => 1,
      { actual_amount: '0'                } => 0,
      { actual_amount: 0                  } => 0,
      { actual_amount: '0.01'             } => 0,
      { actual_amount: 0.01               } => 0,
      { actual_amount: '999_999_999.99'   } => 0,
      { actual_amount: 999_999_999.99     } => 0,
      { actual_amount: '1_000_000_000'    } => 1,
      { actual_amount: 1_000_000_000      } => 1,
      { actual_amount: '1_000_000_000.01' } => 1,
      { actual_amount: 1_000_000_000.01   } => 1

  end

end
