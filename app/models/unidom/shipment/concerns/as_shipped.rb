module Unidom::Shipment::Concerns::AsShipped

  extend ActiveSupport::Concern

  included do |includer|

    has_many :shipment_items,    class_name: 'Unidom::Shipment::ShipmentItem',    foreign_key: :shipped_id
    has_many :shipment_receipts, class_name: 'Unidom::Shipment::ShipmentReceipt', foreign_key: :shipped_id

  end

  module ClassMethods
  end

end
