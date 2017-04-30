# Unidom Shipment Change Log 装运领域模型引擎变更日志

## v0.1
1. Shipment model & migration (20021001000000)
2. Shipment Item model & migration (20021002000000)

## v0.2
1. Shipment Package model & migration (20021011000000)
2. Shipment Package Item model & migration (20021012000000)
3. Shipment Receipt model & migration (20021013000000)
4. Improved the Shipment Item model to add the ``has_many :package_items`` macro

## v0.3
1. As Shipped concern

## v0.3.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v0.3.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v0.4
1. Improved the Shipment Package model & migration to add the optional #``serial_number`` field

## v0.5
1. Improved the Shipment Package model to add the :serial_number_is scope

## v0.5.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v0.6
1. Conveyance enum code
2. Improved the Shipment model to configure the Conveyance enum code

## v0.6.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension concern

## v0.6.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v0.7
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v0.7.1
1. Improved the Shipment model for the validations on the #``estimated_amount`` attribute, & the #actual_amount attribute
2. Improved the Shipment Item model for the validations on the #quantity attribute
3. Improved the Shipment spec for the validations on the #estimated_amount attribute, & the #actual_amount attribute
4. Improved the Shipment Item spec for the validations on the #quantity attribute

## v0.7.2
1. Improved the Shipment Receipt model for the validations on the #accepted_quantity attribute, & the #rejected_quantity attribute
2. Improved the Shipment Receipt spec for the validations on the #accepted_quantity attribute, & the #rejected_quantity attribute

## v0.7.3
1. Improved the Shipment spec for the #conveyance_code attribute
2. Improved the Shipment Item spec for the ``belongs_to :shipment, class_name:  'Unidom::Shipment::Shipment'`` macro

## v0.7.4
1. Improved the Shipment spec for the ``has_many :items, class_name: 'Unidom::Shipment::ShipmentItem'`` macro
2. Improved the Shipment Package spec for the ``has_many :items, class_name: 'Unidom::Shipment::ShipmentPackageItem', foreign_key: :package_id`` macro

## v0.7.5
1. Improved the Shipment model for the validations on the #estimated_amount attribute, & the #actual_amount attribute
2. Improved the Shipment Item model for the validations on the #quantity attribute
3. Improved the Shipment spec for the validations on the #estimated_amount attribute, & the #actual_amount attribute
4. Improved the Shipment Item spec for the validations on the #quantity attribute

## v0.7.6
1. Improve the Shipment Item spec for the ``has_many :package_items, class_name: 'Unidom::Shipment::ShipmentPackageItem', foreign_key: :package_id`` macro
2. Improve the Shipment Package spec for the ``has_many :receipts, class_name: 'Unidom::Shipment::ShipmentReceipt', foreign_key: :package_id`` macro

## v0.7.7
1. Improve the Shipment Package spec for the validations on the #serial_number attribute
2. Improve the Shipment Package Item spec for the validations on the #quantity attribute

## v0.7.8
1. Improve the Shipment Package Item spec for the ``belongs_to :package, class_name: 'Unidom::Shipment::ShipmentPackage'`` macro
2. Improve the Shipment Receipt spec for the ``belongs_to :package, class_name: 'Unidom::Shipment::ShipmentPackage'`` macro
