##
# Shipment 是装运。

class Unidom::Shipment::Shipment < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipments'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  validates :estimated_amount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :actual_amount,    presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000_000 }

  belongs_to :sender_party,    polymorphic: true
  belongs_to :sender_agent,    polymorphic: true
  belongs_to :sender_location, polymorphic: true
  belongs_to :sender_contact,  polymorphic: true

  belongs_to :receiver_party,    polymorphic: true
  belongs_to :receiver_agent,    polymorphic: true
  belongs_to :receiver_location, polymorphic: true
  belongs_to :receiver_contact,  polymorphic: true

  has_many :items, class_name: 'Unidom::Shipment::ShipmentItem'

  code :conveyance, Unidom::Shipment::Conveyance

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Shipment::Shipment'
