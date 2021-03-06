# Unidom Shipment 装运领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-shipment/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-shipment.svg)](https://badge.fury.io/rb/unidom-shipment)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-shipment.svg)](https://gemnasium.com/github.com/topbitdu/unidom-shipment)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Shipment domain model engine includes the Shipment, Shipment Item, Shipment Package, Shipment Package Item, and Shipment Receipt model.
Unidom (统一领域对象模型)是一系列的领域模型引擎。装运领域模型引擎包括装运、装运项、装运包裹、装运包裹项、装运收据的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-shipment'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200210.



## Call the Model

```ruby
shipment       = Unidom::Shipment::Shipment.valid_at.alive.first
shipment_item  = Unidom::Shipment::ShipmentItem.valid_at.alive.first
shipment_items = shipment.items
inventory_item = Unidom::Inventory::GroupedInventoryItem.valid_at.alive.first

shipment_package      = Unidom::Shipment::ShipmentPackage.serial_number_is('X5-20161231-1234').valid_at.alive.first
shipment_package_item = shipment_package.items.create! shipment_item: shipment_item, quantity: 10
shipment_receipt      = shipment_package.receipts.create! shipped: shipment_item.shipped, store_item: inventory_item
```



## Include the Concerns

```ruby
include Unidom::Shipment::Concerns::AsShipped
```

### As Shipped

The As Shipped concern do the following tasks for the includer automatically:
1. Define the has_many :shipment_items macro as: ``has_many :shipment_items, class_name: 'Unidom::Shipment::ShipmentItem', foreign_key: :shipped_id``
2. Define the has_many :shipment_receipts macro as: ``has_many :shipment_receipts, class_name: 'Unidom::Shipment::ShipmentReceipt', foreign_key: :shipped_id``



## Enum codes

### Conveyance enum code

```ruby
Unidom::Shipment::Conveyance::customer_shipment # 客户装运
Unidom::Shipment::Conveyance::customer_return   # 客户退回
Unidom::Shipment::Conveyance::purchase_shipment # 购买装运
Unidom::Shipment::Conveyance::purchase_return   # 进货退回
Unidom::Shipment::Conveyance::transfer          # 转运
Unidom::Shipment::Conveyance::drop_shipment     # 直接装运
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Shipment
  }

end
```



## RSpec examples

```ruby
# spec/models/unidom_spec.rb
require 'unidom/shipment/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/shipment/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/shipment/validators_rspec'
```
