##
# Shipment Package Item 是装运包裹内容。

class Unidom::Shipment::ShipmentPackageItem < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipment_package_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 1_000_000_000 }

  belongs_to :package,       class_name: 'Unidom::Shipment::ShipmentPackage'
  belongs_to :shipment_item, class_name: 'Unidom::Shipment::ShipmentItem'

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Shipment::ShipmentPackageItem'
