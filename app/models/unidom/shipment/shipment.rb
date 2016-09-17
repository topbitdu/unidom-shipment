# Shipment 是装运。
# conveyance_code 是运送代码，可以是以下取值：
# CSSP: Customer Shipment 客户装运，把货物发给客户。
# CSRT: Customer Return 客户退回，从购买了产品的客户那里把退回的产品运回来。
# PCSP: Purchase Shipment 购买装运，从供应商那里把购买的货物运进来。
# PCRT: Purchase Return 进货退回，把发来的货物返回给供应商。
# TRSF: Transfer 转运，从内部组织到另一个内部组织调拨。
# DROP: Drop Shipment 直接装运，销售商把产品从供应商那里直接运送给客户。

class Unidom::Shipment::Shipment < Unidom::Shipment::ApplicationRecord

  self.table_name = 'unidom_shipments'

  include Unidom::Common::Concerns::ModelExtension

  validates :estimated_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :actual_amount,    presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :sender_party,    polymorphic: true
  belongs_to :sender_agent,    polymorphic: true
  belongs_to :sender_location, polymorphic: true
  belongs_to :sender_contact,  polymorphic: true

  belongs_to :receiver_party,    polymorphic: true
  belongs_to :receiver_agent,    polymorphic: true
  belongs_to :receiver_location, polymorphic: true
  belongs_to :receiver_contact,  polymorphic: true

  has_many :items, class_name: 'Unidom::Shipment::ShipmentItem'

end
