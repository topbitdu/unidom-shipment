require 'unidom/common/yaml_helper'

module Unidom
  module Shipment

    class Engine < ::Rails::Engine

      isolate_namespace ::Unidom::Shipment

      initializer :load_config_initializers do |app|
        Unidom::Common::YamlHelper.load_enum config: app.config, root: config.root
      end

      initializer :append_migrations do |app|
        config.paths['db/migrate'].expanded.each { |expanded_path| app.config.paths['db/migrate'] << expanded_path } unless app.root.to_s.match root.to_s
      end

    end

  end
end
