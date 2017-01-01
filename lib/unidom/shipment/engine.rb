module Unidom
  module Shipment

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Shipment

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
