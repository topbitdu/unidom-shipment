##
# Conveyance 是枚举型的运送代码。

class Unidom::Shipment::Conveyance < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_conveyance

end
