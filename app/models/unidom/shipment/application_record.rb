##
# Application record 是模块内所有模型的抽象基类。

class Unidom::Shipment::ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
