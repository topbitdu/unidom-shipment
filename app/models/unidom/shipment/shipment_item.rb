# Shipment Item 是装运项。

class Unidom::Shipment::ShipmentItem < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipment_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: true

  belongs_to :shipment, class_name:  'Unidom::Shipment::Shipment'
  belongs_to :shiped,   polymorphic: true

end
