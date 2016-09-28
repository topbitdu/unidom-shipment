# Shipment Receipt 是装运收据。
# #package 是装运包裹。
# #shipped 是被装运的产品、货物等。
# #store_item 是对应存储的项。

class Unidom::Shipment::ShipmentReceipt < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipment_receipts'

  include Unidom::Common::Concerns::ModelExtension

  validates :accepted_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :rejected_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000_000 }

  belongs_to :package,    class_name:  'Unidom::Shipment::ShipmentPackage'
  belongs_to :shipped,    polymorphic: true
  belongs_to :store_item, polymorphic: true

  before_validation do
    self.received_at = Time.now if received_at.blank?
  end

end
