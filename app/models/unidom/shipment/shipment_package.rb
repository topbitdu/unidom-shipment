##
# Shipment Package 是装运包裹。
# #items 是包裹项。
# #receipts 是收据。

class Unidom::Shipment::ShipmentPackage < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipment_packages'

  include Unidom::Common::Concerns::ModelExtension

  validates :serial_number, allow_blank: true, length: { in: 4..columns_hash['serial_number'].limit }

  has_many :items,    class_name: 'Unidom::Shipment::ShipmentPackageItem', foreign_key: :package_id
  has_many :receipts, class_name: 'Unidom::Shipment::ShipmentReceipt',     foreign_key: :package_id

  scope :serial_number_is, ->(serial_number) { where serial_number: serial_number }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Shipment::ShipmentPackage'
