class Unidom::Shipment::Conveyance < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_conveyance

end
